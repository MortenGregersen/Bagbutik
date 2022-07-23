public extension Request {
    /**
      # Modify the Order of a Promoted Purchase for an App
      Update the order of promoted purchases.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_order_of_a_promoted_purchase_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replacePromotedPurchasesForAppV1(id: String,
                                                 requestBody: AppPromotedPurchasesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/relationships/promotedPurchases", method: .patch, requestBody: requestBody)
    }
}
