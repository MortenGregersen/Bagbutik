public extension Request {
    /**
      # Remove Compatible Versions from a Game Center Enabled Version
      Remove the compatible versions from a Game Center enabled version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_compatible_versions_from_a_game_center_enabled_version>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteCompatibleVersionsForGameCenterEnabledVersion(id: String,
                                                                    requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .delete, requestBody: requestBody)
    }
}
