public extension Request {
    /**
      # Delete a Beta Build Localization
      Delete a specific beta build localization associated with a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_beta_build_localization>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBetaBuildLocalization(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/betaBuildLocalizations/\(id)", method: .delete)
    }
}
