import BagbutikSpecDecoder
import Foundation
import Stencil
import StencilSwiftKit
import SwiftFormat

/// A renderer which renders object schemas
public class ObjectSchemaRenderer {
    /**
     Render a object schema
     
     - Parameter objectSchema: The object schema to render
     - Parameter includesFixUps: Fix ups for the included related types
     - Returns: The rendered object schema
     */
    public func render(objectSchema: ObjectSchema, includesFixUps: [String] = []) throws -> String {
        let context = objectContext(for: objectSchema, in: environment, includesFixUps: includesFixUps)
        let rendered = try environment.renderTemplate(name: "objectTemplate", context: context)
        return try SwiftFormat.format(rendered)
    }

    private static let constantTemplate = """
    public var {{ id|escapeReservedKeywords }}: String { "{{ value }}" }
    """
    private static let objectTemplate = #"""
    {% if summary %}/**
      {{ summary }}
    
      Full documentation:
      <{{ url }}>{% if discussion %}
      
      {{ discussion }}{% endif %}
    */
    {% elif summary %}/// {{ summary }}
    {% endif %}public struct {{ name|upperFirstLetter }}: Codable{% if isRequest %}, RequestBody{% endif %} {
        {% for property in properties %}
        {% if property.documentation %}/// {{ property.documentation }}
        {% else %}{%
        endif %}{{ property.rendered }}{%
        endfor %}{%
        if hasAttributes %}
        /// {{ attributesDocumentation }}
        public let attributes: Attributes{% if attributesOptional %}?{% endif %}{% endif %}{%
        if hasRelationships %}
        /// {{ relationshipsDocumentation }}
        public let relationships: Relationships{% if relationshipsOptional %}?{% endif %}{% endif %}

        public init({{ publicInit }}) {
            {% for propertyName in propertyNames %}
            self.{{ propertyName.idealName|escapeReservedKeywords }} = {{ propertyName.safeName }}{%
            endfor %}
        }
        {% if needsCustomCoding %}
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self){%
            for codableProperty in codableProperties %}{%
            if codableProperty.optional %}
            {{ codableProperty.name }} = try container.decodeIfPresent({{ codableProperty.type }}.self, forKey: .{{ codableProperty.name }}){%
            else %}
            {{ codableProperty.name }} = try container.decode({{ codableProperty.type }}.self, forKey: .{{ codableProperty.name }}){%
            endif %}{% endfor %}
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self){%
            for codableProperty in codableProperties %}{%
            if codableProperty.optional %}
            try container.encodeIfPresent({{ codableProperty.name }}, forKey: .{{ codableProperty.name }}){%
            else %}
            try container.encode({{ codableProperty.name }}, forKey: .{{ codableProperty.name }}){%
            endif %}{% endfor %}
        }

        private enum CodingKeys: String, CodingKey {
            {% for codingKey in codingKeys %}
            case {{ codingKey }}{%
            endfor %}
        }
        {% endif %}
        {% if subSchemas.count > 0 %}
            {% for subSchema in subSchemas %}

                {{ subSchema|indent }}
            {% endfor %}
        {% endif %}
    }
    """#
    private let environment = Environment(loader: DictionaryLoader(templates: [
        "constantTemplate": constantTemplate,
        "objectTemplate": objectTemplate
    ]), extensions: StencilSwiftKit.stencilSwiftEnvironment().extensions)

    private func objectContext(for objectSchema: ObjectSchema, in environment: Environment, includesFixUps: [String] = []) -> [String: Any] {
        let sortedProperties = objectSchema.properties.sorted { $0.key < $1.key }
        let hasAttributes = objectSchema.subSchemas.contains(where: { if case .attributes = $0 { return true } else { return false } })
        let hasRelationships = objectSchema.subSchemas.contains(where: { if case .relationships = $0 { return true } else { return false } })
        let attributesOptional = !objectSchema.requiredProperties.contains("attributes")
        let relationshipsOptional = !objectSchema.requiredProperties.contains("relationships")
        var initParameters = sortedProperties.filter { $0.key != "type" }
        var codingKeys = sortedProperties.map(\.key)
        var codableProperties = initParameters.map { property in CodableProperty(name: property.key,
                                                                                 type: property.value.description,
                                                                                 optional: !objectSchema.requiredProperties.contains(property.key)) }
        if hasAttributes {
            let name = "attributes"
            let type = "Attributes"
            initParameters.append((key: name, value: PropertyType.schemaRef(type)))
            codingKeys.append(name)
            codableProperties.append(CodableProperty(name: name, type: type, optional: attributesOptional))
        }
        if hasRelationships {
            let name = "relationships"
            let type = "Relationships"
            initParameters.append((key: name, value: PropertyType.schemaRef(type)))
            codingKeys.append(name)
            codableProperties.append(CodableProperty(name: name, type: type, optional: relationshipsOptional))
        }
        let attributesDocumentation = objectSchema.documentation?.properties["attributes"] ?? ""
        let relationshipsDocumentation = objectSchema.documentation?.properties["relationships"] ?? ""
        let publicInit = initParameters
            .map {
                let propertyName = PropertyName(idealName: $0.key)
                var parameter = "\(propertyName.idealName)"
                if propertyName.hasDifferentSafeName {
                    parameter += " \(propertyName.safeName)"
                }
                parameter += ": \($0.value.description.capitalizingFirstLetter())"
                guard !objectSchema.requiredProperties.contains($0.key) else { return parameter }
                return "\(parameter)? = nil"
            }
            .joined(separator: ", ")
        return ["name": objectSchema.name,
                "summary": objectSchema.documentation?.summary ?? "",
                "url": objectSchema.url,
                "discussion": objectSchema.documentation?.discussion ?? "",
                "isRequest": objectSchema.name.hasSuffix("Request"),
                "sortedProperties": sortedProperties,
                "properties": sortedProperties.map { property -> Property in
                    let rendered: String
                    switch property.value {
                    case .constant(let value):
                        rendered = try! environment.renderTemplate(name: "constantTemplate", context: ["id": property.key, "value": value])
                    default:
                        rendered = try! PropertyRenderer().render(id: property.key,
                                                                  type: property.value.description,
                                                                  optional: !objectSchema.requiredProperties.contains(property.key))
                    }
                    let propertyDocumentation = objectSchema.documentation?.properties[property.key]
                    return Property(rendered: rendered, documentation: propertyDocumentation)
                },
                "publicInit": publicInit,
                "propertyNames": initParameters.filter { $0.key != "type" }.map { PropertyName(idealName: $0.key) },
                "needsCustomCoding": sortedProperties.contains(where: { $0.key == "type" }),
                "codingKeys": codingKeys,
                "codableProperties": codableProperties,
                "hasAttributes": hasAttributes,
                "attributesDocumentation": attributesDocumentation,
                "attributesOptional": attributesOptional,
                "hasRelationships": hasRelationships,
                "relationshipsDocumentation": relationshipsDocumentation,
                "relationshipsOptional": relationshipsOptional,
                "subSchemas": objectSchema.subSchemas.map { subSchema -> String in
                    switch subSchema {
                    case .objectSchema(let objectSchema):
                        return try! render(objectSchema: objectSchema)
                    case .enumSchema(let enumSchema):
                        return try! EnumSchemaRenderer().render(enumSchema: enumSchema)
                    case .oneOf(let name, let oneOfSchema):
                        return try! OneOfSchemaRenderer().render(name: name, oneOfSchema: oneOfSchema, includesFixUps: includesFixUps)
                    case .attributes(let objectSchema):
                        return try! render(objectSchema: objectSchema)
                    case .relationships(let objectSchema):
                        return try! render(objectSchema: objectSchema)
                    }

                }]
    }

    private struct Property {
        let rendered: String
        let documentation: String?
    }

    private struct PropertyName {
        let idealName: String
        let safeName: String
        var hasDifferentSafeName: Bool { idealName != safeName }

        init(idealName: String) {
            self.idealName = idealName
            self.safeName = idealName == "self" ? "aSelf" : idealName
        }
    }

    private struct CodableProperty {
        let name: String
        let type: String
        let optional: Bool
    }
}
