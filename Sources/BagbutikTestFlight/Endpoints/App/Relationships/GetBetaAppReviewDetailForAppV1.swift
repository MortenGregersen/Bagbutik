import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Read the beta app review details resource of an app

     Get the beta app review details for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppReviewDetail
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "betaAppReviewDetails",
             "id": "6446998023",
             "attributes": {
                 "contactFirstName": "Johnny",
                 "contactLastName": "Appleseed",
                 "contactPhone": "8001234567",
                 "contactEmail": "example@apple.com",
                 "demoAccountName": null,
                 "demoAccountPassword": null,
                 "demoAccountRequired": false,
                 "notes": null
             },
             "relationships": {
                 "app": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/6446998023/relationships/app",
                         "related": "https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/6446998023/app"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/6446998023"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppReviewDetail"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-betaAppReviewDetail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewDetailForAppV1(id: String,
                                               fields: [GetBetaAppReviewDetailForAppV1.Field]? = nil) -> Request<BetaAppReviewDetailWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/betaAppReviewDetail",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBetaAppReviewDetailForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppReviewDetails
        case betaAppReviewDetails([BetaAppReviewDetails])

        public enum BetaAppReviewDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaAppReviewDetails(rawValue: string) {
                    self = value
                } else if let value = BetaAppReviewDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaAppReviewDetails value: \(string)"
                    )
                }
            }
        }
    }
}
