import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # List sandbox testers

     Get a list of Sandbox Testers for your team.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v2/sandboxTesters
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "sandboxTesters",
         "id" : "47be9e57-1a3f-49c2-8ce7-af27a977ebb0",
         "attributes" : {
           "firstName" : "Anne",
           "lastName" : "Johnson",
           "acAccountName" : "annejohnson1@icloud.com",
           "territory" : "USA",
           "applePayCompatible" : true,
           "interruptPurchases" : false,
           "subscriptionRenewalRate" : "MONTHLY_RENEWAL_EVERY_FIVE_MINUTES"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters"
       },
       "meta" : {
         "paging" : {
           "total" : 1,
           "limit" : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-sandboxTesters>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSandboxTestersV2(fields: [ListSandboxTestersV2.Field]? = nil,
                                     limit: Int? = nil) -> Request<SandboxTestersV2Response, ErrorResponse> {
        .init(
            path: "/v2/sandboxTesters",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListSandboxTestersV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type sandboxTesters
        case sandboxTesters([SandboxTesters])

        public enum SandboxTesters: String, Sendable, ParameterValue, Codable, CaseIterable {
            case acAccountName
            case applePayCompatible
            case firstName
            case interruptPurchases
            case lastName
            case subscriptionRenewalRate
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SandboxTesters(rawValue: string) {
                    self = value
                } else if let value = SandboxTesters(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SandboxTesters value: \(string)"
                    )
                }
            }
        }
    }
}
