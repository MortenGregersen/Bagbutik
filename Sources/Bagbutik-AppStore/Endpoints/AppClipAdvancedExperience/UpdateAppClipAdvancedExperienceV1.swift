import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify and Delete an Advanced App Clip Experience
     Update and delete an existing advanced App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipAdvancedExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipAdvancedExperience representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipAdvancedExperienceV1(id: String,
                                                  requestBody: AppClipAdvancedExperienceUpdateRequest) -> Request<AppClipAdvancedExperienceResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipAdvancedExperiences/\(id)", method: .patch, requestBody: requestBody)
    }
}
