import BagbutikCore
import BagbutikAppStoreModels
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the app ID for a beta license agreement

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaLicenseAgreements-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForBetaLicenseAgreementV1(id: String) -> Request<BetaLicenseAgreementAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaLicenseAgreements/\(id)/relationships/app",
            method: .get)
    }
}
