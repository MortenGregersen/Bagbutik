import BagbutikDocsCollector
import BagbutikSpecDecoder

/// A renderer which renders plain text schemas
public class PlainTextSchemaRenderer: Renderer {
    /**
     Render an plain text schema

     - Parameters:
        - plainTextSchema: The plain text schema to render
     - Returns: The rendered plain text schema
     */
    public func render(plainTextSchema: PlainTextSchema) throws -> String {
        var rendered = """
        public struct \(plainTextSchema.name): PlainTextResponse {
            public let text: String

            public static func from(text: String) -> \(plainTextSchema.name) {
                return Self.init(text: text)
            }

            public init(text: String) {
                self.text = text
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.text = try container.decode(String.self, forKey: .text)
            }

            private enum CodingKeys: String, CodingKey {
                case text = "text"
            }
        }
        
        """
        if let url = plainTextSchema.url,
           case .object(let objectDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url),
           let abstract = objectDocumentation.abstract {
            rendered = "/// \(abstract)\n" + rendered
        }
        return try format(rendered)
    }
}
