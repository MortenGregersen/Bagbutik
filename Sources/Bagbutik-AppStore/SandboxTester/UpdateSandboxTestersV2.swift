import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Sandbox Tester
     Change the subscription renewal time rate, set interrupted purchases or change territory of Sandbox Apple Account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-sandboxTesters-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SandboxTester representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSandboxTestersV2(id: String,
                                       requestBody: SandboxTesterV2UpdateRequest) -> Request<SandboxTesterV2Response, ErrorResponse>
    {
        .init(path: "/v2/sandboxTesters/\(id)", method: .patch, requestBody: requestBody)
    }
}
