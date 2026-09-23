import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Read the beta license agreement of an app

     Get the beta license agreement for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaLicenseAgreement
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "betaLicenseAgreements",
             "id": "66237ae8-4920-497d-90f5-3f9acc76ec95",
             "attributes": {
                 "agreementText": "This is the Beta License Agreement for your Your Next Cortado. You are testing pre-release version of this app. Here are some more thoughts about a beta coffee app. The coffee might not be dialed in and you may experience less than perfect coffee."
             },
             "relationships": {
                 "app": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/66237ae8-4920-497d-90f5-3f9acc76ec95/relationships/app",
                         "related": "https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/66237ae8-4920-497d-90f5-3f9acc76ec95/app"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/66237ae8-4920-497d-90f5-3f9acc76ec95"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaLicenseAgreement"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-betaLicenseAgreement>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaLicenseAgreementForAppV1(id: String,
                                                fields: [GetBetaLicenseAgreementForAppV1.Field]? = nil) -> Request<BetaLicenseAgreementWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/betaLicenseAgreement",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBetaLicenseAgreementForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaLicenseAgreements
        case betaLicenseAgreements([BetaLicenseAgreements])

        public enum BetaLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaLicenseAgreements(rawValue: string) {
                    self = value
                } else if let value = BetaLicenseAgreements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaLicenseAgreements value: \(string)"
                    )
                }
            }
        }
    }
}
