import Foundation

/**
 # PagingInformation
 Paging information for data responses.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/paginginformation>
 */
public struct PagingInformation: Codable {
    /// The paging information details.
    public let paging: Paging

    public init(paging: Paging) {
        self.paging = paging
    }

    public struct Paging: Codable {
        public let limit: Int
        public var total: Int?

        public init(limit: Int,
                    total: Int? = nil)
        {
            self.limit = limit
            self.total = total
        }
    }
}
