public struct PropertyDocumentation: Equatable {
    public let required: Bool
    public let description: String?

    public init(required: Bool, description: String?) {
        self.required = required
        self.description = description
    }
}
