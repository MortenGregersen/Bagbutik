import Bagbutik_Models

public extension Request {
    /**
     # Get All Resource IDs of Individual Testers for a Build
     Get a list of resource IDs of individual testers associated with a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_all_resource_ids_of_individual_testers_for_a_build>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIndividualTesterIdsForBuildV1(id: String,
                                                  limit: Int? = nil) -> Request<BuildIndividualTestersLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/relationships/individualTesters", method: .get, parameters: .init(limit: limit))
    }
}
