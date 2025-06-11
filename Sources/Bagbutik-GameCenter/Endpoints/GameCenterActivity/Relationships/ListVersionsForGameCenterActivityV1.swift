import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the versions for an activity
     Get a list of versions for a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivities-_id_-versions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionsForGameCenterActivityV1(id: String,
                                                    fields: [ListVersionsForGameCenterActivityV1.Field]? = nil,
                                                    includes: [ListVersionsForGameCenterActivityV1.Include]? = nil,
                                                    limits: [ListVersionsForGameCenterActivityV1.Limit]? = nil) -> Request<GameCenterActivityVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)/versions",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListVersionsForGameCenterActivityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivities
        case gameCenterActivities([GameCenterActivities])
        /// The fields to include for returned resources of type gameCenterActivityImages
        case gameCenterActivityImages([GameCenterActivityImages])
        /// The fields to include for returned resources of type gameCenterActivityLocalizations
        case gameCenterActivityLocalizations([GameCenterActivityLocalizations])
        /// The fields to include for returned resources of type gameCenterActivityVersionReleases
        case gameCenterActivityVersionReleases([GameCenterActivityVersionReleases])
        /// The fields to include for returned resources of type gameCenterActivityVersions
        case gameCenterActivityVersions([GameCenterActivityVersions])

        public enum GameCenterActivities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievements
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case leaderboards
            case maximumPlayersCount
            case minimumPlayersCount
            case playStyle
            case properties
            case referenceName
            case supportsPartyCode
            case vendorIdentifier
            case versions
        }

        public enum GameCenterActivityImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
        }

        public enum GameCenterActivityLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case image
            case locale
            case name
            case version
        }

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
        case activity
        case defaultImage
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
