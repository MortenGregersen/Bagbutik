public extension Request {
    /**
      # Read Build Beta Detail Information
      Get a specific build beta details resource.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_build_beta_detail_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBuildBetaDetailV1(id: String,
                                     fields: [GetBuildBetaDetailV1.Field]? = nil,
                                     includes: [GetBuildBetaDetailV1.Include]? = nil) -> Request<BuildBetaDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBetaDetails/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes))
    }
}

public enum V1GetBuildBetaDetail {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildBetaDetails
        case buildBetaDetails([BuildBetaDetails])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BuildBetaDetails: String, ParameterValue, CaseIterable {
            case autoNotifyEnabled
            case build
            case externalBuildState
            case internalBuildState
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
