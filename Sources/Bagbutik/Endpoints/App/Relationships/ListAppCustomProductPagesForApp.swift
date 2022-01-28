public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_apps_id_appcustomproductpages>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppCustomProductPagesForApp(id: String,
                                                fields: [ListAppCustomProductPagesForApp.Field]? = nil,
                                                filters: [ListAppCustomProductPagesForApp.Filter]? = nil,
                                                includes: [ListAppCustomProductPagesForApp.Include]? = nil,
                                                limits: [ListAppCustomProductPagesForApp.Limit]? = nil) -> Request<AppCustomProductPagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/appCustomProductPages", method: .get, parameters: .init(fields: fields,
                                                                                                   filters: filters,
                                                                                                   includes: includes,
                                                                                                   limits: limits))
    }
}

public enum ListAppCustomProductPagesForApp {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageVersions
        case appCustomProductPageVersions([AppCustomProductPageVersions])
        /// The fields to include for returned resources of type appCustomProductPages
        case appCustomProductPages([AppCustomProductPages])

        public enum AppCustomProductPageVersions: String, ParameterValue, CaseIterable {
            case appCustomProductPage
            case appCustomProductPageLocalizations
            case state
            case version
        }

        public enum AppCustomProductPages: String, ParameterValue, CaseIterable {
            case app
            case appCustomProductPageVersions
            case appStoreVersionTemplate
            case customProductPageTemplate
            case name
            case url
            case visible
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'visible'
        case visible([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, appCustomProductPageVersions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appCustomProductPageVersions returned (when they are included) - maximum 50
        case appCustomProductPageVersions(Int)
    }
}
