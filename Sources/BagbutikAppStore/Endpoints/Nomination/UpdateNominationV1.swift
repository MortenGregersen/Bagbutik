import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a Nomination

     Update a specific featuring nomination.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-nominations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Nomination representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateNominationV1(id: String,
                                   requestBody: NominationUpdateRequest) -> Request<NominationResponse, ErrorResponse> {
        .init(
            path: "/v1/nominations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
