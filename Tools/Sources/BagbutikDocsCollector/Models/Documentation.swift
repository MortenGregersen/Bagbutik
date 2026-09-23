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

    var title: String {
        switch self {
        case .enum(let documentation): documentation.title
        case .typealias(let documentation): documentation.title
        case .object(let documentation): documentation.title
        case .operation(let documentation): documentation.title
        }
    }

    var abstract: String? {
        switch self {
        case .enum(let documentation): documentation.abstract
        case .typealias(let documentation): documentation.abstract
        case .object(let documentation): documentation.abstract
        case .operation(let documentation): documentation.abstract
        }
    }

    var discussion: String? {
        switch self {
        case .enum(let documentation): documentation.discussion
        case .typealias(let documentation): documentation.discussion
        case .object(let documentation): documentation.discussion
        case .operation(let documentation): documentation.discussion
        }
    }
}
