public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter requestBody: InAppPurchase representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateInAppPurchase(id: String,
                                    requestBody: InAppPurchaseV2UpdateRequest) -> Request<InAppPurchaseV2Response, ErrorResponse>
    {
        return .init(path: "/v2/inAppPurchases/\(id)", method: .patch, requestBody: requestBody)
    }
}
