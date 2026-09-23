import BagbutikCore
import BagbutikMarketplacesModels
import BagbutikModelsShared

public extension Request {
    /**
     # Remove an Alternative Distribution Key

     Remove an alternative distribution key from your account.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6
     ```

     **Response:**

     ```json
     204
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-alternativeDistributionKeys-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAlternativeDistributionKeyV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionKeys/\(id)",
            method: .delete)
    }
}
