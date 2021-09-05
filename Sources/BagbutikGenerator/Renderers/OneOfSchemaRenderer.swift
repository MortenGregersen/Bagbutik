import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

/// Errors that can occur when rendering a one of schema
public enum OneOfSchemaRendererError: Error {
    /// The type of the option is unknown and needs to be implemented
    case unknownTypeForOption(schemaName: String)
    /// The is no fix up matching the option
    case noMatchingFixUp(optionName: String)
}

extension OneOfSchemaRendererError: Equatable {}

/// A renderer which renders one of schemas
public class OneOfSchemaRenderer {
    /**
     Render an one of schema

     - Parameters:
        - name: The name of the one of schema
        - oneOfSchema: The one of schema to render
        - includesFixUps: Fix ups for the options of the one of schema
     - Returns: The rendered one of schema
     */
    public func render(name: String, oneOfSchema: OneOfSchema, includesFixUps: [String] = []) throws -> String {
        let context = try Self.oneOfContext(for: oneOfSchema, named: name, includesFixUps: includesFixUps)
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

    internal static func oneOfContext(for oneOfSchema: OneOfSchema, named name: String, includesFixUps: [String] = []) throws -> [String: Any] {
        let optionCases: [EnumCase]
        if oneOfSchema.options.count == 1, oneOfSchema.options[0].schemaName == "AppCategory" {
            let relevantFixUps = Set(includesFixUps.filter { $0 != "appCategories" && $0 != "platforms" })
            // AppCategoriesResponse and AppCategoryResponse has two cases but they are the same type
            optionCases = relevantFixUps.map { fixUp in
                EnumCase(id: fixUp, value: oneOfSchema.options[0].schemaName)
            }
        } else if oneOfSchema.options.count >= 2, oneOfSchema.options.contains(where: { $0.schemaName == "AppCategory" }) {
            // AppInfosResponse and AppInfoResponse has multiple cases with the same type
            optionCases = try oneOfSchema.options.map { option -> [EnumCase] in
                if option.schemaName == "AgeRatingDeclaration" || option.schemaName == "App" || option.schemaName == "AppInfoLocalization" {
                    return [EnumCase(id: option.schemaName.lowercasedFirstLetter(), value: option.schemaName)]
                } else if option.schemaName == "AppCategory" {
                    return includesFixUps.compactMap {
                        guard $0.lowercased().contains("category") else { return nil }
                        return EnumCase(id: $0, value: option.schemaName)
                    }
                }
                throw OneOfSchemaRendererError.unknownTypeForOption(schemaName: option.schemaName)
            }.flatMap { $0 }
        } else if oneOfSchema.options.count == 2, oneOfSchema.options[0].schemaName == "AppScreenshotSet", oneOfSchema.options[1].schemaName == "AppPreviewSet" {
            // AppStoreVersionLocalizationsResponse doesn't have any fixUps
            optionCases = oneOfSchema.options.map { option in
                EnumCase(id: option.schemaName.lowercasedFirstLetter(), value: option.schemaName)
            }
        } else if includesFixUps.contains("destinationBranch"), includesFixUps.contains("sourceBranchOrTag") {
            let cases = [EnumCase(id: "destinationBranch", value: "ScmGitReference"),
                         EnumCase(id: "sourceBranchOrTag", value: "ScmGitReference")]
            optionCases = [cases, try mapOptionCases(for: oneOfSchema.options.filter { $0.schemaName != "ScmGitReference" }, includesFixUps: includesFixUps)].flatMap { $0 }
        } else if includesFixUps.contains("primaryRepositories") {
            optionCases = [
                [EnumCase(id: "primaryRepositories", value: "ScmRepository")],
                try mapOptionCases(for: oneOfSchema.options.filter { $0.schemaName != "ScmRepository" }, includesFixUps: includesFixUps),
            ].flatMap { $0 }
        } else if oneOfSchema.options.count == 2, oneOfSchema.options[0].schemaName == "ErrorSourcePointer", oneOfSchema.options[1].schemaName == "ErrorSourceParameter" {
            // ErrorResponse doesn't have any fixUps
            let nameOverrides = ["ErrorSourcePointer": "JsonPointer", "ErrorSourceParameter": "Parameter"]
            optionCases = oneOfSchema.options.map { option in
                EnumCase(id: option.schemaName.lowercasedFirstLetter(), value: nameOverrides[option.schemaName]!)
            }
        } else {
            optionCases = try mapOptionCases(for: oneOfSchema.options, includesFixUps: includesFixUps)
        }
        let subSchemas: [String] = oneOfSchema.options.compactMap { option in
            if case .objectSchema(let objectSchema) = option {
                return try! ObjectSchemaRenderer().render(objectSchema: objectSchema)
            }
            return nil
        }
        return ["name": name, "options": optionCases.sorted { $0.id < $1.id }, "subSchemas": subSchemas]
    }

    private static func mapOptionCases(for options: [OneOfOption], includesFixUps: [String] = []) throws -> [EnumCase] {
        return try options.map { option in
            var optionName = option.schemaName.lowercasedFirstLetter()
            if !includesFixUps.contains(optionName) {
                // Some options are called something else
                let optionNameOverrides = ["appPrice": "prices",
                                           "appPriceTier": "priceTier",
                                           "buildIcon": "icons",
                                           "bundleIdCapability": "bundleIdCapabilities",
                                           "ciMacOsVersion": "macOsVersion",
                                           "ciProduct": "product",
                                           "ciWorkflow": "workflow",
                                           "prereleaseVersion": "preReleaseVersions",
                                           "scmPullRequest": "pullRequest",
                                           "scmRepository": "repository",
                                           "territory": "territories",
                                           "ciXcodeVersion": "xcodeVersion"]
                optionName = optionNameOverrides[optionName] ?? optionName
            }
            if !includesFixUps.contains(optionName) {
                // Some options need to be plural
                optionName = optionName.appending("s")
            }
            guard includesFixUps.contains(optionName) else {
                throw OneOfSchemaRendererError.noMatchingFixUp(optionName: optionName)
            }
            return EnumCase(id: optionName, value: option.schemaName)
        }
    }
}
