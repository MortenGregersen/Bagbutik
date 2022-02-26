public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appeventlocalizations_id>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppEventLocalization(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appEventLocalizations/\(id)", method: .delete)
    }
}
