import BagbutikSpecDecoder
import SwiftFormat

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
        }

        """
        if let url = binarySchema.url,
           case .object(let objectDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url),
           let abstract = objectDocumentation.abstract {
            rendered = "/// \(abstract)\n" + rendered
        }
        return try SwiftFormat.format(rendered)
    }
}
