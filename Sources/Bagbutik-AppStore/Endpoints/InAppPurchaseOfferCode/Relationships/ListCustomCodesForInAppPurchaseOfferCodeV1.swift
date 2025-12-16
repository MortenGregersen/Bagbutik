import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all custom codes for an in-app purchase offer code
     Get a list of custom codes for a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_-customCodes>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCustomCodesForInAppPurchaseOfferCodeV1(id: String,
                                                           fields: [ListCustomCodesForInAppPurchaseOfferCodeV1.Field]? = nil,
                                                           includes: [ListCustomCodesForInAppPurchaseOfferCodeV1.Include]? = nil,
                                                           limit: Int? = nil) -> Request<InAppPurchaseOfferCodeCustomCodesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)/customCodes",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListCustomCodesForInAppPurchaseOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type actors
        case actors([Actors])
        /// The fields to include for returned resources of type inAppPurchaseOfferCodeCustomCodes
        case inAppPurchaseOfferCodeCustomCodes([InAppPurchaseOfferCodeCustomCodes])

        public enum Actors: String, Sendable, ParameterValue, Codable, CaseIterable {
            case actorType
            case apiKeyId
            case userEmail
            case userFirstName
            case userLastName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Actors(rawValue: string) {
                    self = value
                } else if let value = Actors(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Actors value: \(string)"
                    )
                }
            }
        }

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
