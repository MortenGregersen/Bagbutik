import BagbutikSpecDecoder

/// A renderer which renders binary schemas
public class BinarySchemaRenderer: Renderer {
    /**
     Render an binary schema

     - Parameters:
        - binarySchema: The binary schema to render
     - Returns: The rendered binary schema
     */
    public func render(binarySchema: BinarySchema) async throws -> String {
        var rendered = """
        public struct \(binarySchema.name): BinaryResponse {
            public let data: Data

            public static func from(data: Data) -> \(binarySchema.name) {
                return Self(data: data)
            }

            public init(data: Data) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decode(Data.self, forKey: "data")
            }
        }
        """
        if let url = binarySchema.url,
           case .object(let objectDocumentation) = try await docsLoader.resolveDocumentationForSchema(withDocsUrl: url),
           let abstract = objectDocumentation.abstract {
            rendered = "/// \(abstract)\n" + rendered
        }
        return rendered
    }
}
