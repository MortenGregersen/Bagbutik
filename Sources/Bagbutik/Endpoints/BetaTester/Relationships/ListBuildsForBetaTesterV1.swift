public extension Request {
    /**
      # List All Builds Individually Assigned to a Beta Tester
      Get a list of builds individually assigned to a specific beta tester.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_builds_individually_assigned_to_a_beta_tester>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBuildsForBetaTesterV1(id: String,
                                          fields: [ListBuildsForBetaTesterV1.Field]? = nil,
                                          limit: Int? = nil) -> Request<BuildsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/builds", method: .get, parameters: .init(fields: fields,
                                                                                           limit: limit))
    }
}

public enum ListBuildsForBetaTesterV1 {
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
