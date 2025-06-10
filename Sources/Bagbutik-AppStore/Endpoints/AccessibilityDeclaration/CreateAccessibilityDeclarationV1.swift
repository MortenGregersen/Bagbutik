import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an accessibility declaration
     Add an accessibility declaration for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-accessibilityDeclarations>

     - Parameter requestBody: AccessibilityDeclaration representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAccessibilityDeclarationV1(requestBody: AccessibilityDeclarationCreateRequest) -> Request<AccessibilityDeclarationResponse, ErrorResponse> {
        .init(
            path: "/v1/accessibilityDeclarations",
            method: .post,
            requestBody: requestBody)
    }
}
