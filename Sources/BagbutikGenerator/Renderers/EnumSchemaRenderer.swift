import BagbutikDocsCollector
import BagbutikSpecDecoder
import SwiftFormat

/// A renderer which renders enum schemas
public class EnumSchemaRenderer: Renderer {
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
        {% if abstract %}/**
          {{ abstract }}

          Full documentation:
          <{{ url }}>{% if discussion %}

          {{ discussion }}{% endif %}
        */
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
            "abstract": documentation?.abstract ?? "",
            "url": enumSchema.url ?? "",
            "discussion": documentation?.discussion ?? "",
            "rawType": enumSchema.type.capitalized,
            "additionalProtocol": additionalProtocol,
            "cases": enumSchema.cases.map { enumCase -> EnumCase in
                var enumCase = enumCase
                enumCase.documentation = documentation?.cases[enumCase.value]
                return enumCase
            }
        ]
    }
}
