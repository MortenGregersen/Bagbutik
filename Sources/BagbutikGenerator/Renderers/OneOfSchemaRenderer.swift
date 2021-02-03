import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

class OneOfSchemaRenderer {
    func render(name: String, oneOfSchema: OneOfSchema, includesFixUps: [String] = []) throws -> String {
        let context = oneOfContext(for: oneOfSchema, named: name, in: environment, includesFixUps: includesFixUps)
        let rendered = try environment.renderTemplate(name: "oneOfTemplate", context: context)
        return try SwiftFormat.format(rendered)
    }

    private let environment = Environment(loader: DictionaryLoader(templates: ["oneOfTemplate":
            """
            public enum {{ name }}: Codable {
                {% for option in options %}
                case {{ option.id }}({{ option.value }}){%
                endfor %}

                {% if subSchemas.count > 0 %}
                    {% for subSchema in subSchemas %}

                        {{ subSchema|indent }}
                    {% endfor %}
                {% endif %}

                public init(from decoder: Decoder) throws {
                    {% for option in options %}
                        {% if forloop.first %}
                        if let {{ option.id }} = try? {{ option.value }}(from: decoder) {
                            self = .{{ option.id }}({{ option.id }}){%
                        else %} } else if let {{ option.id }} = try? {{ option.value }}(from: decoder) {
                            self = .{{ option.id }}({{ option.id }}){%
                        endif %}{%
                    endfor %}
                    } else {
                        throw DecodingError.typeMismatch({{ name }}.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                            debugDescription: "Unknown {{ name  }}"))
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    switch self {
                    {% for option in options %}
                    case .{{ option.id }}(let value):
                        try value.encode(to: encoder){%
                    endfor %}
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case type
                }

                private enum TypeKeys: String, Codable {
                    {% for option in options %}
                    case {{ option.id }}{%
                    endfor %}
                }
            }
            """]), extensions: StencilSwiftKit.stencilSwiftEnvironment().extensions)

    private func oneOfContext(for oneOfSchema: OneOfSchema, named name: String, in environment: Environment, includesFixUps: [String] = []) -> [String: Any] {
        let optionCases: [EnumCase]
        if oneOfSchema.options.count == 1, oneOfSchema.options[0].schemaName == "AppCategory" {
            let relevantFixUps = includesFixUps.filter { $0 != "appCategories" }
            // AppCategoriesResponse and AppCategoryResponse has two cases but they are the same type
            optionCases = relevantFixUps.map { fixUp in
                EnumCase(id: fixUp, value: oneOfSchema.options[0].schemaName)
            }
        } else if oneOfSchema.options.count == 2, oneOfSchema.options.contains(where: { $0.schemaName == "AppCategory" }) {
            // AppInfosResponse and AppInfoResponse has multiple cases with the same type
            optionCases = oneOfSchema.options.map { option -> [EnumCase] in
                if option.schemaName == "AppInfoLocalization" {
                    return [EnumCase(id: "\(option.schemaName.lowercasedFirstLetter())s", value: option.schemaName)]
                } else if option.schemaName == "AppCategory" {
                    return includesFixUps.compactMap {
                        guard $0.lowercased().contains("category") else { return nil }
                        return EnumCase(id: $0, value: option.schemaName)
                    }
                } else {
                    fatalError("Unknown type for option")
                }
            }.flatMap { $0 }
        } else if oneOfSchema.options.count == 2, oneOfSchema.options[0].schemaName == "AppScreenshotSet", oneOfSchema.options[1].schemaName == "AppPreviewSet" {
            // AppStoreVersionLocalizationsResponse doesn't have any fixUps, but they should just be the types with 's' appended
            optionCases = oneOfSchema.options.map { option in
                EnumCase(id: "\(option.schemaName.lowercasedFirstLetter())s", value: option.schemaName)
            }
        } else {
            optionCases = mapOptionCases(for: oneOfSchema.options, includesFixUps: includesFixUps)
        }
        let subSchemas: [String] = oneOfSchema.options.compactMap { option in
            if case .objectSchema(let objectSchema) = option {
                return try! ObjectSchemaRenderer().render(objectSchema: objectSchema)
            }
            return nil
        }
        return ["name": name, "options": optionCases.sorted { $0.id < $1.id }, "subSchemas": subSchemas]
    }

    private func mapOptionCases(for options: [OneOfOption], includesFixUps: [String] = []) -> [EnumCase] {
        return options.map { option in
            var optionName = option.schemaName.lowercasedFirstLetter()
            // ErrorResponse has a special JsonPointer and Parameter type
            // If not these types use the manual overrides and validate the fix
            if optionName != "jsonPointer", optionName != "parameter" {
                let optionNameOverrides = ["buildIcon": "icons",
                                           "bundleIdCapability": "bundleIdCapabilities",
                                           "prereleaseVersion": "preReleaseVersions",
                                           "territory": "territories"]
                optionName = optionNameOverrides[optionName] ?? optionName.appending("s")
                guard includesFixUps.contains(optionName) else { fatalError("No matching fixUp for \(optionName)") }
            }
            return EnumCase(id: optionName, value: option.schemaName)
        }
    }
}
