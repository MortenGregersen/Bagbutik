import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Advanced App Clip Experience Information
     Get information about a specific advanced App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipAdvancedExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related localizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipAdvancedExperienceV1(id: String,
                                               fields: [GetAppClipAdvancedExperienceV1.Field]? = nil,
                                               includes: [GetAppClipAdvancedExperienceV1.Include]? = nil,
                                               limit: GetAppClipAdvancedExperienceV1.Limit? = nil) -> Request<AppClipAdvancedExperienceResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipAdvancedExperiences/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetAppClipAdvancedExperienceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAdvancedExperiences
        case appClipAdvancedExperiences([AppClipAdvancedExperiences])

        public enum AppClipAdvancedExperiences: String, Sendable, ParameterValue, Codable, CaseIterable {
            case action
            case appClip
            case businessCategory
            case defaultLanguage
            case headerImage
            case isPoweredBy
            case link
            case localizations
            case place
            case placeStatus
            case status
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appClip
        case headerImage
        case localizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
    }
}
