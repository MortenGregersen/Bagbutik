import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase offer code custom code information
     Get information about a specific in-app purchase offer code custom code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodeCustomCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseOfferCodeCustomCodeV1(id: String,
                                                      fields: [GetInAppPurchaseOfferCodeCustomCodeV1.Field]? = nil,
                                                      includes: [GetInAppPurchaseOfferCodeCustomCodeV1.Include]? = nil) -> Request<InAppPurchaseOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeCustomCodes/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetInAppPurchaseOfferCodeCustomCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseOfferCodeCustomCodes
        case inAppPurchaseOfferCodeCustomCodes([InAppPurchaseOfferCodeCustomCodes])

        public enum InAppPurchaseOfferCodeCustomCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdByActor
            case createdDate
            case customCode
            case deactivatedByActor
            case expirationDate
            case numberOfCodes

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferCodeCustomCodes(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferCodeCustomCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferCodeCustomCodes value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case createdByActor
        case deactivatedByActor
    }
}
