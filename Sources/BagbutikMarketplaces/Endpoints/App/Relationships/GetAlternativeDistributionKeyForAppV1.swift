import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Read an App’s Alternative Distribution Key

     Get the alternative distribution keys for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6473805491/alternativeDistributionKey
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “alternativeDistributionKeys”,
         “id” : “52c5cb04-1163-4a30-ad4f-a3433cd6a4f6”,
         “attributes” : {
           “publicKey” : “-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE7rsxeCw+hrwRgStk0J2vYmnGQZhagSt0fm511aTjpDVsaIy9z7jmUKjJ1jgb8P5UKmQfmw0ovD+fNTSefjrw5A==-----END PUBLIC KEY-----”
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/52c5cb04-1163-4a30-ad4f-a3433cd6a4f6”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/apps/6473805491/alternativeDistributionKey”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-alternativeDistributionKey>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionKeyForAppV1(id: String,
                                                      fields: [GetAlternativeDistributionKeyForAppV1.Field]? = nil) -> Request<AlternativeDistributionKeyResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/alternativeDistributionKey",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionKeyForAppV1 {
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
