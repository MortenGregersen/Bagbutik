import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

class AttributesSchemaRenderer {
    func render(attributesSchema: AttributesSchema) throws -> String {
        let context = attributesContext(for: attributesSchema, in: environment)
        let rendered = try environment.renderTemplate(name: "attributesTemplate", context: context)
        return try SwiftFormat.format(rendered)
    }

    private let environment = Environment(loader: DictionaryLoader(templates: [
        "attributesTemplate": """
        public struct Attributes: Codable {
            {% for property in properties %}
            {{ property }}{%
            endfor %}

            public init({{ publicInit }}) {
                {% for propertyName in propertyNames %}
                self.{{ propertyName }} = {{ propertyName }}{%
                endfor %}
            }
            {% if subSchemas.count > 0 %}
                {% for subSchema in subSchemas %}

                    {{ subSchema|indent }}
                {% endfor %}
            {% endif %}
        }
        """,
    ]), extensions: StencilSwiftKit.stencilSwiftEnvironment().extensions)

    private func attributesContext(for attributesSchema: AttributesSchema, in environment: Environment) -> [String: Any] {
        let sortedProperties = attributesSchema.properties.sorted(by: { $0.key < $1.key })
        let publicInit = sortedProperties
            .filter { $0.key != "type" }
            .map { "\($0.key): \($0.value.description.capitalizingFirstLetter())? = nil" }
            .joined(separator: ", ")
        let subSchemas = attributesSchema.properties.compactMap { (_: String, value: PropertyType) -> EnumSchema? in
            guard case .enumSchema(let schema) = value else { return nil }
            return schema
        }
        return [
            "subSchemas": subSchemas.sorted(by: { $0.name < $1.name }).map { enumSchema -> String in
                try! EnumSchemaRenderer().render(enumSchema: enumSchema)
            },
            "properties": sortedProperties.map { property in
                try! PropertyRenderer().render(id: property.key,
                                               type: property.value.description,
                                               optional: true)
            },
            "publicInit": publicInit,
            "propertyNames": sortedProperties.map(\.key),
        ]
    }
}
