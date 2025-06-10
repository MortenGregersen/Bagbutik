import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get challenge releases for a Game Center detail
     List all challenge release information for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-challengeReleases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listChallengeReleasesForGameCenterDetailV1(id: String,
                                                           fields: [ListChallengeReleasesForGameCenterDetailV1.Field]? = nil,
                                                           includes: [ListChallengeReleasesForGameCenterDetailV1.Include]? = nil,
                                                           limit: Int? = nil) -> Request<GameCenterChallengeVersionReleasesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/challengeReleases",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListChallengeReleasesForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterChallengeVersionReleases
        case gameCenterChallengeVersionReleases([GameCenterChallengeVersionReleases])
        /// The fields to include for returned resources of type gameCenterChallengeVersions
        case gameCenterChallengeVersions([GameCenterChallengeVersions])

        public enum GameCenterChallengeVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version
        }

        public enum GameCenterChallengeVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case challenge
            case defaultImage
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
