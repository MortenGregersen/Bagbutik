import BagbutikDocsCollector
import BagbutikSpecDecoder
import SwiftFormat

/// A renderer which renders plain text schemas
public class PlainTextSchemaRenderer: Renderer {
    /**
     Render an plain text schema

     - Parameters:
        - plainTextSchema: The plain text schema to render
     - Returns: The rendered plain text schema
     */
    public func render(plainTextSchema: PlainTextSchema) throws -> String {
        let context = plainTextSchemaContext(for: plainTextSchema)
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

    private func plainTextSchemaContext(for plainTextSchema: PlainTextSchema) -> [String: Any] {
        ["name": plainTextSchema.name, "documentation": plainTextSchema.documentation?.abstract ?? ""]
    }
}
