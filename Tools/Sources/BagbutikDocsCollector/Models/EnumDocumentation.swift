public struct EnumDocumentation: Equatable, Sendable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?

    public init(id: String, title: String, abstract: String? = nil, discussion: String? = nil) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
    }
}
