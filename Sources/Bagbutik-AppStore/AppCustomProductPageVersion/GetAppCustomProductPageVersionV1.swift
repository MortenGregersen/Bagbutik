import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCustomProductPageVersions/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpageversions_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appCustomProductPageLocalizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppCustomProductPageVersionV1(id: String,
                                                 fields: [GetAppCustomProductPageVersionV1.Field]? = nil,
                                                 includes: [GetAppCustomProductPageVersionV1.Include]? = nil,
                                                 limit: Int? = nil) -> Request<AppCustomProductPageVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/appCustomProductPageVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                              includes: includes,
                                                                                              limit: limit))
    }
}

public enum GetAppCustomProductPageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appCustomProductPageVersions
        case appCustomProductPageVersions([AppCustomProductPageVersions])

        public enum AppCustomProductPageLocalizations: String, ParameterValue, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText
        }

        public enum AppCustomProductPageVersions: String, ParameterValue, CaseIterable {
            case appCustomProductPage
            case appCustomProductPageLocalizations
            case state
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPage
        case appCustomProductPageLocalizations
    }
}
