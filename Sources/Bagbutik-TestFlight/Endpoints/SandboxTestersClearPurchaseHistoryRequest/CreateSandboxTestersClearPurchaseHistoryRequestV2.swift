import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Clear Purchase History for a Sandbox Tester
     Remove purchase history from a Sandbox Apple Account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-sandboxTestersClearPurchaseHistoryRequest>

     - Parameter requestBody: SandboxTestersClearPurchaseHistoryRequest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSandboxTestersClearPurchaseHistoryRequestV2(requestBody: SandboxTestersClearPurchaseHistoryRequestV2CreateRequest) -> Request<SandboxTestersClearPurchaseHistoryRequestV2Response, ErrorResponse> {
        .init(
            path: "/v2/sandboxTestersClearPurchaseHistoryRequest",
            method: .post,
            requestBody: requestBody)
    }
}
