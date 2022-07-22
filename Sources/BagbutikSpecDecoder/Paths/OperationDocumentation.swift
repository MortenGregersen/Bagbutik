public struct OperationDocumentation: Codable, Equatable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?
    public let pathParameters: [String: String]
    public let queryParameters: [String: String]
    public let body: String?
    public let responses: [ResponseDocumentation]

    public init(id: String, title: String, abstract: String?, discussion: String?, pathParameters: [String: String], queryParameters: [String: String], body: String?, responses: [ResponseDocumentation]) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
        self.pathParameters = pathParameters
        self.queryParameters = queryParameters
        self.body = body
        self.responses = responses
    }
}

public struct ResponseDocumentation: Codable, Equatable {
    public let status: Int
    public let reason: String
    public let description: String?

    public init(status: Int, reason: String, description: String?) {
        self.status = status
        self.reason = reason
        self.description = description
    }
}
