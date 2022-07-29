public extension Request {
    /**
     # Read the App Store Version Information of a Build
     Get the App Store version of a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_version_information_of_a_build>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionForBuildV1(id: String,
                                             fields: [GetAppStoreVersionForBuildV1.Field]? = nil,
                                             includes: [GetAppStoreVersionForBuildV1.Include]? = nil,
                                             limits: [GetAppStoreVersionForBuildV1.Limit]? = nil) -> Request<AppStoreVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/appStoreVersion", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes,
                                                                                        limits: limits))
    }
}

public enum GetAppStoreVersionForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ageRatingDeclarations
        case ageRatingDeclarations([AgeRatingDeclarations])
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])
        /// The fields to include for returned resources of type appStoreReviewDetails
        case appStoreReviewDetails([AppStoreReviewDetails])
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])
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
        /// The fields to include for returned resources of type routingAppCoverages
        case routingAppCoverages([RoutingAppCoverages])

        public enum AgeRatingDeclarations: String, ParameterValue, CaseIterable {
            case alcoholTobaccoOrDrugUseOrReferences
            case contests
            case gambling
            case gamblingAndContests
            case gamblingSimulated
            case horrorOrFearThemes
            case kidsAgeBand
            case matureOrSuggestiveThemes
            case medicalOrTreatmentInformation
            case profanityOrCrudeHumor
            case seventeenPlus
            case sexualContentGraphicAndNudity
            case sexualContentOrNudity
            case unrestrictedWebAccess
            case violenceCartoonOrFantasy
            case violenceRealistic
            case violenceRealisticProlongedGraphicOrSadistic
        }

        public enum AppClipDefaultExperiences: String, ParameterValue, CaseIterable {
            case action
            case appClip
            case appClipAppStoreReviewDetail
            case appClipDefaultExperienceLocalizations
            case appClipDefaultExperienceTemplate
            case releaseWithAppStoreVersion
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

        public enum AppStoreVersionExperiments: String, ParameterValue, CaseIterable {
            case appStoreVersion
            case appStoreVersionExperimentTreatments
            case endDate
            case name
            case reviewRequired
            case startDate
            case started
            case state
            case trafficProportion
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
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case platform
            case releaseType
            case routingAppCoverage
            case versionString
        }

        public enum Apps: String, ParameterValue, CaseIterable {
            case appClips
            case appCustomProductPages
            case appEvents
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
            case ciProduct
            case contentRightsDeclaration
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }

        public enum Builds: String, ParameterValue, CaseIterable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaGroups
            case buildAudienceType
            case buildBetaDetail
            case buildBundles
            case computedMinMacOsVersion
            case diagnosticSignatures
            case expirationDate
            case expired
            case iconAssetToken
            case icons
            case individualTesters
            case lsMinimumSystemVersion
            case minOsVersion
            case perfPowerMetrics
            case preReleaseVersion
            case processingState
            case uploadedDate
            case usesNonExemptEncryption
            case version
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case ageRatingDeclaration
        case app
        case appClipDefaultExperience
        case appStoreReviewDetail
        case appStoreVersionExperiments
        case appStoreVersionLocalizations
        case appStoreVersionPhasedRelease
        case appStoreVersionSubmission
        case build
        case routingAppCoverage
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appStoreVersionExperiments returned (when they are included) - maximum 50
        case appStoreVersionExperiments(Int)
        /// Maximum number of related appStoreVersionLocalizations returned (when they are included) - maximum 50
        case appStoreVersionLocalizations(Int)
    }
}
