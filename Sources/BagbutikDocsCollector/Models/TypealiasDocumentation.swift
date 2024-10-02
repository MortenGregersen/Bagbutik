public struct TypealiasDocumentation: Equatable, Sendable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public var values: [String: String]

    init(id: String, title: String, abstract: String?, discussion: String?, values: [String: String]) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.values = values
    }
}
