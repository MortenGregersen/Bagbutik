import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Default App Clip Experience
     Delete a specific default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appClipDefaultExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppClipDefaultExperienceV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appClipDefaultExperiences/\(id)", method: .delete)
    }
}
