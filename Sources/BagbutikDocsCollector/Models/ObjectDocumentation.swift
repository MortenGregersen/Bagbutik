public struct ObjectDocumentation: Equatable {
    public let id: String
    public let packageName: PackageName
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let properties: [String: PropertyDocumentation]
    public let subDocumentationIds: [String]

    public init(id: String, packageName: PackageName, title: String, abstract: String?, discussion: String?, properties: [String: PropertyDocumentation], subDocumentationIds: [String]) {
        self.id = id
        self.packageName = packageName
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.properties = properties
        self.subDocumentationIds = subDocumentationIds
    }
}
