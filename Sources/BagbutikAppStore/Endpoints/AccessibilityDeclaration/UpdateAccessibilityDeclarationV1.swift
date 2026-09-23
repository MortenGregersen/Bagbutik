import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an Accessibility Declaration

     Update the attributes of a specific accessibility declaration.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-accessibilityDeclarations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AccessibilityDeclaration representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAccessibilityDeclarationV1(id: String,
                                                 requestBody: AccessibilityDeclarationUpdateRequest) -> Request<AccessibilityDeclarationResponse, ErrorResponse> {
        .init(
            path: "/v1/accessibilityDeclarations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
