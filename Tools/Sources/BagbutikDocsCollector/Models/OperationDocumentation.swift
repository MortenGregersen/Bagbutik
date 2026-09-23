/// Normalized documentation for a generated endpoint helper.
public struct OperationDocumentation: Equatable, Sendable {
    public let id: String
    public let title: String
    public let abstract: String?
    public let discussion: String?

    /**
     Creates operation documentation used by the generator.

     - Parameters:
        - id: The Apple documentation identifier for the operation.
        - title: The operation title.
        - abstract: A short summary of the endpoint.
        - discussion: Longer form discussion text for the endpoint.
     */
    public init(id: String, title: String, abstract: String? = nil, discussion: String? = nil) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.discussion = discussion
    }
}
