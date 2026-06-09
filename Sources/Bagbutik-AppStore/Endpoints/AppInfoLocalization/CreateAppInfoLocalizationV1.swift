import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app info localization
     Add app-level localized information for a new locale.

     Use this endpoint to add localized app information for a new locale. Be sure to use [Create an app store version localization](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appstoreversionlocalizations) to add the same locale to the version as well.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appInfoLocalizations>

     - Parameter requestBody: AppInfoLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppInfoLocalizationV1(requestBody: AppInfoLocalizationCreateRequest) -> Request<AppInfoLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfoLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
