public extension Request {
    /**
      # Remove Compatible Versions from a Game Center Enabled Version

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_compatible_versions_from_a_game_center_enabled_version>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCompatibleVersionsForGameCenterEnabledVersionV1(id: String,
                                                                      requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .delete, requestBody: requestBody)
    }
}
