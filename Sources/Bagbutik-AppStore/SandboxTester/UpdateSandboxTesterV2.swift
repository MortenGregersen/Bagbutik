import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Sandbox Tester
     Change the subscription renewal time rate, set interrupted purchases or change territory of Sandbox Apple ID.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_sandbox_tester>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SandboxTester representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSandboxTesterV2(id: String,
                                      requestBody: SandboxTesterV2UpdateRequest) -> Request<SandboxTesterV2Response, ErrorResponse>
    {
        .init(path: "/v2/sandboxTesters/\(id)", method: .patch, requestBody: requestBody)
    }
}
