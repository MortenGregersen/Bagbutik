import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when rendering an operation
public enum OperationRendererError: Error {
    /// The type of an 'exists' parameter is unknown as needs to be implemented
    case unknownTypeOfExists(name: String)
    /// The type of an 'include' parameter is unknown as needs to be implemented
    case unknownTypeOfInclude
    /// The type of an 'sort' parameter is unknown as needs to be implemented
    case unknownTypeOfSort
}

extension OperationRendererError: Equatable {}

struct OperationParameter {
    let name: String
    let type: String
    let optional: Bool
    let documentation: String
}

/// A renderer which renders operations
public class OperationRenderer: Renderer {
    /**
     Render an operation

     - Parameters:
        - operation: The operation to render
        - path: The path which contains the operation
     - Returns: The rendered operation
     */
    public func render(operation: BagbutikSpecDecoder.Operation, in path: Path) async throws -> String {
        let documentation = try await docsLoader.resolveDocumentationForOperation(withId: operation.id)
        let interpolatablePath = Self.pathParameterRegex.stringByReplacingMatches(
            in: path.path,
            options: [],
            range: NSRange(location: 0, length: path.path.utf16.count),
            withTemplate: #"\\($1)"#)
        let parametersInfo = try await OperationParametersInfo(for: operation, in: path, docsLoader: docsLoader)
        let operationName = operation.getVersionedName(path: path)
        var rendered = await "import Bagbutik_Core\nimport Bagbutik_Models\n\n" + renderExtension(on: "Request") {
            let title = documentation?.title ?? "No overview available"
            var parameters = parametersInfo.pathParameters
            if let requestBody = parametersInfo.requestBody {
                parameters.append(requestBody)
            }
            parameters.append(contentsOf: parametersInfo.parameters)
            var extensionContent = await self.renderDocumentationBlock(title: title) {
                let url = "https://developer.apple.com/documentation/appstoreconnectapi/" + operation.getDocumentationId(path: path)
                var renderedDocumentation = ""
                var documentationContent = [String]()
                if let abstract = documentation?.abstract, !abstract.isEmpty {
                    documentationContent.append(abstract)
                }
                if let discussion = documentation?.discussion, !discussion.isEmpty {
                    documentationContent.append(discussion)
                }
                if documentationContent.isEmpty {
                    renderedDocumentation += "\n"
                }
                documentationContent.append("""
                Full documentation:
                <\(url)>
                """)
                var parametersPart = parameters.reduce(into: [String]()) { partialResult, parameter in
                    partialResult.append(self.renderDocumentationParameterLine(name: parameter.name, description: parameter.documentation))
                }.joined(separator: "\n")
                parametersPart += "\n- Returns: A ``Request`` to send to an instance of ``BagbutikService``"
                documentationContent.append(parametersPart)
                return renderedDocumentation + documentationContent.joined(separator: "\n\n")
            }
            extensionContent += "\n" + renderFunction(
                named: operationName,
                parameters: parameters.map { .init(name: $0.name, type: $0.type, optional: $0.optional) },
                returnType: "Request<\(operation.successResponseType), \(operation.errorResponseType)>",
                static: true,
                addAccessibilityModifier: false,
                deprecated: operation.deprecated) {
                    var funcContent = ""
                    if !parametersInfo.customs.isEmpty {
                        funcContent += "var customs = [String: String]()\n"
                        funcContent += parametersInfo.customs
                            .sorted(by: { $0.key < $1.key })
                            .map { _, value in
                                var valueParameter = value.name
                                if case .enum = value.type {
                                    valueParameter += ".rawValue"
                                }
                                return "if let \(value.name) { customs[\"\(value.name)\"] = \(valueParameter) }\n"
                            }.joined()
                        funcContent += "return "
                    }
                    funcContent += """
                    .init(
                        path: \"\(interpolatablePath)\",
                        method: .\(operation.method.rawValue)
                    """
                    if operation.requestBody != nil {
                        funcContent += ",\n    requestBody: requestBody"
                    }
                    if !parametersInfo.parameters.isEmpty {
                        var parameterKeyValues = parametersInfo.parameters
                            .filter { parameter in
                                !(parameter.name == "limit" && parametersInfo.limits.count == 1 && parametersInfo.limits.first!.id != "limit")
                                    && !parametersInfo.customs.contains(where: { $0.value.name == parameter.name })
                            }
                            .map(\.name)
                            .map { "\($0): \($0)" }
                        if parametersInfo.limits.count == 1, parametersInfo.limits.first!.id != "limit" {
                            parameterKeyValues.append("limits: limit.map { [$0] }")
                        }
                        if !parametersInfo.customs.isEmpty {
                            parameterKeyValues.append("customs: customs")
                        }
                        funcContent += ",\n    parameters: .init("
                        let parameterList = parameterKeyValues.joined(separator: ",\n")
                        if parameterKeyValues.count > 1 {
                            funcContent += "\n\(parameterList.indented(bySpaces: 8))"
                        } else {
                            funcContent += parameterList
                        }
                        funcContent += ")"
                    }
                    funcContent += ")"
                    return funcContent
                }
            return extensionContent
        }
        if parametersInfo.requiresWrapperStruct {
            rendered += "\n\n"
            rendered += try await renderEnumWrapper(named: operationName) {
                var structContent = [String]()
                if !parametersInfo.fields.isEmpty {
                    await structContent.append("""
                    \(renderDocumentationBlock { "Fields to return for included related types." })
                    \(renderEnum(
                        named: "Field",
                        protocols: ["FieldParameter"],
                        cases: parametersInfo.fields.sorted(by: { $0.id < $1.id }),
                        caseValueIsAssociated: true,
                        content: parametersInfo.fieldSubSchemas.sorted(by: { $0.0 < $1.0 }).map(\.value).joined(separator: "\n\n"))
                    )
                    """)
                }
                if !parametersInfo.filters.isEmpty {
                    await structContent.append("""
                    \(renderDocumentationBlock {
                        var documentationContent = "Attributes, relationships, and IDs by which to filter."
                        if !parametersInfo.filtersRequired.isEmpty {
                            documentationContent += "\n\nRequired: \(parametersInfo.filtersRequired.joined(separator: ", "))"
                        }
                        return documentationContent
                    })
                    \(renderEnum(
                        named: "Filter",
                        protocols: ["FilterParameter"],
                        cases: parametersInfo.filters,
                        caseValueIsAssociated: true,
                        content: parametersInfo.filterSubSchemas
                            .sorted(by: { $0.0 < $1.0 })
                            .map(\.value)
                            .joined(separator: "\n\n")))
                    """)
                }
                if !parametersInfo.exists.isEmpty {
                    await structContent.append("""
                    \(renderDocumentationBlock { "Attributes, relationships, and IDs to check for existence." })
                    \(renderEnum(
                        named: "Exist",
                        protocols: ["ExistParameter"],
                        cases: parametersInfo.exists,
                        caseValueIsAssociated: true))
                    """)
                }
                if !parametersInfo.includes.isEmpty {
                    await structContent.append("""
                    \(renderDocumentationBlock { "Relationship data to include in the response." })
                    \(renderEnum(
                        named: "Include",
                        rawType: "String",
                        protocols: ["IncludeParameter", "CaseIterable"],
                        cases: parametersInfo.includes))
                    """)
                }
                if !parametersInfo.sorts.isEmpty {
                    await structContent.append("""
                    \(renderDocumentationBlock { "Attributes by which to sort." })
                    \(renderEnum(
                        named: "Sort",
                        rawType: "String",
                        protocols: ["SortParameter", "CaseIterable"],
                        cases: parametersInfo.sorts))
                    """)
                }
                for (_, value) in parametersInfo.customs.sorted(by: { $0.key < $1.key }) {
                    guard case .enum(let type, let values) = value.type else { break }
                    let enumName = value.name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                    let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values, additionalProtocols: ["ParameterValue"])
                    let rendered = try await EnumSchemaRenderer(docsLoader: docsLoader)
                        .render(enumSchema: enumSchema)
                    await structContent.append("""
                    \(renderDocumentationBlock { value.documentation.capitalizingFirstLetter() })
                    \(rendered)
                    """)
                }
                if !parametersInfo.limits.isEmpty, !(parametersInfo.limits.count == 1 && parametersInfo.limits.first!.id == "limit") {
                    await structContent.append("""
                    \(renderDocumentationBlock { "Number of included related resources to return." })
                    \(renderEnum(
                        named: "Limit",
                        protocols: ["LimitParameter"],
                        cases: parametersInfo.limits,
                        caseValueIsAssociated: true))
                    """)
                }
                return structContent.joined(separator: "\n\n")
            }
        }
        return rendered
    }

    private static let pathParameterRegex = try! NSRegularExpression(pattern: #"\{(.*)\}"#, options: [])

    private struct OperationParametersInfo {
        var fields = [EnumCase]()
        var fieldSubSchemas = [String: String]()
        var filters = [EnumCase]()
        var filterSubSchemas = [String: String]()
        var filtersRequired = [String]()
        var exists = [EnumCase]()
        var includes = [EnumCase]()
        var sorts = [EnumCase]()
        var limits = [EnumCase]()
        var customs: [String: (name: String, type: BagbutikSpecDecoder.Operation.Parameter.ParameterValueType, documentation: String)] = [:]
        var pathParameters = [OperationParameter]()
        var requestBody: OperationParameter?
        var parameters = [OperationParameter]()
        let requiresWrapperStruct: Bool

        init(for operation: BagbutikSpecDecoder.Operation, in path: Path, docsLoader: DocsLoader) async throws {
            for parameter in operation.parameters ?? [] {
                switch parameter {
                case .fields(let name, let type, let deprecated, let documentation):
                    // In version 1.5 of the spec, `appCategories-get_collection` and `appCategories-get_instance` has two identical `appCategories` fields
                    if fields.contains(where: { $0.id == name }) { break }
                    switch type {
                    case .simple(let type):
                        fields.append(EnumCase(id: name, value: "[\(type.description)]", deprecated: deprecated, documentation: documentation))
                    case .enum(let type, let values):
                        if !values.isEmpty {
                            let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                            let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values, additionalProtocols: ["ParameterValue"])
                            let rendered = try await EnumSchemaRenderer(docsLoader: docsLoader)
                                .render(enumSchema: enumSchema)
                            fieldSubSchemas[name] = rendered
                            fields.append(EnumCase(id: name, value: "[\(enumName)]", deprecated: deprecated, documentation: documentation))
                        }
                    }
                case .filter(let name, let type, let required, let documentation):
                    switch type {
                    case .simple(let type):
                        filters.append(EnumCase(id: name, value: "[\(type.description)]", documentation: documentation))
                    case .enum(let type, let values):
                        let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                        let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values, additionalProtocols: ["ParameterValue"])
                        let rendered = try await EnumSchemaRenderer(docsLoader: docsLoader)
                            .render(enumSchema: enumSchema)
                        filterSubSchemas[name] = rendered
                        filters.append(EnumCase(id: name, value: "[\(enumName)]", documentation: documentation))
                    }
                    if required {
                        filtersRequired.append("`\(name)`")
                    }
                case .custom(let name, let type, let documentation):
                    customs[name] = (name: name, type: type, documentation: documentation)
                case .exists(let name, let type, let documentation):
                    switch type {
                    case .simple(let type):
                        exists.append(EnumCase(id: name, value: type.description, documentation: documentation))
                    default:
                        throw OperationRendererError.unknownTypeOfExists(name: name)
                    }
                case .include(let type):
                    switch type {
                    case .enum(_, let values):
                        includes.insert(contentsOf: values.map { EnumCase(id: $0, value: $0) }, at: 0)
                    default:
                        throw OperationRendererError.unknownTypeOfInclude
                    }
                case .sort(let type, _):
                    switch type {
                    case .enum(_, let values):
                        sorts = values.map { sort in
                            let id = sort.hasPrefix("-") ? "\(sort.dropFirst())Descending" : "\(sort)Ascending"
                            return EnumCase(id: id, value: sort)
                        }.sorted(by: { $0.id < $1.id })
                    default:
                        throw OperationRendererError.unknownTypeOfSort
                    }
                case .limit(let name, let documentation, let maximum):
                    limits.append(.init(id: name, value: "Int", documentation: "\(documentation) - maximum \(maximum)"))
                }
            }

            let wrapperProperties: [[Any]] = [fields, filters, includes, sorts]
            let propertiesCount = wrapperProperties.reduce(into: 0) { $0 += $1.count }
                + customs.reduce(into: 0) {
                    guard case .enum = $1.value.type else { return }
                    $0 += 1
                }
                + (limits.count > 1 ? limits.count : 0)
            requiresWrapperStruct = propertiesCount > 0

            path.parameters?.forEach { pathParameter in
                pathParameters.append(.init(name: pathParameter.name, type: "String", optional: false, documentation: pathParameter.description.capitalizingFirstLetter()))
            }
            if let requestBody = operation.requestBody {
                self.requestBody = .init(name: "requestBody", type: requestBody.name, optional: false, documentation: requestBody.documentation.capitalizingFirstLetter())
            }
            let operationWrapperName = operation.getVersionedName(path: path)
            if !fields.isEmpty {
                parameters.append(.init(name: "fields", type: "[\(operationWrapperName).Field]", optional: true, documentation: "Fields to return for included related types"))
            }
            if !filters.isEmpty {
                parameters.append(.init(name: "filters", type: "[\(operationWrapperName).Filter]", optional: true, documentation: "Attributes, relationships, and IDs by which to filter"))
            }
            if !exists.isEmpty {
                parameters.append(.init(name: "exists", type: "[\(operationWrapperName).Exist]", optional: true, documentation: "Attributes, relationships, and IDs to check for existence"))
            }
            if !includes.isEmpty {
                parameters.append(.init(name: "includes", type: "[\(operationWrapperName).Include]", optional: true, documentation: "Relationship data to include in the response"))
            }
            if !sorts.isEmpty {
                parameters.append(.init(name: "sorts", type: "[\(operationWrapperName).Sort]", optional: true, documentation: "Attributes by which to sort"))
            }
            for (key, value) in customs.sorted(by: { $0.key < $1.key }) {
                let type = switch value.type {
                case .simple(let simpleType):
                    simpleType.description
                case .enum:
                    "\(operationWrapperName).\(value.name.capitalizingFirstLetter())"
                }
                parameters.append(.init(name: key, type: type, optional: true, documentation: value.documentation))
            }
            if !limits.isEmpty {
                let name = limits.count == 1 ? "limit" : "limits"
                let type = if limits.count == 1, limits.first!.id == "limit" {
                    "Int"
                } else {
                    limits.count == 1 ? "\(operationWrapperName).Limit" : "[\(operationWrapperName).Limit]"
                }
                let documentation = limits.count == 1 ? limits.first!.documentation! : "Number of resources to return"
                parameters.append(.init(name: name, type: type, optional: true, documentation: documentation))
            }
        }
    }
}
