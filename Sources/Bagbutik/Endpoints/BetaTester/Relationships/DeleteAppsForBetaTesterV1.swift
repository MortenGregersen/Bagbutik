public extension Request {
    /**
      # Remove a Beta Tester’s Access to Apps
      Remove a specific beta tester's access to test any builds of one or more apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_a_beta_tester_s_access_to_apps>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppsForBetaTesterV1(id: String,
                                          requestBody: BetaTesterAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/relationships/apps", method: .delete, requestBody: requestBody)
    }
}
