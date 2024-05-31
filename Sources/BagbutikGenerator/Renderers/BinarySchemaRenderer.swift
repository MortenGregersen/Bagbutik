import BagbutikSpecDecoder

/// A renderer which renders binary schemas
public class BinarySchemaRenderer: Renderer {
    /**
     Render an binary schema

     - Parameters:
        - binarySchema: The binary schema to render
     - Returns: The rendered binary schema
     */
    public func render(binarySchema: BinarySchema) throws -> String {
        var rendered = """
        public struct \(binarySchema.name): BinaryResponse {
            public let data: Data

            public static func from(data: Data) -> \(binarySchema.name) {
                return Self.init(data: data)
            }

            public init(data: Data) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.data = try container.decode(Data.self, forKey: .data)
            }

            private enum CodingKeys: String, CodingKey {
                case data = "data"
            }
        }
        """
        if let url = binarySchema.url,
           case .object(let objectDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url),
           let abstract = objectDocumentation.abstract {
            rendered = "/// \(abstract)\n" + rendered
        }
        return try format(rendered)
    }
}
