public extension Request {
    /**
      # List Beta Build Localizations
      Find and list beta build localizations currently associated with apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_beta_build_localizations>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaBuildLocalizationsV1(fields: [ListBetaBuildLocalizationsV1.Field]? = nil,
                                             filters: [ListBetaBuildLocalizationsV1.Filter]? = nil,
                                             includes: [ListBetaBuildLocalizationsV1.Include]? = nil,
                                             limit: Int? = nil) -> Request<BetaBuildLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaBuildLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                         filters: filters,
                                                                                         includes: includes,
                                                                                         limit: limit))
    }
}

public enum V1ListBetaBuildLocalizations {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaBuildLocalizations
        case betaBuildLocalizations([BetaBuildLocalizations])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BetaBuildLocalizations: String, ParameterValue, CaseIterable {
            case build
            case locale
            case whatsNew
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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'build'
        case build([String])
        /// Filter by attribute 'locale'
        case locale([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case build
    }
}
