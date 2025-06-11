import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an accessibility declaration
     Update the attributes of a specific accessibility declaration.

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
