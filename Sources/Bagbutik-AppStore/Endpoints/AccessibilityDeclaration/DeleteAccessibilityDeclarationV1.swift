import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an accessibility declaration
     Delete a specific accessibility declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-accessibilityDeclarations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAccessibilityDeclarationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/accessibilityDeclarations/\(id)",
            method: .delete)
    }
}
