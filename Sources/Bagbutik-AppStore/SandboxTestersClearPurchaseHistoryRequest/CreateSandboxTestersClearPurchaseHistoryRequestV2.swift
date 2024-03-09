import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Clear Purchase History for a Sandbox Tester
     Remove purchase history from a Sandbox Apple ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/clear_purchase_history_for_a_sandbox_tester>

     - Parameter requestBody: SandboxTestersClearPurchaseHistoryRequest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSandboxTestersClearPurchaseHistoryRequestV2(requestBody: SandboxTestersClearPurchaseHistoryRequestV2CreateRequest) -> Request<SandboxTestersClearPurchaseHistoryRequestV2Response, ErrorResponse> {
        .init(path: "/v2/sandboxTestersClearPurchaseHistoryRequest", method: .post, requestBody: requestBody)
    }
}
