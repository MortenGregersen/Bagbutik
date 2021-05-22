public extension Request {
    /**
      # List All Builds of a Prerelease Version
      Get a list of builds of a specific prerelease version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_builds_of_a_prerelease_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBuildsForPreReleaseVersion(id: String,
                                               fields: [ListBuildsForPreReleaseVersion.Field]? = nil,
                                               limit: Int? = nil) -> Request<BuildsResponse, ErrorResponse>
    {
        return .init(path: "/v1/preReleaseVersions/\(id)/builds", method: .get, parameters: .init(fields: fields,
                                                                                                  limit: limit))
    }
}

public enum ListBuildsForPreReleaseVersion {
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
}
