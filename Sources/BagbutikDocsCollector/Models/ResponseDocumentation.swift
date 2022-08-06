public struct ResponseDocumentation: Codable, Equatable {
    public let status: Int
    public let reason: String
    public let description: String?

    public init(status: Int, reason: String, description: String? = nil) {
        self.status = status
        self.reason = reason
        self.description = description
    }
}
