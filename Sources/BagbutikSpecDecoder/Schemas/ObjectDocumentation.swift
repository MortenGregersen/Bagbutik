public struct ObjectDocumentation: Equatable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let properties: [String: PropertyDocumentation]
    public let subDocumentationIds: [String]

    public init(id: String, title: String, abstract: String?, discussion: String?, properties: [String: PropertyDocumentation], subDocumentationIds: [String]) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.properties = properties
        self.subDocumentationIds = subDocumentationIds
    }
}