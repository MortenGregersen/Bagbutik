import BagbutikSpecDecoder
import Foundation

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
        var rendered = "public enum \(name): Codable {\n"
        let options = oneOfSchema.options
            .map { EnumCase(id: $0.schemaName.lowercasedFirstLetter(), value: $0.schemaName) }
            .sorted { $0.id < $1.id }
        options.forEach {
            rendered += "case \($0.id)(\($0.value))\n"
        }
        rendered += "\npublic init(from decoder: Decoder) throws {\n"
        options.enumerated().forEach {
            let option = $0.element
            var renderedOption = """
            if let \(option.id) = try? \(option.value)(from: decoder) {
                self = .\(option.id)(\(option.id))

            """
            if $0.offset != 0 {
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
        options.forEach {
            rendered += """
            case .\($0.id)(let value):
                try value.encode(to: encoder)

            """
        }
        rendered += """
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }
        }
        """
        return rendered
    }
}
