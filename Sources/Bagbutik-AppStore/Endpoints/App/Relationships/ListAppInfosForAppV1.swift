import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All App Infos for an App
     Get information about an app that is currently live on App Store, or that goes live with the next version.

     Use this endpoint to retrieve the derived app-level information for an app. If the app has both a “Ready for Sale” version and a version you’re preparing for release, it will have two app infos. One represents information about the app currently in the App Store, and the other represents the information that takes effect when you release the next version. Use the `appStoreState` attribute to differentiate them.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-appInfos>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppInfosForAppV1(id: String,
                                     fields: [ListAppInfosForAppV1.Field]? = nil,
                                     includes: [ListAppInfosForAppV1.Include]? = nil,
                                     limits: [ListAppInfosForAppV1.Limit]? = nil) -> Request<AppInfosResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/appInfos",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListAppInfosForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ageRatingDeclarations
        case ageRatingDeclarations([AgeRatingDeclarations])
        /// The fields to include for returned resources of type appCategories
        case appCategories([AppCategories])
        /// The fields to include for returned resources of type appInfoLocalizations
        case appInfoLocalizations([AppInfoLocalizations])
        /// The fields to include for returned resources of type appInfos
        case appInfos([AppInfos])
        /// The fields to include for returned resources of type apps
        case apps([Apps])

        public enum AgeRatingDeclarations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingOverride
            case alcoholTobaccoOrDrugUseOrReferences
            case contests
            case gambling
            case gamblingSimulated
            case horrorOrFearThemes
            case kidsAgeBand
            case koreaAgeRatingOverride
            case lootBox
            case matureOrSuggestiveThemes
            case medicalOrTreatmentInformation
            case profanityOrCrudeHumor
            case sexualContentGraphicAndNudity
            case sexualContentOrNudity
            case unrestrictedWebAccess
            case violenceCartoonOrFantasy
            case violenceRealistic
            case violenceRealisticProlongedGraphicOrSadistic

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AgeRatingDeclarations(rawValue: string) {
                    self = value
                } else if let value = AgeRatingDeclarations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AgeRatingDeclarations value: \(string)"
                    )
                }
            }
        }

        public enum AppCategories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case parent
            case platforms
            case subcategories

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCategories(rawValue: string) {
                    self = value
                } else if let value = AppCategories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCategories value: \(string)"
                    )
                }
            }
        }

        public enum AppInfoLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appInfo
            case locale
            case name
            case privacyChoicesUrl
            case privacyPolicyText
            case privacyPolicyUrl
            case subtitle

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppInfoLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppInfoLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppInfoLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppInfos: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appInfoLocalizations
            case appStoreAgeRating
            case appStoreState
            case australiaAgeRating
            case brazilAgeRating
            case brazilAgeRatingV2
            case franceAgeRating
            case kidsAgeBand
            case koreaAgeRating
            case primaryCategory
            case primarySubcategoryOne
            case primarySubcategoryTwo
            case secondaryCategory
            case secondarySubcategoryOne
            case secondarySubcategoryTwo
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppInfos(rawValue: string) {
                    self = value
                } else if let value = AppInfos(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppInfos value: \(string)"
                    )
                }
            }
        }

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessibilityDeclarations
            case accessibilityUrl
            case alternativeDistributionKey
            case analyticsReportRequests
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case backgroundAssets
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaFeedbackCrashSubmissions
            case betaFeedbackScreenshotSubmissions
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviewSummarizations
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case marketplaceSearchDetail
            case name
            case perfPowerMetrics
            case preReleaseVersions
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case streamlinedPurchasingEnabled
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
            case webhooks

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Apps(rawValue: string) {
                    self = value
                } else if let value = Apps(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Apps value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case ageRatingDeclaration
        case app
        case appInfoLocalizations
        case primaryCategory
        case primarySubcategoryOne
        case primarySubcategoryTwo
        case secondaryCategory
        case secondarySubcategoryOne
        case secondarySubcategoryTwo
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appInfoLocalizations returned (when they are included) - maximum 50
        case appInfoLocalizations(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
