import BagbutikSpecDecoder
import Foundation

/// A renderer which renders one of schemas
public class OneOfSchemaRenderer: Renderer {
    /**
     Render an one of schema

     - Parameters:
        - name: The name of the one of schema
        - oneOfSchema: The one of schema to render
     - Returns: The rendered one of schema
     */
    public func render(name: String, oneOfSchema: OneOfSchema) async throws -> String {
        let options = oneOfSchema.options
            .map { EnumCase(id: $0.typeName.lowercasedFirstLetter(), value: $0.typeName) }
            .sorted { $0.id < $1.id }
        let subSchemas: [ObjectSchema] = oneOfSchema.options.compactMap { option in
            guard case .objectSchema(let objectSchema) = option else { return nil }
            return objectSchema
        }

        var rendered = "public init(from decoder: Decoder) throws {\n"
        for item in options.enumerated() {
            let option = item.element
            var renderedOption = """
            if let \(option.id) = try? \(option.value)(from: decoder) {
                self = .\(option.id)(\(option.id))

            """
            if item.offset != 0 {
                renderedOption = "} else " + renderedOption
            }
            rendered += renderedOption
        }
        rendered += """
            } else {
                throw DecodingError.typeMismatch(\(name).self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                     debugDescription: "Unknown \(name)"))
            }
        }

        """
        rendered += """

        public func encode(to encoder: Encoder) throws {
            switch self {

        """
        for option in options {
            rendered += """
            case .\(option.id)(let value):
                try value.encode(to: encoder)

            """
        }
        rendered += """
            }
        }
        """

        let objectRenderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: false)
        var renderedSubSchemas = [String]()
        for subSchema in subSchemas {
            try await renderedSubSchemas.append(objectRenderer.render(objectSchema: subSchema, otherSchemas: [:]))
        }
        if !renderedSubSchemas.isEmpty {
            rendered += "\n\n" + renderedSubSchemas.joined(separator: "\n\n")
        }
        let protocols = ["Codable", "Sendable"] + oneOfSchema.additionalProtocols

        rendered = renderEnum(named: name,
                              protocols: protocols,
                              cases: options,
                              caseValueIsAssociated: true,
                              content: rendered)

        return try format(rendered)
    }
}
