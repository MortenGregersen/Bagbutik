import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All App Info Localizations for an App Info
     Get a list of localized, app-level information for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_info_localizations_for_an_app_info>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppInfoLocalizationsForAppInfoV1(id: String,
                                                     fields: [ListAppInfoLocalizationsForAppInfoV1.Field]? = nil,
                                                     filters: [ListAppInfoLocalizationsForAppInfoV1.Filter]? = nil,
                                                     includes: [ListAppInfoLocalizationsForAppInfoV1.Include]? = nil,
                                                     limit: Int? = nil) -> Request<AppInfoLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v1/appInfos/\(id)/appInfoLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                               filters: filters,
                                                                                               includes: includes,
                                                                                               limit: limit))
    }
}

public enum ListAppInfoLocalizationsForAppInfoV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appInfoLocalizations
        case appInfoLocalizations([AppInfoLocalizations])
        /// The fields to include for returned resources of type appInfos
        case appInfos([AppInfos])

        public enum AppInfoLocalizations: String, ParameterValue, Codable, CaseIterable {
            case appInfo
            case locale
            case name
            case privacyChoicesUrl
            case privacyPolicyText
            case privacyPolicyUrl
            case subtitle
        }

        public enum AppInfos: String, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appInfoLocalizations
            case appStoreAgeRating
            case appStoreState
            case brazilAgeRating
            case brazilAgeRatingV2
            case kidsAgeBand
            case primaryCategory
            case primarySubcategoryOne
            case primarySubcategoryTwo
            case secondaryCategory
            case secondarySubcategoryOne
            case secondarySubcategoryTwo
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'locale'
        case locale([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appInfo
    }
}
