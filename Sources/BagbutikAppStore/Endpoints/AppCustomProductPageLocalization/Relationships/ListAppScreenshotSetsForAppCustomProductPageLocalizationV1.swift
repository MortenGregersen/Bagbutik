import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List App Screenshot Sets for a Custom Product Page Localization

     List the app screenshot sets for a specific custom product page localization.

     ## Discussion

     ### Example Request and Response

     **Other:**

     ```not specified
     https://api.appstoreconnect.apple.com/v1/appCustomProductPageVersions/e0e9216a-338c-4616-9fd5-0ec6c14c6950/appCustomProductPageLocalizations
     ```

     **Other:**

     ```json
     {
       "data": [
         {
           "type": "appScreenshotSets",
           "id": "3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7",
           "attributes": {
             "screenshotDisplayType": "APP_IPHONE_65"
           },
           "relationships": {
             "appScreenshots": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7/relationships/appScreenshots",
                 "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7/appScreenshots"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/3d87ecbb-bcdc-4c2f-b34f-ced3cf666de7"
           }
         },
         {
           "type": "appScreenshotSets",
           "id": "a59be7c9-8f97-45cc-939d-09c101c483e3",
           "attributes": {
             "screenshotDisplayType": "APP_IPHONE_55"
           },
           "relationships": {
             "appScreenshots": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/a59be7c9-8f97-45cc-939d-09c101c483e3/relationships/appScreenshots",
                 "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/a59be7c9-8f97-45cc-939d-09c101c483e3/appScreenshots"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/a59be7c9-8f97-45cc-939d-09c101c483e3"
           }
         },
         {
           "type": "appScreenshotSets",
           "id": "69a9c45d-4508-4b4a-a08e-03e0bc018903",
           "attributes": {
             "screenshotDisplayType": "APP_IPAD_PRO_3GEN_129"
           },
           "relationships": {
             "appScreenshots": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/69a9c45d-4508-4b4a-a08e-03e0bc018903/relationships/appScreenshots",
                 "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/69a9c45d-4508-4b4a-a08e-03e0bc018903/appScreenshots"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/69a9c45d-4508-4b4a-a08e-03e0bc018903"
           }
         },
         {
           "type": "appScreenshotSets",
           "id": "51bc2274-7517-4e56-82e4-c80f6014d44a",
           "attributes": {
             "screenshotDisplayType": "APP_IPAD_PRO_129"
           },
           "relationships": {
             "appScreenshots": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/51bc2274-7517-4e56-82e4-c80f6014d44a/relationships/appScreenshots",
                 "related": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/51bc2274-7517-4e56-82e4-c80f6014d44a/appScreenshots"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/appScreenshotSets/51bc2274-7517-4e56-82e4-c80f6014d44a"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/0d95bf9e-8256-4abf-83e2-9b428919100f/appScreenshotSets"
       },
       "meta": {
         "paging": {
           "total": 4,
           "limit": 50
         }
       }
     }
     ```

     ## See Also

     [`Create a Custom Product Page Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-appCustomProductPageLocalizations)

     Add a localization for your app custom product page.

     [`Modify Custom Product Page Localization Information`](https://developer.apple.com/documentation/AppStoreConnectAPI/PATCH-v1-appCustomProductPageLocalizations-_id_)

     Update the promotional text for an app custom product page localization.

     [`List Custom Product Pages Localizations`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageVersions-_id_-appCustomProductPageLocalizations)

     List all localizations for an app custom product page.

     [`Read Custom Product Page Localization Information`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_)

     Get information about a specific app custom product page localization.

     [`List App Preview Sets for a Custom Product Page Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appPreviewSets)

     List the app preview sets for a specific custom product page localization.

     [`List app preview set IDs for a custom product page localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appPreviewSets)

     List the app preview set IDs for a specific custom product page localization.

     [`List app screenshot sets IDs for a custom product page localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appScreenshotSets)

     List the app screenshot set IDs for a specific custom product page localization.

     [`Delete an App Custom Product Page Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/DELETE-v1-appCustomProductPageLocalizations-_id_)

     Delete localized metadata that you configured for a custom product page.



     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageLocalizations-_id_-appScreenshotSets>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppScreenshotSetsForAppCustomProductPageLocalizationV1(id: String,
                                                                           fields: [ListAppScreenshotSetsForAppCustomProductPageLocalizationV1.Field]? = nil,
                                                                           filters: [ListAppScreenshotSetsForAppCustomProductPageLocalizationV1.Filter]? = nil,
                                                                           includes: [ListAppScreenshotSetsForAppCustomProductPageLocalizationV1.Include]? = nil,
                                                                           limits: [ListAppScreenshotSetsForAppCustomProductPageLocalizationV1.Limit]? = nil) -> Request<AppScreenshotSetsResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)/appScreenshotSets",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListAppScreenshotSetsForAppCustomProductPageLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appScreenshots
        case appScreenshots([AppScreenshots])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppCustomProductPageLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText
            case searchKeywords

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCustomProductPageLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppCustomProductPageLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCustomProductPageLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppScreenshotSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appScreenshots
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case screenshotDisplayType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppScreenshotSets(rawValue: string) {
                    self = value
                } else if let value = AppScreenshotSets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppScreenshotSets value: \(string)"
                    )
                }
            }
        }

        public enum AppScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appScreenshotSet
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppScreenshots(rawValue: string) {
                    self = value
                } else if let value = AppScreenshots(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppScreenshots value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersionExperimentTreatmentLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersionExperimentTreatmentLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersionExperimentTreatmentLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersion
            case description
            case keywords
            case locale
            case marketingUrl
            case promotionalText
            case searchKeywords
            case supportUrl
            case whatsNew

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersionLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersionLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersionLocalizations value: \(string)"
                    )
                }
            }
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
        /// Filter by attribute 'screenshotDisplayType'
        case screenshotDisplayType([ScreenshotDisplayType])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appCustomProductPageLocalization
        case appScreenshots
        case appStoreVersionExperimentTreatmentLocalization
        case appStoreVersionLocalization
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appScreenshots returned (when they are included) - maximum 50
        case appScreenshots(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
