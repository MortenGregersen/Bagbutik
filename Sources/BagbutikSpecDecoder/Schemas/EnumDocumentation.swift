public struct EnumDocumentation: Equatable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public var cases: [String: String]

    public init(id: String, title: String, abstract: String? = nil, discussion: String? = nil, cases: [String: String]) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.cases = cases
    }
}
