public struct EnumDocumentation: Equatable, Sendable {
    public let id: String
    public let title: String
    public let content: String

    public init(id: String, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}
