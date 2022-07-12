public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteInAppPurchaseV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v2/inAppPurchases/\(id)", method: .delete)
    }
}
