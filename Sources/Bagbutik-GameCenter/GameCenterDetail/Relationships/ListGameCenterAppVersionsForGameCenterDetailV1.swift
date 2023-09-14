import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read app versions for a Game Center detail
     Get a list of app versions for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_versions_for_a_game_center_detail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAppVersionsForGameCenterDetailV1(id: String,
                                                               fields: [ListGameCenterAppVersionsForGameCenterDetailV1.Field]? = nil,
                                                               filters: [ListGameCenterAppVersionsForGameCenterDetailV1.Filter]? = nil,
                                                               includes: [ListGameCenterAppVersionsForGameCenterDetailV1.Include]? = nil,
                                                               limits: [ListGameCenterAppVersionsForGameCenterDetailV1.Limit]? = nil) -> Request<GameCenterAppVersionsResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/gameCenterAppVersions", method: .get, parameters: .init(fields: fields,
                                                                                                         filters: filters,
                                                                                                         includes: includes,
                                                                                                         limits: limits))
    }
}

public enum ListGameCenterAppVersionsForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type gameCenterAppVersions
        case gameCenterAppVersions([GameCenterAppVersions])

        public enum AppStoreVersions: String, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case platform
            case releaseType
            case routingAppCoverage
            case versionString
        }

        public enum GameCenterAppVersions: String, ParameterValue, Codable, CaseIterable {
            case appStoreVersion
            case compatibilityVersions
            case enabled
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'enabled'
        case enabled([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreVersion
        case compatibilityVersions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related compatibilityVersions returned (when they are included) - maximum 50
        case compatibilityVersions(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
