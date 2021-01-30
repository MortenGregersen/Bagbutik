class PropertyRenderer: Renderer {
    func render(id: String, type: String, optional: Bool) throws -> String {
        return try environment.renderTemplate(string: template, context: [
            "id": id,
            "type": type,
            "optional": optional,
        ])
    }

    private let template = """
    public let {{ id|escapeReservedKeywords }}: {{ type|upperFirstLetter }}{% if optional %}?{% endif %}{%
    """
}
