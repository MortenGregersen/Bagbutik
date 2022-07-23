public extension Request {
    /**
      # Add Compatible Versions to a Game Center Enabled Version

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_compatible_versions_to_a_game_center_enabled_version>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createCompatibleVersionsForGameCenterEnabledVersionV1(id: String,
                                                                      requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .post, requestBody: requestBody)
    }
}
