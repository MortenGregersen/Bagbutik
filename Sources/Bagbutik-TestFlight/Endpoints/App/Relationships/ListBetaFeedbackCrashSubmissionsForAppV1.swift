import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all beta feedback crash submissions for an app
     Get the beta feedback crash submissions for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-betaFeedbackCrashSubmissions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaFeedbackCrashSubmissionsForAppV1(id: String,
                                                         fields: [ListBetaFeedbackCrashSubmissionsForAppV1.Field]? = nil,
                                                         filters: [ListBetaFeedbackCrashSubmissionsForAppV1.Filter]? = nil,
                                                         includes: [ListBetaFeedbackCrashSubmissionsForAppV1.Include]? = nil,
                                                         sorts: [ListBetaFeedbackCrashSubmissionsForAppV1.Sort]? = nil,
                                                         limit: Int? = nil) -> Request<BetaFeedbackCrashSubmissionsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/betaFeedbackCrashSubmissions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListBetaFeedbackCrashSubmissionsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaFeedbackCrashSubmissions
        case betaFeedbackCrashSubmissions([BetaFeedbackCrashSubmissions])
        /// The fields to include for returned resources of type betaTesters
        case betaTesters([BetaTesters])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BetaFeedbackCrashSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPlatform
            case appUptimeInMilliseconds
            case architecture
            case batteryPercentage
            case build
            case buildBundleId
            case comment
            case connectionType
            case crashLog
            case createdDate
            case deviceFamily
            case deviceModel
            case devicePlatform
            case diskBytesAvailable
            case diskBytesTotal
            case email
            case locale
            case osVersion
            case pairedAppleWatch
            case screenHeightInPoints
            case screenWidthInPoints
            case tester
            case timeZone
        }

        public enum BetaTesters: String, Sendable, ParameterValue, Codable, CaseIterable {
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
            case state
        }

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
            case computedMinVisionOsVersion
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'appPlatform'
        case appPlatform([Platform])
        /// Filter by id(s) of related 'build'
        case build([String])
        /// Filter by id(s) of related 'build.preReleaseVersion'
        case build_preReleaseVersion([String])
        /// Filter by attribute 'deviceModel'
        case deviceModel([String])
        /// Filter by attribute 'devicePlatform'
        case devicePlatform([Platform])
        /// Filter by attribute 'osVersion'
        case osVersion([String])
        /// Filter by id(s) of related 'tester'
        case tester([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case build
        case tester
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case createdDateAscending = "createdDate"
        case createdDateDescending = "-createdDate"
    }
}
