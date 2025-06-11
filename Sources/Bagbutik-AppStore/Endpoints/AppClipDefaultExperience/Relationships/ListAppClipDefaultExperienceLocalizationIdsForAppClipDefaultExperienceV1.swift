import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appClipDefaultExperiences/{id}/relationships/appClipDefaultExperienceLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipDefaultExperiences-_id_-relationships-appClipDefaultExperienceLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppClipDefaultExperienceLocalizationIdsForAppClipDefaultExperienceV1(id: String,
                                                                                         limit: Int? = nil) -> Request<AppClipDefaultExperienceAppClipDefaultExperienceLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences/\(id)/relationships/appClipDefaultExperienceLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
