public extension Request {
    /**
      # Get All Compatible Version IDs for a Game Center Enabled Version
      Get a list of compatible version resource IDs for a Game Center enabled version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_compatible_version_ids_for_a_game_center_enabled_version>

      - Parameter id: The id of the requested resource
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCompatibleVersionIdsForGameCenterEnabledVersionV1(id: String,
                                                                      limit: Int? = nil) -> Request<GameCenterEnabledVersionCompatibleVersionsLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .get, parameters: .init(limit: limit))
    }
}
