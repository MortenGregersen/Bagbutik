import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appEventLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEventLocalizations>

     - Parameter requestBody: AppEventLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEventLocalizationV1(requestBody: AppEventLocalizationCreateRequest) -> Request<AppEventLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
