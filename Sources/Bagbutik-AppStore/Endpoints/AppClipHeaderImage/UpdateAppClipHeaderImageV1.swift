import Bagbutik_Core

public extension Request {
    /**
     # Modify an App Clip Card Image
     Change the image that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_clip_card_image>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipHeaderImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipHeaderImageV1(id: String,
                                           requestBody: AppClipHeaderImageUpdateRequest) -> Request<AppClipHeaderImageResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipHeaderImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
