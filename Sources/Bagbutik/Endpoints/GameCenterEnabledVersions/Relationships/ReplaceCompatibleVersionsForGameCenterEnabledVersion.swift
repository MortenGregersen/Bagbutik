public extension Request {
    /**
      # Replace All Compatible Versions for a Game Center Enabled Version
      Replace the compatible version for a Game Center enabled version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/replace_all_compatible_versions_for_a_game_center_enabled_version>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func replaceCompatibleVersionsForGameCenterEnabledVersion(id: String,
                                                                     requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .patch, requestBody: requestBody)
    }
}
