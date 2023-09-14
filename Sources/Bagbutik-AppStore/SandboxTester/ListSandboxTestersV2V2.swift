import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Sandbox Testers
     Get a list of Sandbox Testers for your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_sandbox_testers>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSandboxTestersV2V2(fields: [ListSandboxTestersV2V2.Field]? = nil,
                                       limit: Int? = nil) -> Request<SandboxTestersV2Response, ErrorResponse>
    {
        .init(path: "/v2/sandboxTesters", method: .get, parameters: .init(fields: fields,
                                                                          limit: limit))
    }
}

public enum ListSandboxTestersV2V2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type sandboxTesters
        case sandboxTesters([SandboxTesters])

        public enum SandboxTesters: String, ParameterValue, Codable, CaseIterable {
            case acAccountName
            case applePayCompatible
            case firstName
            case interruptPurchases
            case lastName
            case subscriptionRenewalRate
            case territory
        }
    }
}
