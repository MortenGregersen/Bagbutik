import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Default App Clip Experience
     Configure a new default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_default_app_clip_experience>

     - Parameter requestBody: AppClipDefaultExperience representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipDefaultExperienceV1(requestBody: AppClipDefaultExperienceCreateRequest) -> Request<AppClipDefaultExperienceResponse, ErrorResponse> {
        .init(path: "/v1/appClipDefaultExperiences", method: .post, requestBody: requestBody)
    }
}
