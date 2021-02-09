import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

public class OperationRenderer: Renderer {
    override public init() {}

    public func render(operation: BagbutikSpecDecoder.Operation, in path: Path) throws -> String {
        let rendered = try environment.renderTemplate(string: template, context: operationContext(for: operation, in: path))
        return try SwiftFormat.format(rendered)
    }

    private static let pathParameterRegex = try! NSRegularExpression(pattern: #"\{(.*)\}"#, options: [])
    private let template = """
    public extension Request {
        {% if addWrapperStruct %}
        struct {{ name }} {
            {% if fields %}
            /**
            Fields to return for included related types.
            */
            public enum Field: FieldParameter {
                {% for field in fields %}
                /// {{ field.description }}
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
                /// {{ filter.description }}
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
                /// {{ exist.description }}
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
                /// {{ limit.description }} - maximum {{ limit.maximum }}
                case {{ limit.name }}(Int){%
                endfor %}
            }
            {% endif %}
        }
        {% endif %}

        /**
         # {{ documentation.title }}
         {{ documentation.summary }}

         Full documentation:
         <{{ documentation.url }}>

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
         - Parameter limit: {{ limits[0].description }} - maximum {{ limits[0].maximum }}
        {% endif %}
        {% if limits.count > 1 %}
         - Parameter limits: Number of resources to return
        {% endif %}
         - Returns: A `Request` with to send to an instance of `BagbutikService`
        */
        public static func {{ name|lowerFirstLetter }}({{ parameters }}) -> Request<{{ successResponseType }}, {{ errorResponseType }}> {
            return .init(path: "{{ path }}", method: .{{ method }}{%
                         if hasRequestBodyParameter %}, requestBody: requestBody{% endif %}{%
                         if hasParameters %}, parameters: .init({{ parametersInit }}){% endif %}
            )
        }
    }
    """

    private func operationContext(for operation: BagbutikSpecDecoder.Operation, in path: Path) -> [String: Any] {
        let name = operation.name.capitalizingFirstLetter()
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
        operation.parameters?.forEach { parameter in
            switch parameter {
            case .fields(let name, let type, let description):
                switch type {
                case .simple(let type):
                    fields.append(EnumCase(id: name, value: type.description, description: description))
                case .enum(let type, let values):
                    let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                    let enumSchema = EnumSchema(type: type, values: values, name: enumName)
                    let rendered = try! EnumSchemaRenderer().render(enumSchema: enumSchema,
                                                                    additionalProtocol: "ParameterValue")
                    fieldSubSchemas[name] = rendered
                    fields.append(EnumCase(id: name, value: enumName, description: description))
                }
            case .filter(let name, let type, let required, let description):
                switch type {
                case .simple(let type):
                    filters.append(EnumCase(id: name, value: type.description, description: description))
                case .enum(let type, let values):
                    let enumName = name.split(separator: ".").map { $0.capitalizingFirstLetter() }.joined()
                    let enumSchema = EnumSchema(type: type, values: values, name: enumName)
                    let rendered = try! EnumSchemaRenderer().render(enumSchema: enumSchema,
                                                                    additionalProtocol: "ParameterValue")
                    filterSubSchemas[name] = rendered
                    filters.append(EnumCase(id: name, value: enumName, description: description))
                }
                if required {
                    filtersRequired.append(name)
                }
            case .exists(let name, let type, let description):
                switch type {
                case .simple(let type):
                    exists.append(EnumCase(id: name, value: type.description, description: description))
                default:
                    fatalError("Unknown type of exists")
                }
            case .include(let type):
                switch type {
                case .enum(_, let values):
                    includes = values
                default:
                    fatalError("Unknown type of include")
                }
            case .sort(let type, let description):
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
                        return EnumCase(id: id, value: sort, description: description)
                    }.sorted(by: { $0.id < $1.id })
                default:
                    fatalError("Unknown type of sort")
                }
            case .limit(let name, let description, let maximum):
                limits.append(LimitCase(name: name, description: description, maximum: maximum))
            }
        }

        var parameters = [String]()
        var parametersInit = [String]()
        var parametersDocumentations = [String]()
        path.parameters?.forEach { pathParameter in
            parameters.append("\(pathParameter.name): String")
            parametersDocumentations.append(" - Parameter \(pathParameter.name): \(pathParameter.description.capitalizingFirstLetter())")
        }
        if let requestBody = operation.requestBody {
            parameters.append("requestBody: \(requestBody.name)")
            parametersDocumentations.append(" - Parameter requestBody: \(requestBody.description.capitalizingFirstLetter())")
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
                "documentation": operation.documentation,
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
        let description: String
        let maximum: Int

        init(name: String, description: String, maximum: Int) {
            self.name = name
            self.description = description.capitalizingFirstLetter()
            self.maximum = maximum
        }
    }
}
