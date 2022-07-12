public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func replacePromotedPurchasesForApp(id: String,
                                               requestBody: AppPromotedPurchasesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/relationships/promotedPurchases", method: .patch, requestBody: requestBody)
    }
}
