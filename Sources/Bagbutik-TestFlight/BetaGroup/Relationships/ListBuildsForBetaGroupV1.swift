import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Builds for a Beta Group
     Get a list of builds associated with a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_builds_for_a_betagroup>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildsForBetaGroupV1(id: String,
                                         fields: [ListBuildsForBetaGroupV1.Field]? = nil,
                                         limit: Int? = nil) -> Request<BuildsResponse, ErrorResponse>
    {
        .init(path: "/v1/betaGroups/\(id)/builds", method: .get, parameters: .init(fields: fields,
                                                                                   limit: limit))
    }
}

public enum ListBuildsForBetaGroupV1 {
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
