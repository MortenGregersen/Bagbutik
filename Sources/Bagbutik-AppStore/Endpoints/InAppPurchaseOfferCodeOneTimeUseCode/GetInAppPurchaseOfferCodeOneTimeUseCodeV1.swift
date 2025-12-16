import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase offer code one-time use code information
     Get information about a specific in-app purchase offer code one-time use code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodeOneTimeUseCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseOfferCodeOneTimeUseCodeV1(id: String,
                                                          fields: [GetInAppPurchaseOfferCodeOneTimeUseCodeV1.Field]? = nil,
                                                          includes: [GetInAppPurchaseOfferCodeOneTimeUseCodeV1.Include]? = nil) -> Request<InAppPurchaseOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetInAppPurchaseOfferCodeOneTimeUseCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseOfferCodeOneTimeUseCodes
        case inAppPurchaseOfferCodeOneTimeUseCodes([InAppPurchaseOfferCodeOneTimeUseCodes])

        public enum InAppPurchaseOfferCodeOneTimeUseCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdByActor
            case createdDate
            case deactivatedByActor
            case environment
            case expirationDate
            case numberOfCodes
            case values

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferCodeOneTimeUseCodes(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferCodeOneTimeUseCodes(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferCodeOneTimeUseCodes value: \(string)"
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
