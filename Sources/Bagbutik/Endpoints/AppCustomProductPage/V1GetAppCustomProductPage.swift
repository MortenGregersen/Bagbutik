public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpages_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related appCustomProductPageVersions returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppCustomProductPageV1(id: String,
                                          fields: [GetAppCustomProductPageV1.Field]? = nil,
                                          includes: [GetAppCustomProductPageV1.Include]? = nil,
                                          limit: Int? = nil) -> Request<AppCustomProductPageResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCustomProductPages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                              includes: includes,
                                                                                              limit: limit))
    }
}

public enum V1GetAppCustomProductPage {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, appCustomProductPageVersions
    }
}
