public extension Request {
    /**
      # Get All Resource IDs of Individual Testers for a Build
      Get a list of resource IDs of individual testers associated with a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_resource_ids_of_individual_testers_for_a_build>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listIndividualTesterIdsForBuild(id: String,
                                                limit: Int? = nil) -> Request<BuildIndividualTestersLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/relationships/individualTesters", method: .get, parameters: .init(limit: limit))
    }
}
