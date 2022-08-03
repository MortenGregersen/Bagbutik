public struct EnumDocumentation: Equatable {
    public let id: String
    public let packageName: PackageName
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let cases: [String: String]

    public init(id: String, packageName: PackageName, title: String, abstract: String?, discussion: String?, cases: [String: String]) {
        self.id = id
        self.packageName = packageName
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.cases = cases
    }
}
