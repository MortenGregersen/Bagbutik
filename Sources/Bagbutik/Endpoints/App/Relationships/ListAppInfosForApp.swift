public extension Request {
    /**
      # List All App Infos for an App
      Get information about an app that is currently live on App Store, or that goes live with the next version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_infos_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppInfosForApp(id: String,
                                   fields: [ListAppInfosForApp.Field]? = nil,
                                   includes: [ListAppInfosForApp.Include]? = nil,
                                   limits: [ListAppInfosForApp.Limit]? = nil) -> Request<AppInfosResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/appInfos", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes,
                                                                                      limits: limits))
    }
}

public enum ListAppInfosForApp {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appInfoLocalizations
        case appInfoLocalizations([AppInfoLocalizations])
        /// The fields to include for returned resources of type appInfos
        case appInfos([AppInfos])

        public enum AppInfoLocalizations: String, ParameterValue, CaseIterable {
            case appInfo
            case locale
            case name
            case privacyChoicesUrl
            case privacyPolicyText
            case privacyPolicyUrl
            case subtitle
        }

        public enum AppInfos: String, ParameterValue, CaseIterable {
            case ageRatingDeclaration
            case app
            case appInfoLocalizations
            case appStoreAgeRating
            case appStoreState
            case brazilAgeRating
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case ageRatingDeclaration, app, appInfoLocalizations, primaryCategory, primarySubcategoryOne, primarySubcategoryTwo, secondaryCategory, secondarySubcategoryOne, secondarySubcategoryTwo
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appInfoLocalizations returned (when they are included) - maximum 50
        case appInfoLocalizations(Int)
    }
}
