import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the header image ID for an App Clip default experience localization

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipDefaultExperienceLocalizations-_id_-relationships-appClipHeaderImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipHeaderImageIdsForAppClipDefaultExperienceLocalizationV1(id: String) -> Request<AppClipDefaultExperienceLocalizationAppClipHeaderImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperienceLocalizations/\(id)/relationships/appClipHeaderImage",
            method: .get)
    }
}
