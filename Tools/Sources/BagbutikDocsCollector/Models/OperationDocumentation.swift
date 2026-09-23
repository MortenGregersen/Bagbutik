/// Normalized documentation for a generated endpoint helper.
public struct OperationDocumentation: Equatable, Sendable {
    public let id: String
    public let title: String
    public let content: String

    /**
     Creates operation documentation used by the generator.

     - Parameters:
        - id: The Apple documentation identifier for the operation.
        - title: The operation title.
        - content: The complete Apple Markdown page, excluding metadata.
     */
    public init(id: String, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}
