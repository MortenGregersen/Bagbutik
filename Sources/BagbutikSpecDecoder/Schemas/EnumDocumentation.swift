public struct EnumDocumentation: Equatable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let cases: [String: String]

    public init(id: String, title: String, abstract: String?, discussion: String?, cases: [String: String]) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.cases = cases
    }
}
