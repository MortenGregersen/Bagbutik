/// A response that exposes pagination links and a page of resource data.
public protocol PagedResponse {
    /// The type of the paged data.
    associatedtype Data
    /// The resource data.
    var data: [Data] { get }
    /// Navigational links that include the self-link.
    var links: PagedDocumentLinks { get }
    /// Paging information.
    var meta: PagingInformation? { get }
}
