public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpages_id_appcustomproductpageversions>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppCustomProductPageVersionsForAppCustomProductPage(id: String,
                                                                        fields: [ListAppCustomProductPageVersionsForAppCustomProductPage.Field]? = nil,
                                                                        filters: [ListAppCustomProductPageVersionsForAppCustomProductPage.Filter]? = nil,
                                                                        includes: [ListAppCustomProductPageVersionsForAppCustomProductPage.Include]? = nil,
                                                                        limits: [ListAppCustomProductPageVersionsForAppCustomProductPage.Limit]? = nil) -> Request<AppCustomProductPageVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCustomProductPages/\(id)/appCustomProductPageVersions", method: .get, parameters: .init(fields: fields,
                                                                                                                           filters: filters,
                                                                                                                           includes: includes,
                                                                                                                           limits: limits))
    }
}

public enum ListAppCustomProductPageVersionsForAppCustomProductPage {
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
        /// Filter by attribute 'state'
        case state([State])

        public enum State: String, ParameterValue, CaseIterable {
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
        case appCustomProductPage, appCustomProductPageLocalizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appCustomProductPageLocalizations returned (when they are included) - maximum 50
        case appCustomProductPageLocalizations(Int)
    }
}
