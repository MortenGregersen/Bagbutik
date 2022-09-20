import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCustomProductPageLocalizations/{id}/appPreviewSets

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpagelocalizations_id_apppreviewsets>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPreviewSetsForAppCustomProductPageLocalizationV1(id: String,
                                                                        fields: [ListAppPreviewSetsForAppCustomProductPageLocalizationV1.Field]? = nil,
                                                                        filters: [ListAppPreviewSetsForAppCustomProductPageLocalizationV1.Filter]? = nil,
                                                                        includes: [ListAppPreviewSetsForAppCustomProductPageLocalizationV1.Include]? = nil,
                                                                        limits: [ListAppPreviewSetsForAppCustomProductPageLocalizationV1.Limit]? = nil) -> Request<AppPreviewSetsResponse, ErrorResponse>
    {
        .init(path: "/v1/appCustomProductPageLocalizations/\(id)/appPreviewSets", method: .get, parameters: .init(fields: fields,
                                                                                                                  filters: filters,
                                                                                                                  includes: includes,
                                                                                                                  limits: limits))
    }
}

public enum ListAppPreviewSetsForAppCustomProductPageLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appPreviews
        case appPreviews([AppPreviews])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppCustomProductPageLocalizations: String, ParameterValue, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText
        }

        public enum AppPreviewSets: String, ParameterValue, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType
        }

        public enum AppPreviews: String, ParameterValue, CaseIterable {
            case appPreviewSet
            case assetDeliveryState
            case fileName
            case fileSize
            case mimeType
            case previewFrameTimeCode
            case previewImage
            case sourceFileChecksum
            case uploadOperations
            case uploaded
            case videoUrl
        }

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale
        }

        public enum AppStoreVersionLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersion
            case description
            case keywords
            case locale
            case marketingUrl
            case promotionalText
            case supportUrl
            case whatsNew
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'appStoreVersionExperimentTreatmentLocalization'
        case appStoreVersionExperimentTreatmentLocalization([String])
        /// Filter by id(s) of related 'appStoreVersionLocalization'
        case appStoreVersionLocalization([String])
        /// Filter by attribute 'previewType'
        case previewType([PreviewType])

        public enum PreviewType: String, ParameterValue, CaseIterable {
            case iPhone67 = "IPHONE_67"
            case iPhone61 = "IPHONE_61"
            case iPhone65 = "IPHONE_65"
            case iPhone58 = "IPHONE_58"
            case iPhone55 = "IPHONE_55"
            case iPhone47 = "IPHONE_47"
            case iPhone40 = "IPHONE_40"
            case iPhone35 = "IPHONE_35"
            case iPadPro3Gen129 = "IPAD_PRO_3GEN_129"
            case iPadPro3Gen11 = "IPAD_PRO_3GEN_11"
            case iPadPro129 = "IPAD_PRO_129"
            case iPad105 = "IPAD_105"
            case iPad97 = "IPAD_97"
            case desktop = "DESKTOP"
            case appleTV = "APPLE_TV"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPageLocalization
        case appPreviews
        case appStoreVersionExperimentTreatmentLocalization
        case appStoreVersionLocalization
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviews returned (when they are included) - maximum 50
        case appPreviews(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
