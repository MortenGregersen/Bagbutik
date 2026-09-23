import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete a Win-Back Offer

     The data structure that represents a delete-v1-win back offers-{id} resource.

     ## Overview

     Remove a win-back offer for a specific subscription.

     ## Discussion

     **Request:**

     ```html
     DELETE https://api.appstoreconnect.apple.com/v1/winBackOffers/10759170294
     ```

     **Response:**

     ```json
         204
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-winBackOffers-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteWinBackOfferV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers/\(id)",
            method: .delete)
    }
}
