public extension Request {
    /**
      # Read the Build Information of a Build Beta Detail
      Get the build information for a specific build beta details resource.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_build_information_of_a_build_beta_detail>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildForBuildBetaDetailV1(id: String,
                                             fields: [GetBuildForBuildBetaDetailV1.Field]? = nil) -> Request<BuildResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBetaDetails/\(id)/build", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBuildForBuildBetaDetailV1 {
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
