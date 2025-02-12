import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store Version Localization
     Add localized version-level information for a new locale.

     Use this endpoint to add localized version information for a new locale. Be sure to use [Create an App Info Localization](https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appinfolocalizations) to add the same locale to the version as well.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionLocalizations>

     - Parameter requestBody: AppStoreVersionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionLocalizationV1(requestBody: AppStoreVersionLocalizationCreateRequest) -> Request<AppStoreVersionLocalizationResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionLocalizations", method: .post, requestBody: requestBody)
    }
}
