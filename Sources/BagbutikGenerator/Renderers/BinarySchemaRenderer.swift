import BagbutikDocsCollector
import BagbutikSpecDecoder
import SwiftFormat

/// A renderer which renders binary schemas
public class BinarySchemaRenderer: Renderer {
    let docsLoader: DocsLoader

    public init(docsLoader: DocsLoader) {
        self.docsLoader = docsLoader
    }
    
    /**
     Render an binary schema

     - Parameters:
        - binarySchema: The binary schema to render
     - Returns: The rendered binary schema
     */
    public func render(binarySchema: BinarySchema) throws -> String {
        let context = try binarySchemaContext(for: binarySchema)
        let rendered = try environment.renderTemplate(string: template, context: context)
        return try SwiftFormat.format(rendered)
    }

    private let template = """
    {% if documentation %}/// {{ documentation }}
    {% endif %}public struct {{ name }}: BinaryResponse {
        public let data: Data

        public static func from(data: Data) -> {{ name }} {
            return Self.init(data: data)
        }
    }

    """

    private func binarySchemaContext(for binarySchema: BinarySchema) throws -> [String: Any] {
        var documentation: ObjectDocumentation?
        if let url = binarySchema.url, case .object(let objectDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url) {
            documentation = objectDocumentation
        }
        return [
            "name": binarySchema.name,
            "documentation": documentation?.abstract ?? ""
        ]
    }
}
