import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Information About the Availability of an In-App Purchase
     Get information about the territory availablity for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-inAppPurchaseAvailability>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseAvailabilityForInAppPurchasesV2(id: String,
                                                                fields: [GetInAppPurchaseAvailabilityForInAppPurchasesV2.Field]? = nil,
                                                                includes: [GetInAppPurchaseAvailabilityForInAppPurchasesV2.Include]? = nil,
                                                                limit: GetInAppPurchaseAvailabilityForInAppPurchasesV2.Limit? = nil) -> Request<InAppPurchaseAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/inAppPurchaseAvailability",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetInAppPurchaseAvailabilityForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAvailabilities
        case inAppPurchaseAvailabilities([InAppPurchaseAvailabilities])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchaseAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseAvailabilities(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseAvailabilities(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseAvailabilities value: \(string)"
                    )
                }
            }
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case availableTerritories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
    }
}
