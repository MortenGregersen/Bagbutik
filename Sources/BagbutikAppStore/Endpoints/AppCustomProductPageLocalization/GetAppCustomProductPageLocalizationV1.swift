import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read Custom Product Page Localization Information

     Get information about a specific app custom product page localization.

     ## Discussion

     ### Example Request and Response

     **Other:**

     ```not specified
     https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd
     ```

     **Other:**

     ```json
     {
       "data": {
         "type": "appCustomProductPageLocalizations",
         "id": "dad51248-3c38-4f19-a814-3c4f6da719dd",
         "attributes": {
           "locale": "en-US",
           "promotionalText": "This app will inspire!"
         },
         "relationships": {
           "appScreenshotSets": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/relationships/appScreenshotSets",
               "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/appScreenshotSets"
             }
           },
           "appPreviewSets": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/relationships/appPreviewSets",
               "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd/appPreviewSets"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/dad51248-3c38-4f19-a814-3c4f6da719dd"
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

     [`List App Preview Sets for a Custom Product Page Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appPreviewSets)

     List the app preview sets for a specific custom product page localization.

     [`List App Screenshot Sets for a Custom Product Page Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-appScreenshotSets)

     List the app screenshot sets for a specific custom product page localization.

     [`List app preview set IDs for a custom product page localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appPreviewSets)

     List the app preview set IDs for a specific custom product page localization.

     [`List app screenshot sets IDs for a custom product page localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-appCustomProductPageLocalizations-_id_-relationships-appScreenshotSets)

     List the app screenshot set IDs for a specific custom product page localization.

     [`Delete an App Custom Product Page Localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/DELETE-v1-appCustomProductPageLocalizations-_id_)

     Delete localized metadata that you configured for a custom product page.



     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppCustomProductPageLocalizationV1(id: String,
                                                      fields: [GetAppCustomProductPageLocalizationV1.Field]? = nil,
                                                      includes: [GetAppCustomProductPageLocalizationV1.Include]? = nil,
                                                      limits: [GetAppCustomProductPageLocalizationV1.Limit]? = nil) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetAppCustomProductPageLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appCustomProductPageVersions
        case appCustomProductPageVersions([AppCustomProductPageVersions])
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])

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

        public enum AppCustomProductPageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPage
            case appCustomProductPageLocalizations
            case deepLink
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCustomProductPageVersions(rawValue: string) {
                    self = value
                } else if let value = AppCustomProductPageVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCustomProductPageVersions value: \(string)"
                    )
                }
            }
        }

        public enum AppPreviewSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPreviewSets(rawValue: string) {
                    self = value
                } else if let value = AppPreviewSets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPreviewSets value: \(string)"
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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appCustomProductPageVersion
        case appPreviewSets
        case appScreenshotSets
        case searchKeywords
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
        /// Maximum number of related searchKeywords returned (when they are included) - maximum 50
        case searchKeywords(Int)
    }
}
