import BagbutikCore
import BagbutikAppStoreModels
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the app ID for a beta app localization

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaAppLocalizations-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForBetaAppLocalizationV1(id: String) -> Request<BetaAppLocalizationAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppLocalizations/\(id)/relationships/app",
            method: .get)
    }
}
