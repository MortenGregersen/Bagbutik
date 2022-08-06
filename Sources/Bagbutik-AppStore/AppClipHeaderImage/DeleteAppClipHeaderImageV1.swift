import Bagbutik_Models

public extension Request {
    /**
     # Delete a Default App Clip Experience Image
     Delete the image asset that appears on the App Clip card for a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_default_app_clip_experience_image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppClipHeaderImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appClipHeaderImages/\(id)", method: .delete)
    }
}
