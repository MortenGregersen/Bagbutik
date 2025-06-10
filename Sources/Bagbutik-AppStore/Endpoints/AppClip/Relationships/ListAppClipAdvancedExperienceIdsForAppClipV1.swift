import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appClips/{id}/relationships/appClipAdvancedExperiences

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClips-_id_-relationships-appClipAdvancedExperiences>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppClipAdvancedExperienceIdsForAppClipV1(id: String,
                                                             limit: Int? = nil) -> Request<AppClipAppClipAdvancedExperiencesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appClips/\(id)/relationships/appClipAdvancedExperiences",
            method: .get,
            parameters: .init(limit: limit))
    }
}
