public extension Request {
    /**
      # Read the Build Information of a Beta Build Localization
      Get the build information for a specific beta build localization.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_build_information_of_a_beta_build_localization>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBuildForBetaBuildLocalization(id: String,
                                                 fields: [GetBuildForBetaBuildLocalization.Field]? = nil) -> Request<BuildResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaBuildLocalizations/\(id)/build", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBuildForBetaBuildLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])

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
}
