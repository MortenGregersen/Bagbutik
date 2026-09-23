import Foundation

/// Documentation normalized from an Apple Markdown page.
public enum Documentation: Equatable, Sendable {
    case `enum`(EnumDocumentation)
    case `typealias`(TypealiasDocumentation)
    case object(ObjectDocumentation)
    case operation(OperationDocumentation)

    public var id: String {
        switch self {
        case .enum(let documentation): documentation.id
        case .typealias(let documentation): documentation.id
        case .object(let documentation): documentation.id
        case .operation(let documentation): documentation.id
        }
    }

    var content: String {
        switch self {
        case .enum(let documentation): documentation.content
        case .typealias(let documentation): documentation.content
        case .object(let documentation): documentation.content
        case .operation(let documentation): documentation.content
        }
    }
}
