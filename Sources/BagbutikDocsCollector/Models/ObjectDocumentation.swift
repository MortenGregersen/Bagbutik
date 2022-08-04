public struct ObjectDocumentation: Codable, Equatable {
    public let id: String
    public let hierarchy: Documentation.Hierarchy
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let properties: [String: PropertyDocumentation]
    public let subDocumentationIds: [String]

    public init(id: String, hierarchy: Documentation.Hierarchy, title: String, abstract: String? = nil, discussion: String? = nil, properties: [String: PropertyDocumentation] = [:], subDocumentationIds: [String] = []) {
        self.id = id
        self.hierarchy = hierarchy
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.properties = properties
        self.subDocumentationIds = subDocumentationIds
    }
}
