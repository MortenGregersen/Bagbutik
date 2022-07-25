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
        let context = try operationContext(for: operation, in: path)
        let rendered = try environment.renderTemplate(string: template, context: context)
        return try SwiftFormat.format(rendered)
    }

    private static let pathParameterRegex = try! NSRegularExpression(pattern: #"\{(.*)\}"#, options: [])
    private let template = """
    public extension Request {
        /**
         # {{ title }}
         {% if abstract %}{{ abstract }}
         {% endif %}

         {% if discussion %}
         {{ discussion }}

         {% endif %}Full documentation:
         <{{ url }}>

         {% for parametersDocumentation in parametersDocumentations %}
         {{ parametersDocumentation }}{%
         endfor %}
         {{ parametersDocumentation }}
         {% if fields.count > 0 %}
         - Parameter fields: Fields to return for included related types
         {% endif %}
         {% if filters.count > 0 %}
         - Parameter filters: Attributes, relationships, and IDs by which to filter
         {% endif %}
         {% if exists.count > 0 %}
         - Parameter exists: Attributes, relationships, and IDs to check for existence
         {% endif %}
         {% if includes.count > 0 %}
         - Parameter includes: Relationship data to include in the response
         {% endif %}
         {% if sorts.count > 0 %}
         - Parameter sorts: Attributes by which to sort
         {% endif %}
         {% if limits.count == 1 %}
         - Parameter limit: {{ limits[0].documentation }} - maximum {{ limits[0].maximum }}
         {% endif %}
         {% if limits.count > 1 %}
         - Parameter limits: Number of resources to return
         {% endif %}
         - Returns: A ``Request`` to send to an instance of ``BagbutikService``
        */{% if deprecated %}
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future."){% endif %}
        public static func {{ name|lowerFirstLetter }}({{ parameters }}) -> Request<{{ successResponseType }}, {{ errorResponseType }}> {
            return .init(path: "{{ path }}", method: .{{ method }}{%
                         if hasRequestBodyParameter %}, requestBody: requestBody{% endif %}{%
                         if hasParameters %}, parameters: .init({{ parametersInit }}){% endif %}
            )
        }
    }

    {% if addWrapperStruct %}
    public struct {{ name }} {
        {% if fields %}
        /**
        Fields to return for included related types.
        */
        public enum Field: FieldParameter {
            {% for field in fields %}
            /// {{ field.documentation }}{% if field.deprecated %}
            @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.") {% endif %}
            case {{ field.id }}([{{ field.value }}]){%
            endfor %}


            {{ fieldSubschemas|indent:12," ",false }}
        }
        {% endif %}

        {% if filters %}
        /**
        Attributes, relationships, and IDs by which to filter.
        {% if filtersRequired.count > 0 %}


        Required: {{ filtersRequired }}{% endif %}
        */
        public enum Filter: FilterParameter { {%
            for filter in filters %}
            /// {{ filter.documentation }}
            case {{ filter.id }}([{{ filter.value }}]){%
            endfor %}


            {{ filterSubschemas|indent:12," ",false }}
        }
        {% endif %}

        {% if exists %}
        /**
        Attributes, relationships, and IDs to check for existence.
        */
        public enum Exist: ExistParameter { {%
            for exist in exists %}
            /// {{ exist.documentation }}
            case {{ exist.id }}({{ exist.value }}){%
            endfor %}
        }
        {% endif %}

        {% if includes %}
        /**
        Relationship data to include in the response.
        */
        public enum Include: String, IncludeParameter {
            case {{ includes }}
        }
        {% endif %}

        {% if sorts %}
        /**
        Attributes by which to sort.
        */
        public enum Sort: String, SortParameter { {%
            for sort in sorts %}
            case {{ sort.id }} = "{{ sort.value }}"{%
            endfor %}
        }
        {% endif %}

        {% if limits.count > 1 %}
        /**
        Number of included related resources to return.
        */
        public enum Limit: LimitParameter { {%
            for limit in limits %}
            /// {{ limit.documentation }} - maximum {{ limit.maximum }}
            case {{ limit.name }}(Int){%
            endfor %}
        }
        {% endif %}
    }
    {% endif %}
    """

    internal func operationContext(for operation: BagbutikSpecDecoder.Operation, in path: Path) throws -> [String: Any] {
        let documentation = try docsLoader.resolveDocumentationForOperation(withId: operation.id)
        let url = docsLoader.createUrlForOperation(withId: operation.id)
        let name = operation.name.capitalizingFirstLetter() + path.info.version
        let pathRange = NSRange(location: 0, length: path.path.utf16.count)
        let interpolatablePath = Self.pathParameterRegex.stringByReplacingMatches(in: path.path, options: [], range: pathRange, withTemplate: #"\\($1)"#)

        var fields = [EnumCase]()
        var fieldSubSchemas = [String: String]()
        var filters = [EnumCase]()
        var filterSubSchemas = [String: String]()
        var filtersRequired = [String]()
        var exists = [EnumCase]()
        var includes = [String]()
        var sorts = [EnumCase]()
        var limits = [LimitCase]()
        try operation.parameters?.forEach { parameter in
            switch parameter {
            case .fields(let name, let type, let deprecated, let documentation):
                // In version 1.5 of the spec, `appCategories-get_collection` and `appCategories-get_instance` has two identical `appCategories` fields
                if fields.contains(where: { $0.id == name }) { return }
                switch type {
                case .simple(let type):
                    fields.append(EnumCase(id: name, value: type.description, deprecated: deprecated, documentation: documentation))
                case .enum(let type, let values):
                    if values.count > 0 {
                        let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                        let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values)
                        let rendered = try! EnumSchemaRenderer(docsLoader: docsLoader)
                            .render(enumSchema: enumSchema, additionalProtocol: "ParameterValue")
                        fieldSubSchemas[name] = rendered
                        fields.append(EnumCase(id: name, value: enumName, deprecated: deprecated, documentation: documentation))
                    }
                }
            case .filter(let name, let type, let required, let documentation):
                switch type {
                case .simple(let type):
                    filters.append(EnumCase(id: name, value: type.description, documentation: documentation))
                case .enum(let type, let values):
                    let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                    let enumSchema = EnumSchema(name: enumName, type: type, caseValues: values)
                    let rendered = try! EnumSchemaRenderer(docsLoader: docsLoader)
                        .render(enumSchema: enumSchema, additionalProtocol: "ParameterValue")
                    filterSubSchemas[name] = rendered
                    filters.append(EnumCase(id: name, value: enumName, documentation: documentation))
                }
                if required {
                    filtersRequired.append(name)
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
                    includes = values
                default:
                    throw OperationRendererError.unknownTypeOfInclude
                }
            case .sort(let type, let documentation):
                switch type {
                case .enum(_, let values):
                    sorts = values.map { sort in
                        let id: String
                        if sort.hasPrefix("-") {
                            id = "\(sort.dropFirst())Descending"
                        }
                        else {
                            id = "\(sort)Ascending"
                        }
                        return EnumCase(id: id, value: sort, documentation: documentation)
                    }.sorted(by: { $0.id < $1.id })
                default:
                    throw OperationRendererError.unknownTypeOfSort
                }
            case .limit(let name, let documentation, let maximum):
                limits.append(LimitCase(name: name, documentation: documentation, maximum: maximum))
            }
        }

        var parameters = [String]()
        var parametersInit = [String]()
        var parametersDocumentations = [String]()
        path.parameters?.forEach { pathParameter in
            parameters.append("\(pathParameter.name): String")
            parametersDocumentations.append("- Parameter \(pathParameter.name): \(pathParameter.description.capitalizingFirstLetter())")
        }
        if let requestBody = operation.requestBody {
            parameters.append("requestBody: \(requestBody.name)")
            parametersDocumentations.append("- Parameter requestBody: \(requestBody.documentation.capitalizingFirstLetter())")
        }
        if fields.count > 0 {
            parameters.append("fields: [\(name).Field]? = nil")
            parametersInit.append("fields: fields")
        }
        if filters.count > 0 {
            parameters.append("filters: [\(name).Filter]? = nil")
            parametersInit.append("filters: filters")
        }
        if exists.count > 0 {
            parameters.append("exists: [\(name).Exist]? = nil")
            parametersInit.append("exists: exists")
        }
        if includes.count > 0 {
            parameters.append("includes: [\(name).Include]? = nil")
            parametersInit.append("includes: includes")
        }
        if sorts.count > 0 {
            parameters.append("sorts: [\(name).Sort]? = nil")
            parametersInit.append("sorts: sorts")
        }
        if limits.count == 1 {
            parameters.append("limit: Int? = nil")
            parametersInit.append("limit: limit")
        }
        else if limits.count > 0 {
            parameters.append("limits: [\(name).Limit]? = nil")
            parametersInit.append("limits: limits")
        }

        let wrapperProperties: [[Any]] = [fields, filters, includes, sorts]
        let propertiesCount = wrapperProperties.reduce(into: 0) { count, properties in
            count += properties.count
        } + (limits.count > 1 ? limits.count : 0)
        return ["name": name,
                "deprecated": operation.deprecated,
                "title": documentation?.title ?? "No overview available",
                "abstract": documentation?.abstract ?? "",
                "url": url,
                "discussion": documentation?.discussion?.split(separator: "\n").joined(separator: "\n     ") ?? "",
                "path": interpolatablePath,
                "method": operation.method.rawValue,
                "successResponseType": operation.successResponseType,
                "errorResponseType": operation.errorResponseType,
                "addWrapperStruct": propertiesCount > 0,
                "fields": fields.sorted(by: { $0.id < $1.id }),
                "fieldSubschemas": fieldSubSchemas.sorted(by: { $0.0 < $1.0 }).map(\.value).joined(separator: "\n\n"),
                "filters": filters.sorted(by: { $0.id < $1.id }),
                "filterSubschemas": filterSubSchemas.sorted(by: { $0.0 < $1.0 }).map(\.value).joined(separator: "\n\n"),
                "filtersRequired": filtersRequired.joined(separator: ", "),
                "exists": exists.sorted(by: { $0.id < $1.id }),
                "includes": includes.joined(separator: ", "),
                "sorts": sorts,
                "limits": limits,
                "hasRequestBodyParameter": operation.requestBody != nil,
                "hasParameters": parametersInit.count > 0,
                "parameters": parameters.joined(separator: ",\n"),
                "parametersInit": parametersInit.joined(separator: ",\n"),
                "parametersDocumentations": parametersDocumentations]
    }

    private struct LimitCase {
        let name: String
        let documentation: String
        let maximum: Int

        init(name: String, documentation: String, maximum: Int) {
            self.name = name
            self.documentation = documentation.capitalizingFirstLetter()
            self.maximum = maximum
        }
    }
}
