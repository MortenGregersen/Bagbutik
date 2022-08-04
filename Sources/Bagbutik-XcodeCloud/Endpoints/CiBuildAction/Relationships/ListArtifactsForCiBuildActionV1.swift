public extension Request {
    /**
     # List All Artifacts for a Build Action
     List all artifacts Xcode Cloud created when it performed an action.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_artifacts_for_a_build_action>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listArtifactsForCiBuildActionV1(id: String,
                                                fields: [ListArtifactsForCiBuildActionV1.Field]? = nil,
                                                limit: Int? = nil) -> Request<CiArtifactsResponse, ErrorResponse>
    {
        .init(path: "/v1/ciBuildActions/\(id)/artifacts", method: .get, parameters: .init(fields: fields,
                                                                                          limit: limit))
    }
}

public enum ListArtifactsForCiBuildActionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciArtifacts
        case ciArtifacts([CiArtifacts])

        public enum CiArtifacts: String, ParameterValue, CaseIterable {
            case downloadUrl
            case fileName
            case fileSize
            case fileType
        }
    }
}
