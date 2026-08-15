import BagbutikSpecDecoder
import Foundation

/// The dependency graph formed by references between top level OpenAPI schemas.
public struct SchemaReferenceGraph: Sendable {
    /// A strongly connected group of schemas that must stay in the same Swift module.
    public struct Component: Hashable, Sendable {
        public let schemas: [String]

        public init(schemas: [String]) {
            self.schemas = schemas.sorted()
        }
    }

    /// References keyed by the top level schema that declares them.
    public let references: [String: Set<String>]

    public init(schemas: [String: Schema]) {
        let schemaNameByReference = schemas.reduce(into: [String: String]()) { result, entry in
            result[entry.key] = entry.value.name
            result[entry.value.name] = entry.value.name
        }
        references = schemas.values.reduce(into: [:]) { result, schema in
            result[schema.name] = Self.references(in: schema, schemaNameByReference: schemaNameByReference)
        }
    }

    /// Loads and normalizes an OpenAPI document before building its schema graph.
    public init(specFileURL: URL) throws {
        let data = try Data(contentsOf: specFileURL)
        var spec = try JSONDecoder().decode(Spec.self, from: data)
        try spec.applyManualPatches()
        spec.flattenIdenticalSchemas()
        self.init(schemas: spec.components.schemas)
    }

    /// Returns all known schemas reachable from the supplied roots, including roots present in the graph.
    /// Root names that are not present in the graph are ignored.
    public func closure(startingAt roots: some Sequence<String>) -> Set<String> {
        var pending = Array(roots)
        var result = Set<String>()
        while let schema = pending.popLast() {
            guard references[schema] != nil, result.insert(schema).inserted else { continue }
            pending.append(contentsOf: references[schema, default: []])
        }
        return result
    }

    /// Returns strongly connected components in stable lexical order.
    public func stronglyConnectedComponents() -> [Component] {
        var nextIndex = 0
        var indexes = [String: Int]()
        var lowLinks = [String: Int]()
        var stack = [String]()
        var onStack = Set<String>()
        var components = [Component]()

        func visit(_ schema: String) {
            indexes[schema] = nextIndex
            lowLinks[schema] = nextIndex
            nextIndex += 1
            stack.append(schema)
            onStack.insert(schema)

            for dependency in references[schema, default: []].sorted() {
                if indexes[dependency] == nil {
                    visit(dependency)
                    lowLinks[schema] = min(lowLinks[schema]!, lowLinks[dependency]!)
                } else if onStack.contains(dependency) {
                    lowLinks[schema] = min(lowLinks[schema]!, indexes[dependency]!)
                }
            }

            guard lowLinks[schema] == indexes[schema] else { return }
            var schemas = [String]()
            while let member = stack.popLast() {
                onStack.remove(member)
                schemas.append(member)
                if member == schema { break }
            }
            components.append(Component(schemas: schemas))
        }

        for schema in references.keys.sorted() where indexes[schema] == nil {
            visit(schema)
        }
        return components.sorted { $0.schemas[0] < $1.schemas[0] }
    }

    /// Returns the acyclic dependency graph produced by collapsing strongly connected schemas.
    public func collapsedDependencies() -> [Component: Set<Component>] {
        let components = stronglyConnectedComponents()
        let componentBySchema = components.reduce(into: [String: Component]()) { result, component in
            for schema in component.schemas {
                result[schema] = component
            }
        }
        return components.reduce(into: [Component: Set<Component>]()) { result, component in
            result[component] = component.schemas.reduce(into: Set<Component>()) { dependencies, schema in
                for dependency in references[schema, default: []] {
                    guard let dependencyComponent = componentBySchema[dependency], dependencyComponent != component else { continue }
                    dependencies.insert(dependencyComponent)
                }
            }
        }
    }

    /// Returns a dependency first ordering of the collapsed graph.
    public func topologicallySortedComponents() -> [Component] {
        let collapsed = collapsedDependencies()
        var visited = Set<Component>()
        var result = [Component]()

        func visit(_ component: Component) {
            guard visited.insert(component).inserted else { return }
            for dependency in collapsed[component, default: []].sorted(by: { $0.schemas[0] < $1.schemas[0] }) {
                visit(dependency)
            }
            result.append(component)
        }

        for component in collapsed.keys.sorted(by: { $0.schemas[0] < $1.schemas[0] }) {
            visit(component)
        }
        return result
    }

    private static func references(in schema: Schema, schemaNameByReference: [String: String]) -> Set<String> {
        switch schema {
        case .object(let object): references(in: object, schemaNameByReference: schemaNameByReference)
        case .enum, .binary, .plainText: []
        }
    }

    private static func references(in object: ObjectSchema, schemaNameByReference: [String: String]) -> Set<String> {
        object.properties.values.reduce(into: Set<String>()) { result, property in
            result.formUnion(references(in: property.type, schemaNameByReference: schemaNameByReference))
        }
    }

    private static func references(in type: PropertyType, schemaNameByReference: [String: String]) -> Set<String> {
        switch type {
        case .schemaRef(let name), .arrayOfSchemaRef(let name):
            normalizedReference(name, schemaNameByReference: schemaNameByReference).map { [$0] } ?? []
        case .schema(let object), .arrayOfSubSchema(let object):
            references(in: object, schemaNameByReference: schemaNameByReference)
        case .oneOf(_, let oneOf), .arrayOfOneOf(_, let oneOf):
            references(in: oneOf, schemaNameByReference: schemaNameByReference)
        case .dictionary(let value):
            references(in: value, schemaNameByReference: schemaNameByReference)
        case .simple, .constant, .enumSchema, .arrayOfEnumSchema, .arrayOfSimple:
            []
        }
    }

    private static func references(in oneOf: OneOfSchema, schemaNameByReference: [String: String]) -> Set<String> {
        var result = oneOf.options.reduce(into: Set<String>()) { result, option in
            switch option {
            case .schemaRef(let name):
                if let reference = normalizedReference(name, schemaNameByReference: schemaNameByReference) {
                    result.insert(reference)
                }
            case .objectSchema(let object):
                result.formUnion(references(in: object, schemaNameByReference: schemaNameByReference))
            case .simple:
                break
            }
        }
        if let discriminator = oneOf.discriminator {
            for mapping in discriminator.mapping.values {
                if let reference = normalizedReference(mapping, schemaNameByReference: schemaNameByReference) {
                    result.insert(reference)
                }
            }
        }
        return result
    }

    private static func normalizedReference(
        _ reference: String,
        schemaNameByReference: [String: String]
    ) -> String? {
        let unqualified = reference.split(separator: "/").last.map(String.init) ?? reference
        if let schemaName = schemaNameByReference[unqualified] { return schemaName }
        let topLevel = unqualified.split(separator: ".").first.map(String.init) ?? unqualified
        return schemaNameByReference[topLevel]
    }
}
