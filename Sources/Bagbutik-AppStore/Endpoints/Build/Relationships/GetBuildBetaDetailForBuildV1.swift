import Bagbutik_Core

public extension Request {
    /**
     # Read the Build Beta Details Information of a Build
     Get the beta test details for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_build_beta_details_information_of_a_build>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildBetaDetailForBuildV1(id: String,
                                             fields: [GetBuildBetaDetailForBuildV1.Field]? = nil) -> Request<BuildBetaDetailResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/buildBetaDetail", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBuildBetaDetailForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildBetaDetails
        case buildBetaDetails([BuildBetaDetails])

        public enum BuildBetaDetails: String, ParameterValue, CaseIterable {
            case autoNotifyEnabled
            case build
            case externalBuildState
            case internalBuildState
        }
    }
}
