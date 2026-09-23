import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the end user license agreement information of an app

     Get the custom end user license agreement (EULA) for a specific app and the territories where the agreement applies.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/1000001234/endUserLicenseAgreement
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "endUserLicenseAgreements",
         "id": "d187a413-70fb-45c7-ae43-12345ea0d40",
         "attributes": {
           "agreementText": "This is the agreement. It is vital you read it."
         },
         "relationships": {
           "territories": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/d187a413-70fb-45c7-ae43-12345ea0d40/relationships/territories",
               "related": "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/d187a413-70fb-45c7-ae43-12345ea0d40/territories"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/d187a413-70fb-45c7-ae43-12345ea0d40"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/1000001234/endUserLicenseAgreement"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-endUserLicenseAgreement>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getEndUserLicenseAgreementForAppV1(id: String,
                                                   fields: [GetEndUserLicenseAgreementForAppV1.Field]? = nil) -> Request<EndUserLicenseAgreementWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/endUserLicenseAgreement",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetEndUserLicenseAgreementForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])

        public enum EndUserLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
            case territories

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = EndUserLicenseAgreements(rawValue: string) {
                    self = value
                } else if let value = EndUserLicenseAgreements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid EndUserLicenseAgreements value: \(string)"
                    )
                }
            }
        }
    }
}
