/// Normalized documentation for a generated endpoint helper.
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

    /**
     Creates an operation documentation value in the normalized format used by the generator.

     - Parameters:
        - id: The Apple documentation identifier for the operation.
        - hierarchy: The symbol hierarchy reported by Apple's documentation JSON.
        - title: The operation title.
        - abstract: A short summary of the endpoint.
        - discussion: Longer form discussion text for the endpoint.
        - pathParameters: Documentation keyed by path parameter name.
        - queryParameters: Documentation keyed by query parameter name.
        - body: Documentation for the request body.
        - responses: Documented response cases for the endpoint.
     */
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
