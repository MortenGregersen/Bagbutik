public extension Request {
    /**
     # Delete an App Event Video Clip
     Delete a specific video clip from an in-app event.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appeventvideoclips_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppEventVideoClipV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appEventVideoClips/\(id)", method: .delete)
    }
}
