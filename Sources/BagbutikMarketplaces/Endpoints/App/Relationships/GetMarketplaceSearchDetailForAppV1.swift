import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Read the marketplace search detail url

     Get search detail URL for the alternative marketplace.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6476788026/marketplaceSearchDetail
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "marketplaceSearchDetails",
         "id" : "cfcfc44f-8291-4b75-84f0-4d9a55e8b878",
         "attributes" : {
           "catalogUrl" : "https://example.com/crawler-site/sitemap.xml"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/apps/6476788026/marketplaceSearchDetail"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
