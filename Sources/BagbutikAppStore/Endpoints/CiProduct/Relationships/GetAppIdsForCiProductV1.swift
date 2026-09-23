import BagbutikCore
import BagbutikAppStoreModels
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Get the app ID for a CI product

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForCiProductV1(id: String) -> Request<CiProductAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)/relationships/app",
            method: .get)
    }
}
