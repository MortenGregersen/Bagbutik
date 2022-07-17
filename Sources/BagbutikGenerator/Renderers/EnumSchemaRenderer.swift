import BagbutikDocsCollector
import BagbutikSpecDecoder
import SwiftFormat

/// A renderer which renders enum schemas
public class EnumSchemaRenderer: Renderer {
    let docsLoader: DocsLoader

    public init(docsLoader: DocsLoader) {
        self.docsLoader = docsLoader
    }

    /**
     Render an enum schema

     - Parameters:
        - enumSchema: The enum schema to render
        - additionalProtocol: Any additional protocol the enum should conform to
     - Returns: The rendered enum schema
     */
    public func render(enumSchema: EnumSchema, additionalProtocol: String = "Codable") throws -> String {
        let context = try enumContext(for: enumSchema, additionalProtocol: additionalProtocol)
        let rendered = try environment.renderTemplate(string: template, context: context)
        return try SwiftFormat.format(rendered)
    }

    private let template = """
    {% if documentation %}/// {{ documentation }}
    {% endif %}public enum {{ name }}: {{ rawType }}, {{ additionalProtocol }}, CaseIterable {
        {% for case in cases %}
        {% if case.documentation %}/// {{ case.documentation }}
        {% else %}{%
        endif %}case {{ case.id }} = "{{ case.value }}"{%
        endfor %}
    }
    """

    private func enumContext(for enumSchema: EnumSchema, additionalProtocol: String) throws -> [String: Any] {
        var documentation: EnumDocumentation?
        if let url = enumSchema.url, case .enum(let enumDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url) {
            documentation = enumDocumentation
        }
        return [
            "name": enumSchema.name,
            "documentation": documentation?.abstract ?? "",
            "rawType": enumSchema.type.capitalized,
            "additionalProtocol": additionalProtocol,
            "cases": enumSchema.cases.map {
                var enumCase = $0
                enumCase.documentation = documentation?.cases[$0.value]
                return enumCase
            }
        ]
    }
}
