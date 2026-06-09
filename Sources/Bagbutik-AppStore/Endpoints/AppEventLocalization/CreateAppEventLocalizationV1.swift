import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app event localization
     Add a new localization for an in-app event.

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
