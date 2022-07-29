import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

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
    public func render(operation: BagbutikSpecDecoder.Operation, in path: Path) throws -> String {
        let documentation = try docsLoader.resolveDocumentationForOperation(withId: operation.id)
        let interpolatablePath = Self.pathParameterRegex.stringByReplacingMatches(
            in: path.path,
            options: [],
            range: NSRange(location: 0, length: path.path.utf16.count),
            withTemplate: #"\\($1)"#)
        let parametersInfo = try OperationParametersInfo(for: operation, in: path, docsLoader: docsLoader)
        let operationName = createOperationName(operation, path: path)
        var rendered = renderExtension(on: "Request") {
            let title = documentation?.title ?? "No overview available"
            var parameters = parametersInfo.pathParameters
            if let requestBody = parametersInfo.requestBody {
                parameters.append(requestBody)
            }
            parameters.append(contentsOf: parametersInfo.parameters)
            var extensionContent = renderDocumentationBlock(title: title) {
                var documentationContent = ""
                if let abstract = documentation?.abstract {
                    documentationContent += abstract + "\n"
                }
                documentationContent += "\n"
                if let discussion = documentation?.discussion {
                    documentationContent += discussion + "\n\n"
                }
                documentationContent += """
                Full documentation:
                <\(self.docsLoader.createUrlForOperation(withId: operation.id))>

                """
                documentationContent += parameters.reduce(into: ["\n"]) { partialResult, parameter in
                    partialResult.append(renderDocumentationParameterLine(name: parameter.name, description: parameter.documentation))
                }.joined(separator: "\n")
                documentationContent += "\n- Returns: A ``Request`` to send to an instance of ``BagbutikService``"
                return documentationContent
            }
            extensionContent += "\n" + renderFunction(
                named: operationName,
                parameters: parameters.map { .init(name: $0.name, type: $0.type, optional: $0.optional) },
                returnType: "Request<\(operation.successResponseType), \(operation.errorResponseType)>",
                static: true,
                deprecated: operation.deprecated) {
                    var funcContent = ".init(path: \"\(interpolatablePath)\", method: .\(operation.method.rawValue)"
                    if operation.requestBody != nil {
                        funcContent += ", requestBody: requestBody"
                    }
                    if !parametersInfo.parameters.isEmpty {
                        funcContent += ", parameters: .init("
                        funcContent += parametersInfo.parameters.reduce(into: [String]()) { partialResult, parameter in
                            partialResult.append("\(parameter.name): \(parameter.name)")
                        }.joined(separator: ",\n")
                        funcContent += ")"
                    }
                    funcContent += ")"
                    return funcContent
                }
            return extensionContent
        }
        if parametersInfo.requiresWrapperStruct {
            rendered += "\n\n"
            rendered += renderStruct(named: operationName) {
                var structContent = [String]()
                if !parametersInfo.fields.isEmpty {
                    structContent.append("""
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
                    structContent.append("""
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
                    structContent.append("""
                    \(renderDocumentationBlock { "Attributes, relationships, and IDs to check for existence." })
                    \(renderEnum(
                        named: "Exist",
                        protocols: ["ExistParameter"],
                        cases: parametersInfo.exists,
                        caseValueIsAssociated: true))
                    """)
                }
                if !parametersInfo.includes.isEmpty {
                    structContent.append("""
                    \(renderDocumentationBlock { "Relationship data to include in the response." })
                    \(renderEnum(
                        named: "Include",
                        rawType: "String",
                        protocols: ["IncludeParameter"],
                        cases: parametersInfo.includes))
                    """)
                }
                if !parametersInfo.sorts.isEmpty {
                    structContent.append("""
                    \(renderDocumentationBlock { "Attributes by which to sort." })
                    \(renderEnum(
                        named: "Sort",
                        rawType: "String",
                        protocols: ["SortParameter"],
                        cases: parametersInfo.sorts))
                    """)
                }
                if parametersInfo.limits.count > 1 {
                    structContent.append("""
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
        return try SwiftFormat.format(rendered)
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
        var pathParameters = [OperationParameter]()
        var requestBody: OperationParameter?
        var parameters = [OperationParameter]()
        let requiresWrapperStruct: Bool

        init(for operation: BagbutikSpecDecoder.Operation, in path: Path, docsLoader: DocsLoader) throws {
            for parameter in operation.parameters ?? [] {
                switch parameter {
                case .fields(let name, let type, let deprecated, let documentation):
                    // In version 1.5 of the spec, `appCategories-get_collection` and `appCategories-get_instance` has two identical `appCategories` fields
                    if fields.contains(where: { $0.id == name }) { break }
                    switch type {
                    case .simple(let type):
                        fields.append(EnumCase(id: name, value: "[\(type.description)]", deprecated: deprecated, documentation: documentation))
                    case .enum(let type, let values):
                        if values.count > 0 {
                            let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                            let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values)
                            let rendered = try! EnumSchemaRenderer(docsLoader: docsLoader)
                                .render(enumSchema: enumSchema, additionalProtocol: "ParameterValue")
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
                        let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values)
                        let rendered = try! EnumSchemaRenderer(docsLoader: docsLoader)
                            .render(enumSchema: enumSchema, additionalProtocol: "ParameterValue")
                        filterSubSchemas[name] = rendered
                        filters.append(EnumCase(id: name, value: "[\(enumName)]", documentation: documentation))
                    }
                    if required {
                        filtersRequired.append("`\(name)`")
                    }
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
                        includes = values.map { EnumCase(id: $0, value: $0) }
                    default:
                        throw OperationRendererError.unknownTypeOfInclude
                    }
                case .sort(let type, _):
                    switch type {
                    case .enum(_, let values):
                        sorts = values.map { sort in
                            let id: String
                            if sort.hasPrefix("-") {
                                id = "\(sort.dropFirst())Descending"
                            } else {
                                id = "\(sort)Ascending"
                            }
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
            let propertiesCount = wrapperProperties.reduce(into: 0) { count, properties in
                count += properties.count
            } + (limits.count > 1 ? limits.count : 0)
            requiresWrapperStruct = propertiesCount > 0

            path.parameters?.forEach { pathParameter in
                pathParameters.append(.init(name: pathParameter.name, type: "String", optional: false, documentation: pathParameter.description.capitalizingFirstLetter()))
            }
            if let requestBody = operation.requestBody {
                self.requestBody = .init(name: "requestBody", type: requestBody.name, optional: false, documentation: requestBody.documentation.capitalizingFirstLetter())
            }
            let operationWrapperName = createOperationName(operation, path: path)
            if fields.count > 0 {
                parameters.append(.init(name: "fields", type: "[\(operationWrapperName).Field]", optional: true, documentation: "Fields to return for included related types"))
            }
            if filters.count > 0 {
                parameters.append(.init(name: "filters", type: "[\(operationWrapperName).Filter]", optional: true, documentation: "Attributes, relationships, and IDs by which to filter"))
            }
            if exists.count > 0 {
                parameters.append(.init(name: "exists", type: "[\(operationWrapperName).Exist]", optional: true, documentation: "Attributes, relationships, and IDs to check for existence"))
            }
            if includes.count > 0 {
                parameters.append(.init(name: "includes", type: "[\(operationWrapperName).Include]", optional: true, documentation: "Relationship data to include in the response"))
            }
            if sorts.count > 0 {
                parameters.append(.init(name: "sorts", type: "[\(operationWrapperName).Sort]", optional: true, documentation: "Attributes by which to sort"))
            }
            if limits.count > 0 {
                let name: String
                let type: String
                let documentation: String
                if limits.count == 1, let limit = limits.first {
                    name = "limit"
                    type = "Int"
                    documentation = limit.documentation!
                } else {
                    name = "limits"
                    type = "[\(operationWrapperName).Limit]"
                    documentation = "Number of resources to return"
                }
                parameters.append(.init(name: name, type: type, optional: true, documentation: documentation))
            }
        }
    }
}

private func createOperationName(_ operation: BagbutikSpecDecoder.Operation, path: Path) -> String {
    operation.name.capitalizingFirstLetter() + path.info.version
}
