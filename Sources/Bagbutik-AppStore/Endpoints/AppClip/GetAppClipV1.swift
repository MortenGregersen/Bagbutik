import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Clip Information
     Get a specific App Clip.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClips-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appClipDefaultExperiences returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipV1(id: String,
                             fields: [GetAppClipV1.Field]? = nil,
                             includes: [GetAppClipV1.Include]? = nil,
                             limit: GetAppClipV1.Limit? = nil) -> Request<AppClipResponse, ErrorResponse>
    {
        .init(path: "/v1/appClips/\(id)", method: .get, parameters: .init(fields: fields,
                                                                          includes: includes,
                                                                          limits: limit.map { [$0] }))
    }
}

public enum GetAppClipV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperiences
        case appClipDefaultExperiences([AppClipDefaultExperiences])
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])

        public enum AppClipDefaultExperiences: String, Sendable, ParameterValue, Codable, CaseIterable {
            case action
            case appClip
            case appClipAppStoreReviewDetail
            case appClipDefaultExperienceLocalizations
            case releaseWithAppStoreVersion
        }

        public enum AppClips: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appClipAdvancedExperiences
        case appClipDefaultExperiences
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appClipDefaultExperiences returned (when they are included) - maximum 50
        case appClipDefaultExperiences(Int)
    }
}
