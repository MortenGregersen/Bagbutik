import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

/// A renderer which renders one of schemas
public class OneOfSchemaRenderer {
    /**
     Render an one of schema

     - Parameters:
        - name: The name of the one of schema
        - oneOfSchema: The one of schema to render
     - Returns: The rendered one of schema
     */
    public func render(name: String, oneOfSchema: OneOfSchema) throws -> String {
        let context = Self.oneOfContext(for: oneOfSchema, named: name)
        let rendered = try environment.renderTemplate(name: "oneOfTemplate", context: context)
        return try SwiftFormat.format(rendered)
    }

    private let environment = Environment(loader: DictionaryLoader(templates: ["oneOfTemplate":
            """
            public enum {{ name }}: Codable {
                {% for option in options %}
                case {{ option.id }}({{ option.value }}){%
                endfor %}

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

    internal static func oneOfContext(for oneOfSchema: OneOfSchema, named name: String) -> [String: Any] {
        return [
            "name": name,
            "options": oneOfSchema.options
                .map { EnumCase(id: $0.schemaName.lowercasedFirstLetter(), value: $0.schemaName) }
                .sorted { $0.id < $1.id },
        ]
    }
}
