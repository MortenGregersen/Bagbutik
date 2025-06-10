import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read activity version release information
     Get information for a specific Game Center activity version release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityVersionReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterActivityVersionReleaseV1(id: String,
                                                      fields: [GetGameCenterActivityVersionReleaseV1.Field]? = nil,
                                                      includes: [GetGameCenterActivityVersionReleaseV1.Include]? = nil) -> Request<GameCenterActivityVersionReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersionReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterActivityVersionReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivityVersionReleases
        case gameCenterActivityVersionReleases([GameCenterActivityVersionReleases])

        public enum GameCenterActivityVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case version
    }
}
