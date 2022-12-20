import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All App Clips for an App
     List your app’s associated App Clips.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/search_an_app_s_app_clips>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppClipsForAppV1(id: String,
                                     fields: [ListAppClipsForAppV1.Field]? = nil,
                                     filters: [ListAppClipsForAppV1.Filter]? = nil,
                                     includes: [ListAppClipsForAppV1.Include]? = nil,
                                     limits: [ListAppClipsForAppV1.Limit]? = nil) -> Request<AppClipsResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/appClips", method: .get, parameters: .init(fields: fields,
                                                                               filters: filters,
                                                                               includes: includes,
                                                                               limits: limits))
    }
}

public enum ListAppClipsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])
        /// The fields to include for returned resources of type apps
        case apps([Apps])

        public enum AppClipDefaultExperiences: String, ParameterValue, CaseIterable {
            case action
            case appClip
            case appClipAppStoreReviewDetail
            case appClipDefaultExperienceLocalizations
            case appClipDefaultExperienceTemplate
            case releaseWithAppStoreVersion
        }

        public enum AppClips: String, ParameterValue, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId
        }

        public enum Apps: String, ParameterValue, CaseIterable {
            case appClips
            case appCustomProductPages
            case appEvents
            case appInfos
            case appStoreVersions
            case availableInNewTerritories
            case availableTerritories
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'bundleId'
        case bundleId([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
        case appClipDefaultExperiences
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appClipDefaultExperiences returned (when they are included) - maximum 50
        case appClipDefaultExperiences(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
