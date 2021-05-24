class PropertyRenderer: Renderer {
    func render(id: String, type: String, optional: Bool, deprecated: Bool = false) throws -> String {
        return try environment.renderTemplate(string: template, context: [
            "id": id,
            "type": type,
            "optional": optional,
            "deprecated": deprecated,
            "propertyType": deprecated ? "var" : "let",
            "defaultValue": deprecated ? "nil" : ""
        ])
    }

    private let template = """
    {% if deprecated %}@available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
    {% else %}{% endif %}public {{ propertyType }} {{ id|escapeReservedKeywords }}: {{ type|upperFirstLetter }}{% if optional %}?{% endif %}{% if defaultValue %} = {{ defaultValue }}{% endif %}
    """
}
