public extension Request {
    enum GetBuildBetaDetail {
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
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case build
        }
    }

    /**
      # Read Build Beta Detail Information
      Get a specific build beta details resource.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_build_beta_detail_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBuildBetaDetail(id: String,
                                   fields: [GetBuildBetaDetail.Field]? = nil,
                                   includes: [GetBuildBetaDetail.Include]? = nil) -> Request<BuildBetaDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBetaDetails/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes))
    }
}
