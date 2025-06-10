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

        var enumContent = [String]()
        enumContent.append(renderInitializer(parameters: [.init(prefix: "from", name: "decoder", type: "Decoder")], throwing: true, content: {
            var rendered = ""
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
                throw DecodingError.typeMismatch(
                    \(name).self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown \(name)"))
            }
            """
            return rendered
        }))
        enumContent.append(renderFunction(named: "encode", parameters: [.init(prefix: "to", name: "encoder", type: "Encoder")], throwing: true, content: {
            var rendered = "switch self {\n"
            rendered += options.map { option in
                """
                case let .\(option.id)(value):
                    try value.encode(to: encoder)
                """
            }.joined(separator: "\n")
            rendered += "\n}"
            return rendered
        }))
        let objectRenderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: false)
        for subSchema in subSchemas {
            try await enumContent.append(objectRenderer.render(objectSchema: subSchema, otherSchemas: [:]))
        }
        let protocols = ["Codable", "Sendable"] + oneOfSchema.additionalProtocols
        return renderEnum(named: name,
                          protocols: protocols,
                          cases: options,
                          caseValueIsAssociated: true,
                          content: enumContent.joined(separator: "\n\n"))
    }
}
