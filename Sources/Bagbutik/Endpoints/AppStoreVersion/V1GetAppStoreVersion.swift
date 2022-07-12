public extension Request {
    /**
      # Read App Store Version Information
      Get information for a specific app store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_store_version_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreVersionV1(id: String,
                                     fields: [GetAppStoreVersionV1.Field]? = nil,
                                     includes: [GetAppStoreVersionV1.Include]? = nil,
                                     limits: [GetAppStoreVersionV1.Limit]? = nil) -> Request<AppStoreVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes,
                                                                                         limits: limits))
    }
}

public enum V1GetAppStoreVersion {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ageRatingDeclarations
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
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
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case appStoreVersionSubmissions([AppStoreVersionSubmissions])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type idfaDeclarations
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case idfaDeclarations([IdfaDeclarations])
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
            case downloadable
            case earliestReleaseDate
            case idfaDeclaration
            case platform
            case releaseType
            case routingAppCoverage
            case usesIdfa
            case versionString
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case ageRatingDeclaration, app, appClipDefaultExperience, appStoreReviewDetail, appStoreVersionExperiments, appStoreVersionLocalizations, appStoreVersionPhasedRelease, appStoreVersionSubmission, build, idfaDeclaration, routingAppCoverage
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
