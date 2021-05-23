class PropertyRenderer: Renderer {
    func render(id: String, type: String, optional: Bool) throws -> String {
        return try Self.environment.renderTemplate(string: Self.template, context: [
            "id": id,
            "type": type,
            "optional": optional,
        ])
    }

    private static let template = """
    public let {{ id|escapeReservedKeywords }}: {{ type|upperFirstLetter }}{% if optional %}?{% endif %}{%
    """
}
