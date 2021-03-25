import BagbutikSpecDecoder
import SwiftFormat

public class EnumSchemaRenderer: Renderer {
    public override init() {}
    
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
        return ["name": enumSchema.name,
                "documentation": enumSchema.documentation?.summary ?? "",
                "rawType": enumSchema.type.capitalized,
                "additionalProtocol": additionalProtocol,
                "cases": enumSchema.cases]
    }
}
