import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Builds of an App
     Get a list of builds associated with a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_builds_of_an_app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildsForAppV1(id: String,
                                   fields: [ListBuildsForAppV1.Field]? = nil,
                                   limit: Int? = nil) -> Request<BuildsWithoutIncludesResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/builds", method: .get, parameters: .init(fields: fields,
                                                                             limit: limit))
    }
}

public enum ListBuildsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum Builds: String, Sendable, ParameterValue, Codable, CaseIterable {
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
