import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read custom product page information
     Get information about a specific app custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appCustomProductPageVersions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppCustomProductPageV1(id: String,
                                          fields: [GetAppCustomProductPageV1.Field]? = nil,
                                          includes: [GetAppCustomProductPageV1.Include]? = nil,
                                          limit: GetAppCustomProductPageV1.Limit? = nil) -> Request<AppCustomProductPageResponse, ErrorResponse>
    {
        .init(path: "/v1/appCustomProductPages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                       includes: includes,
                                                                                       limits: limit.map { [$0] }))
    }
}

public enum GetAppCustomProductPageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageVersions
        case appCustomProductPageVersions([AppCustomProductPageVersions])
        /// The fields to include for returned resources of type appCustomProductPages
        case appCustomProductPages([AppCustomProductPages])

        public enum AppCustomProductPageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPage
            case appCustomProductPageLocalizations
            case deepLink
            case state
            case version
        }

        public enum AppCustomProductPages: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appCustomProductPageVersions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appCustomProductPageVersions returned (when they are included) - maximum 50
        case appCustomProductPageVersions(Int)
    }
}
