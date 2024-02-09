import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the marketplace search detail URL
     Get the alternative marketplace search detail URL for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_marketplace_search_detail_url>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMarketplaceSearchDetailForAppV1(id: String,
                                                   fields: [GetMarketplaceSearchDetailForAppV1.Field]? = nil) -> Request<MarketplaceSearchDetailResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/marketplaceSearchDetail", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetMarketplaceSearchDetailForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type marketplaceSearchDetails
        case marketplaceSearchDetails([MarketplaceSearchDetails])

        public enum MarketplaceSearchDetails: String, ParameterValue, Codable, CaseIterable {
            case app
            case catalogUrl
        }
    }
}
