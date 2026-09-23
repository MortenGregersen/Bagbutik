import BagbutikCore
import BagbutikMarketplacesModels
import BagbutikModelsShared

public extension Request {
    /**
     # List Alternative Distribution Keys

     List the alternative distribution key for your account.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "alternativeDistributionKeys",
           "id": "050614c7-6d00-4db1-98e6-5869c8281f30",
           "attributes": {
             "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEskEtS7l4Bl4321ZcP0V7H7rHnmncHAiUWSFK/Hz4bzhd1ZyPYRwRv6zeuH+CiVmFrggScHVrBO0UUz+gRN73kQ==-----END PUBLIC KEY-----"
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/050614c7-6d00-1234-98e6-5869c8281f30"
           }
         },
         {
           "type": "alternativeDistributionKeys",
           "id": "739970a0-9c7e-4fd1-be2c-f13204c728b7",
           "attributes": {
             "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEZfD+k4321CZCu2tEx0SMsyhInL2G4lRBlF1ZDNnKBV7MPHFlDIQd92S2h37w46qrqVEivpSSWnFKVks+ZBeE5w==-----END PUBLIC KEY-----"
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/739970a0-9c7e-2222-be2c-f13204c728b7"
           }
         },
         {
           "type": "alternativeDistributionKeys",
           "id": "ac79daa8-f11c-4c38-b244-4c7a464dbf82",
           "attributes": {
             "publicKey": "-----BEGIN PUBLIC KEY-----MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE38Gko2k5454321/+bSb/rMd2BRU0RZoHKRMm214cqeickeWFVpOQMHXOvOuhS+i3pX7fiVGvMthanQP2KIwiZQ==-----END PUBLIC KEY-----"
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys/ac79daa8-f11c-ffff-b244-4c7a464dbf82"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionKeys"
       },
       "meta": {
         "paging": {
           "total": 3,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionKeys>

     - Parameter fields: Fields to return for included related types
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAlternativeDistributionKeysV1(fields: [ListAlternativeDistributionKeysV1.Field]? = nil,
                                                  exists: [ListAlternativeDistributionKeysV1.Exist]? = nil,
                                                  limit: Int? = nil) -> Request<AlternativeDistributionKeysResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionKeys",
            method: .get,
            parameters: .init(
                fields: fields,
                exists: exists,
                limit: limit))
    }
}

public enum ListAlternativeDistributionKeysV1 {
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

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by existence or non-existence of related 'app'
        case app(Bool)
    }
}
