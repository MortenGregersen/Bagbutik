import Foundation

/// Paging information for data responses.
public struct PagingInformation: Codable {
    /// The paging information details.
    public let paging: Paging

    public init(paging: Paging) {
        self.paging = paging
    }

    /**
       Paging details such as the total number of resources and the per-page limit.

       Adjust the number of resources returned per page by using the limit query parameter in your request. For example, the following request returns the first 10 testers:
     ```
     GET /v1/betaTesters?limit=10
     ```
     */
    public struct Paging: Codable {
        /// The maximum number of resources to return per page, from 0 to 200.
        public let limit: Int
        /// The total number of resources matching your request.
        public let total: Int

        public init(limit: Int, total: Int) {
            self.limit = limit
            self.total = total
        }
    }
}
