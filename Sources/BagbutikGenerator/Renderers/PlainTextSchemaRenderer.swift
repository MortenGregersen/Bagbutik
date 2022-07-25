import BagbutikDocsCollector
import BagbutikSpecDecoder
import SwiftFormat

/// A renderer which renders plain text schemas
public class PlainTextSchemaRenderer: Renderer {
    let docsLoader: DocsLoader

    public init(docsLoader: DocsLoader) {
        self.docsLoader = docsLoader
    }

    /**
     Render an plain text schema

     - Parameters:
        - plainTextSchema: The plain text schema to render
     - Returns: The rendered plain text schema
     */
    public func render(plainTextSchema: PlainTextSchema) throws -> String {
        let context = try plainTextSchemaContext(for: plainTextSchema)
        let rendered = try environment.renderTemplate(string: template, context: context)
        return try SwiftFormat.format(rendered)
    }

    private let template = """
    {% if documentation %}/// {{ documentation }}
    {% endif %}public struct {{ name }}: PlainTextResponse {
        public let text: String

        public static func from(text: String) -> {{ name }} {
            return Self.init(text: text)
        }
    }

    """

    private func plainTextSchemaContext(for plainTextSchema: PlainTextSchema) throws -> [String: Any] {
        var documentation: ObjectDocumentation?
        if let url = plainTextSchema.url, case .object(let objectDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url) {
            documentation = objectDocumentation
        }
        return [
            "name": plainTextSchema.name,
            "documentation": documentation?.abstract ?? ""
        ]
    }
}
