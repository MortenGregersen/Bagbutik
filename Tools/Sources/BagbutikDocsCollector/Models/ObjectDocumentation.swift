public struct ObjectDocumentation: Codable, Equatable, Sendable {
    public let id: String
    public let hierarchy: Documentation.Hierarchy
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public var properties: [String: PropertyDocumentation]
    public let subDocumentationIds: [String]

    public init(id: String, hierarchy: Documentation.Hierarchy = .init(paths: []), title: String, abstract: String? = nil, discussion: String? = nil, properties: [String: PropertyDocumentation] = [:], subDocumentationIds: [String] = []) {
        self.id = id
        self.hierarchy = hierarchy
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.properties = properties
        self.subDocumentationIds = subDocumentationIds
    }
}
