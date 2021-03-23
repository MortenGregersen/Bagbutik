public extension Request {
    enum ListAppStoreVersionsForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type ageRatingDeclarations
            case ageRatingDeclarations([AgeRatingDeclarations])
            /// The fields to include for returned resources of type appStoreReviewDetails
            case appStoreReviewDetails([AppStoreReviewDetails])
            /// The fields to include for returned resources of type appStoreVersionLocalizations
            case appStoreVersionLocalizations([AppStoreVersionLocalizations])
            /// The fields to include for returned resources of type appStoreVersionPhasedReleases
            case appStoreVersionPhasedReleases([AppStoreVersionPhasedReleases])
            /// The fields to include for returned resources of type appStoreVersionSubmissions
            case appStoreVersionSubmissions([AppStoreVersionSubmissions])
            /// The fields to include for returned resources of type appStoreVersions
            case appStoreVersions([AppStoreVersions])
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type builds
            case builds([Builds])
            /// The fields to include for returned resources of type idfaDeclarations
            case idfaDeclarations([IdfaDeclarations])
            /// The fields to include for returned resources of type routingAppCoverages
            case routingAppCoverages([RoutingAppCoverages])

            public enum AgeRatingDeclarations: String, ParameterValue, CaseIterable {
                case alcoholTobaccoOrDrugUseOrReferences
                case gamblingAndContests
                case gamblingSimulated
                case horrorOrFearThemes
                case kidsAgeBand
                case matureOrSuggestiveThemes
                case medicalOrTreatmentInformation
                case profanityOrCrudeHumor
                case sexualContentGraphicAndNudity
                case sexualContentOrNudity
                case unrestrictedWebAccess
                case violenceCartoonOrFantasy
                case violenceRealistic
                case violenceRealisticProlongedGraphicOrSadistic
            }

            public enum AppStoreReviewDetails: String, ParameterValue, CaseIterable {
                case appStoreReviewAttachments
                case appStoreVersion
                case contactEmail
                case contactFirstName
                case contactLastName
                case contactPhone
                case demoAccountName
                case demoAccountPassword
                case demoAccountRequired
                case notes
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

            public enum AppStoreVersionPhasedReleases: String, ParameterValue, CaseIterable {
                case appStoreVersion
                case currentDayNumber
                case phasedReleaseState
                case startDate
                case totalPauseDuration
            }

            public enum AppStoreVersionSubmissions: String, ParameterValue, CaseIterable {
                case appStoreVersion
            }

            public enum AppStoreVersions: String, ParameterValue, CaseIterable {
                case ageRatingDeclaration
                case app
                case appStoreReviewDetail
                case appStoreState
                case appStoreVersionLocalizations
                case appStoreVersionPhasedRelease
                case appStoreVersionSubmission
                case build
                case copyright
                case createdDate
                case downloadable
                case earliestReleaseDate
                case idfaDeclaration
                case platform
                case releaseType
                case routingAppCoverage
                case usesIdfa
                case versionString
            }

            public enum Apps: String, ParameterValue, CaseIterable {
                case appInfos
                case appStoreVersions
                case availableInNewTerritories
                case availableTerritories
                case betaAppLocalizations
                case betaAppReviewDetail
                case betaGroups
                case betaLicenseAgreement
                case betaTesters
                case builds
                case bundleId
                case contentRightsDeclaration
                case endUserLicenseAgreement
                case gameCenterEnabledVersions
                case inAppPurchases
                case isOrEverWasMadeForKids
                case name
                case perfPowerMetrics
                case preOrder
                case preReleaseVersions
                case prices
                case primaryLocale
                case sku
            }

            public enum Builds: String, ParameterValue, CaseIterable {
                case app
                case appEncryptionDeclaration
                case appStoreVersion
                case betaAppReviewSubmission
                case betaBuildLocalizations
                case betaGroups
                case buildBetaDetail
                case diagnosticSignatures
                case expirationDate
                case expired
                case iconAssetToken
                case icons
                case individualTesters
                case minOsVersion
                case perfPowerMetrics
                case preReleaseVersion
                case processingState
                case uploadedDate
                case usesNonExemptEncryption
                case version
            }

            public enum IdfaDeclarations: String, ParameterValue, CaseIterable {
                case appStoreVersion
                case attributesActionWithPreviousAd
                case attributesAppInstallationToPreviousAd
                case honorsLimitedAdTracking
                case servesAds
            }

            public enum RoutingAppCoverages: String, ParameterValue, CaseIterable {
                case appStoreVersion
                case assetDeliveryState
                case fileName
                case fileSize
                case sourceFileChecksum
                case uploadOperations
                case uploaded
            }
        }

        /**
         Attributes, relationships, and IDs by which to filter.
         */
        public enum Filter: FilterParameter {
            /// Filter by attribute 'appStoreState'
            case appStoreState([AppStoreState])
            /// Filter by id(s)
            case id([String])
            /// Filter by attribute 'platform'
            case platform([Platform])
            /// Filter by attribute 'versionString'
            case versionString([String])

            public enum AppStoreState: String, ParameterValue, CaseIterable {
                case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
                case developerRejected = "DEVELOPER_REJECTED"
                case inReview = "IN_REVIEW"
                case invalidBinary = "INVALID_BINARY"
                case metadataRejected = "METADATA_REJECTED"
                case pendingAppleRelease = "PENDING_APPLE_RELEASE"
                case pendingContract = "PENDING_CONTRACT"
                case pendingDeveloperRelease = "PENDING_DEVELOPER_RELEASE"
                case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
                case preorderReadyForSale = "PREORDER_READY_FOR_SALE"
                case processingForAppStore = "PROCESSING_FOR_APP_STORE"
                case readyForSale = "READY_FOR_SALE"
                case rejected = "REJECTED"
                case removedFromSale = "REMOVED_FROM_SALE"
                case waitingForExportCompliance = "WAITING_FOR_EXPORT_COMPLIANCE"
                case waitingForReview = "WAITING_FOR_REVIEW"
                case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
            }

            /// Strings that represent Apple operating systems.
            public enum Platform: String, ParameterValue, CaseIterable {
                /// A string that represents iOS.
                case iOS = "IOS"
                /// A string that represents macOS.
                case macOS = "MAC_OS"
                /// A string that represents tvOS.
                case tvOS = "TV_OS"
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case ageRatingDeclaration, app, appStoreReviewDetail, appStoreVersionLocalizations, appStoreVersionPhasedRelease, appStoreVersionSubmission, build, idfaDeclaration, routingAppCoverage
        }
    }

    /**
      # List All App Store Versions for an App
      Get a list of all App Store versions of an app across all platforms.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_store_versions_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppStoreVersionsForApp(id: String,
                                           fields: [ListAppStoreVersionsForApp.Field]? = nil,
                                           filters: [ListAppStoreVersionsForApp.Filter]? = nil,
                                           includes: [ListAppStoreVersionsForApp.Include]? = nil,
                                           limit: Int? = nil) -> Request<AppStoreVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/appStoreVersions", method: .get, parameters: .init(fields: fields,
                                                                                              filters: filters,
                                                                                              includes: includes,
                                                                                              limit: limit))
    }
}
