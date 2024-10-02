public struct TypealiasDocumentation: Equatable, Sendable {
    public let id: String
    public let hierarchy: Documentation.Hierarchy
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public var values: [String: String]

    init(id: String, hierarchy: Documentation.Hierarchy = .init(paths: []), title: String, abstract: String?, discussion: String?, values: [String: String]) {
        self.id = id
        self.hierarchy = hierarchy
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.values = values
    }
}
