import BagbutikCore
import BagbutikAppStoreModels
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the app ID for a beta app review detail

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaAppReviewDetails-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForBetaAppReviewDetailV1(id: String) -> Request<BetaAppReviewDetailAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewDetails/\(id)/relationships/app",
            method: .get)
    }
}
