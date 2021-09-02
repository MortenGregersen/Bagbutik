import Foundation

extension ErrorResponse: Error {}

public struct EmptyResponse: Codable {
    public init() {}
}

public struct GzipResponse: Decodable {
    public let data: Data
    public let unzippedData: Data

    public init(data: Data) throws {
        self.data = data
        self.unzippedData = try data.gunzippedData()
    }
}

/// A response which contains pages of data.
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
