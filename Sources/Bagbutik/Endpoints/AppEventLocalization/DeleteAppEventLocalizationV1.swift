public extension Request {
    /**
      # Delete an App Event Localization
      Delete localized metadata that you configured for an in-app event.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appeventlocalizations_id>

      - Parameter id: The id of the requested resource
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppEventLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appEventLocalizations/\(id)", method: .delete)
    }
}
