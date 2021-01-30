import Foundation

public struct PagingInformation: Codable {
    public let paging: Paging

    public init(paging: Paging) {
        self.paging = paging
    }

    public struct Paging: Codable {
        public let limit: Int
        public let total: Int

        public init(limit: Int, total: Int) {
            self.limit = limit
            self.total = total
        }
    }
}
