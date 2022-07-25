public extension Request {
    /**
      # Read Beta Build Localization Information
      Get a specific beta build localization resource.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_build_localization_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaBuildLocalizationV1(id: String,
                                           fields: [GetBetaBuildLocalizationV1.Field]? = nil,
                                           includes: [GetBetaBuildLocalizationV1.Include]? = nil) -> Request<BetaBuildLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaBuildLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                               includes: includes))
    }
}

public enum GetBetaBuildLocalizationV1 {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case build
    }
}
