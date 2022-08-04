public struct EnumDocumentation: Equatable {
    public let id: String
    public let hierarchy: Documentation.Hierarchy
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public var cases: [String: String]

    public init(id: String, hierarchy: Documentation.Hierarchy = .init(paths: []), title: String, abstract: String? = nil, discussion: String? = nil, cases: [String: String]) {
        self.id = id
        self.hierarchy = hierarchy
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.cases = cases
    }
}
