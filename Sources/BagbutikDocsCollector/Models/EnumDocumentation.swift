public struct EnumDocumentation: Equatable {
    public let id: String
    public let packageName: PackageName
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public var cases: [String: String]

    public init(id: String, packageName: PackageName, title: String, abstract: String? = nil, discussion: String? = nil, cases: [String: String]) {
        self.id = id
        self.packageName = packageName
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.cases = cases
    }
}
