public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPromotedPurchaseIdsForAppV1(id: String,
                                                limit: Int? = nil) -> Request<AppPromotedPurchasesLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/relationships/promotedPurchases", method: .get, parameters: .init(limit: limit))
    }
}
