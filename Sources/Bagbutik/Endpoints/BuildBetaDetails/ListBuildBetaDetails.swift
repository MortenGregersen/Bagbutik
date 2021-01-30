public extension Request {
    enum ListBuildBetaDetails {
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
         Attributes, relationships, and IDs by which to filter.
         */
        public enum Filter: FilterParameter {
            /// Filter by id(s) of related 'build'
            case build([String])
            /// Filter by id(s)
            case id([String])
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case build
        }
    }

    /**
      # List Build Beta Details
      Find and list build beta details for all builds.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_build_beta_details>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBuildBetaDetails(fields: [ListBuildBetaDetails.Field]? = nil,
                                     filters: [ListBuildBetaDetails.Filter]? = nil,
                                     includes: [ListBuildBetaDetails.Include]? = nil,
                                     limit: Int? = nil) -> Request<BuildBetaDetailsResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBetaDetails", method: .get, parameters: .init(fields: fields,
                                                                                   filters: filters,
                                                                                   includes: includes,
                                                                                   limit: limit))
    }
}
