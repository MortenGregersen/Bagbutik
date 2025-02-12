import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a custom product page localization
     Add a localization for your app custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appCustomProductPageLocalizations>

     - Parameter requestBody: AppCustomProductPageLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppCustomProductPageLocalizationV1(requestBody: AppCustomProductPageLocalizationCreateRequest) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/appCustomProductPageLocalizations", method: .post, requestBody: requestBody)
    }
}
