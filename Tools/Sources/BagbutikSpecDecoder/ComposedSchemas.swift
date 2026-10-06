import Foundation

extension Spec.Components {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ComponentKeys.self)
        let definitions = try container.decode([String: SchemaDefinition].self, forKey: .schemas)
        var resolved = [String: Schema]()

        func resolve(_ name: String, visiting: Set<String>) throws -> Schema {
            if let schema = resolved[name] { return schema }
            guard !visiting.contains(name), let definition = definitions[name] else {
                throw DecodingError.dataCorrupted(.init(
                    codingPath: container.codingPath,
                    debugDescription: "Missing or cyclic allOf schema reference '\(name)'"))
            }
            let schema = try definition.resolve { try resolve($0, visiting: visiting.union([name])) }
            resolved[name] = schema
            return schema
        }

        for name in definitions.keys.sorted() {
            _ = try resolve(name, visiting: [])
        }
        schemas = resolved
    }
}

private enum ComponentKeys: String, CodingKey {
    case schemas
}

/// Keeps object compositions until all component references are available.
private indirect enum SchemaDefinition: Decodable {
    case schema(Schema)
    case reference(String, [CodingKey])
    case composition(ObjectSchema, [SchemaDefinition], [CodingKey])

    private enum CodingKeys: String, CodingKey {
        case allOf
        case ref = "$ref"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.allOf) {
            let parts = try container.decode([SchemaDefinition].self, forKey: .allOf)
            guard !parts.isEmpty else {
                throw DecodingError.dataCorruptedError(forKey: .allOf, in: container, debugDescription: "allOf must contain at least one schema")
            }
            self = .composition(try ObjectSchema(from: decoder), parts, decoder.codingPath)
        } else if let reference = try container.decodeIfPresent(String.self, forKey: .ref) {
            self = .reference(reference, decoder.codingPath)
        } else {
            self = .schema(try Schema(from: decoder))
        }
    }

    func resolve(reference: (String) throws -> Schema) throws -> Schema {
        switch self {
        case .schema(let schema):
            return schema
        case .reference(let path, let codingPath):
            let prefix = "#/components/schemas/"
            guard path.hasPrefix(prefix) else {
                throw DecodingError.dataCorrupted(.init(codingPath: codingPath, debugDescription: "Unsupported allOf reference '\(path)'"))
            }
            return try reference(String(path.dropFirst(prefix.count)))
        case .composition(var object, let parts, let codingPath):
            for part in parts {
                guard case .object(let inherited) = try part.resolve(reference: reference) else {
                    throw DecodingError.dataCorrupted(.init(codingPath: codingPath, debugDescription: "allOf supports only object schemas"))
                }
                for (name, property) in inherited.properties {
                    if let existing = object.properties[name], existing != property {
                        throw DecodingError.dataCorrupted(.init(codingPath: codingPath, debugDescription: "Conflicting allOf property '\(name)'"))
                    }
                    object.properties[name] = property
                }
                for name in inherited.requiredProperties where !object.requiredProperties.contains(name) {
                    object.requiredProperties.append(name)
                }
                object.additionalProtocols.formUnion(inherited.additionalProtocols)
            }
            return .object(object)
        }
    }
}
