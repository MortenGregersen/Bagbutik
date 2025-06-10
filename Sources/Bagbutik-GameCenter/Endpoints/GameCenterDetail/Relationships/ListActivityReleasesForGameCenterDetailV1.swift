import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get activity releases for a Game Center detail
     List all activity release information for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-activityReleases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listActivityReleasesForGameCenterDetailV1(id: String,
                                                          fields: [ListActivityReleasesForGameCenterDetailV1.Field]? = nil,
                                                          includes: [ListActivityReleasesForGameCenterDetailV1.Include]? = nil,
                                                          limit: Int? = nil) -> Request<GameCenterActivityVersionReleasesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/activityReleases",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListActivityReleasesForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivityVersionReleases
        case gameCenterActivityVersionReleases([GameCenterActivityVersionReleases])
        /// The fields to include for returned resources of type gameCenterActivityVersions
        case gameCenterActivityVersions([GameCenterActivityVersions])

        public enum GameCenterActivityVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version
        }

        public enum GameCenterActivityVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case defaultImage
            case fallbackUrl
            case localizations
            case releases
            case state
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
