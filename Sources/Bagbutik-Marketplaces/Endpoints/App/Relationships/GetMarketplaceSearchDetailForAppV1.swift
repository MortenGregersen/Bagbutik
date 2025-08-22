import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the marketplace search detail URL
     Get search detail URL for the alternative marketplace.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-marketplaceSearchDetail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMarketplaceSearchDetailForAppV1(id: String,
                                                   fields: [GetMarketplaceSearchDetailForAppV1.Field]? = nil) -> Request<MarketplaceSearchDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/marketplaceSearchDetail",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetMarketplaceSearchDetailForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type marketplaceSearchDetails
        case marketplaceSearchDetails([MarketplaceSearchDetails])

        public enum MarketplaceSearchDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case catalogUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = MarketplaceSearchDetails(rawValue: string) {
                    self = value
                } else if let value = MarketplaceSearchDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid MarketplaceSearchDetails value: \(string)"
                    )
                }
            }
        }
    }
}
