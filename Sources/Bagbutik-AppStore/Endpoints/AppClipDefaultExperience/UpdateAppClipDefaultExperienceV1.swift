import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Default App Clip Experience
     Update a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipDefaultExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipDefaultExperience representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipDefaultExperienceV1(id: String,
                                                 requestBody: AppClipDefaultExperienceUpdateRequest) -> Request<AppClipDefaultExperienceResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
