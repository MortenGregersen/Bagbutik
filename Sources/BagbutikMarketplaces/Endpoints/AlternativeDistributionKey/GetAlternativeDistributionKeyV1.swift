import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Read Alternative Distribution Key Information

     Read the public key information for a specific alternative distribution key.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/distributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "distributionKeys",
         "id" : "52c5cb04-1163-4a30-ad4f-a3433cd6a4f6",
         "attributes" : {
           "publicKey" : "-----BEGIN PUBLIC KEY-----
     MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEFQUkD1YB67wg3e0VD/2c3N3Wf92n
     uQqDgFZuYG/NcYLwT3Zdw77s6//8XSI2NYv7WNgUONxMj+j65Qijq4/fhw==
     -----END PUBLIC KEY-----"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/distributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/distributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionKeys-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionKeyV1(id: String,
                                                fields: [GetAlternativeDistributionKeyV1.Field]? = nil) -> Request<AlternativeDistributionKeyResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionKeys/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionKeyV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionKeys
        case alternativeDistributionKeys([AlternativeDistributionKeys])

        public enum AlternativeDistributionKeys: String, Sendable, ParameterValue, Codable, CaseIterable {
            case publicKey

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionKeys(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionKeys(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionKeys value: \(string)"
                    )
                }
            }
        }
    }
}
