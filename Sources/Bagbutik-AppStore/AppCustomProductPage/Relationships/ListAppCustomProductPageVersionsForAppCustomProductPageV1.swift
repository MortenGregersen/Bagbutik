import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCustomProductPages/{id}/appCustomProductPageVersions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpages_id_appcustomproductpageversions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppCustomProductPageVersionsForAppCustomProductPageV1(id: String,
                                                                          fields: [ListAppCustomProductPageVersionsForAppCustomProductPageV1.Field]? = nil,
                                                                          filters: [ListAppCustomProductPageVersionsForAppCustomProductPageV1.Filter]? = nil,
                                                                          includes: [ListAppCustomProductPageVersionsForAppCustomProductPageV1.Include]? = nil,
                                                                          limits: [ListAppCustomProductPageVersionsForAppCustomProductPageV1.Limit]? = nil) -> Request<AppCustomProductPageVersionsResponse, ErrorResponse>
    {
        .init(path: "/v1/appCustomProductPages/\(id)/appCustomProductPageVersions", method: .get, parameters: .init(fields: fields,
                                                                                                                    filters: filters,
                                                                                                                    includes: includes,
                                                                                                                    limits: limits))
    }
}

public enum ListAppCustomProductPageVersionsForAppCustomProductPageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appCustomProductPageVersions
        case appCustomProductPageVersions([AppCustomProductPageVersions])
        /// The fields to include for returned resources of type appCustomProductPages
        case appCustomProductPages([AppCustomProductPages])

        public enum AppCustomProductPageLocalizations: String, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText
        }

        public enum AppCustomProductPageVersions: String, ParameterValue, Codable, CaseIterable {
            case appCustomProductPage
            case appCustomProductPageLocalizations
            case state
            case version
        }

        public enum AppCustomProductPages: String, ParameterValue, Codable, CaseIterable {
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
        /// Filter by attribute 'state'
        case state([State])

        public enum State: String, ParameterValue, Codable, CaseIterable {
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case readyForReview = "READY_FOR_REVIEW"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case inReview = "IN_REVIEW"
            case accepted = "ACCEPTED"
            case approved = "APPROVED"
            case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
            case rejected = "REJECTED"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPage
        case appCustomProductPageLocalizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appCustomProductPageLocalizations returned (when they are included) - maximum 50
        case appCustomProductPageLocalizations(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
