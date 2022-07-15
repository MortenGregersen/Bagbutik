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
        let context = enumContext(for: enumSchema, additionalProtocol: additionalProtocol)
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

    private func enumContext(for enumSchema: EnumSchema, additionalProtocol: String) -> [String: Any] {
        [
            "name": enumSchema.name,
            "documentation": enumSchema.documentation?.abstract ?? "",
            "rawType": enumSchema.type.capitalized,
            "additionalProtocol": additionalProtocol,
            "cases": enumSchema.cases.map {
                DocumentedEnumCase(enumCase: $0, description: enumSchema.documentation?.cases[$0.id])
            }
        ]
    }

    private struct DocumentedEnumCase {
        let enumCase: EnumCase
        let description: String?

        init(enumCase: EnumCase, description: String?) {
            self.enumCase = enumCase
            self.description = description
        }
    }
}
