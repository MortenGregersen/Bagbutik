public struct OperationDocumentation: Codable, Equatable, Sendable {
    public let id: String
    public let hierarchy: Documentation.Hierarchy
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let pathParameters: [String: String]
    public let queryParameters: [String: String]
    public let body: String?
    public let responses: [ResponseDocumentation]

    public init(id: String, hierarchy: Documentation.Hierarchy = .init(paths: []), title: String, abstract: String? = nil, discussion: String? = nil, pathParameters: [String: String] = [:], queryParameters: [String: String] = [:], body: String? = nil, responses: [ResponseDocumentation] = []) {
        self.id = id
        self.hierarchy = hierarchy
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.pathParameters = pathParameters
        self.queryParameters = queryParameters
        self.body = body
        self.responses = responses
    }
}
