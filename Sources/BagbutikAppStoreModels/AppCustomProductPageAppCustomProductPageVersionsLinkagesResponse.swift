import BagbutikCore
import Foundation

/**
 # AppCustomProductPageAppCustomProductPageVersionsLinkagesResponse

 A response containing the resource identifiers of versions for a custom App Store product page.

 ```
 object AppCustomProductPageAppCustomProductPageVersionsLinkagesResponse
 ```

 ## Topics

 ### Dictionaries

 [`object AppCustomProductPageAppCustomProductPageVersionsLinkagesResponse.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppCustomProductPageAppCustomProductPageVersionsLinkagesResponse/Data-data.dictionary)

 The data element of the response body.

 ## See Also

 [`object App`](https://developer.apple.com/documentation/AppStoreConnectAPI/App)

 An app registered in App Store Connect, representing all versions, metadata, and configuration for your iOS, macOS, tvOS, or watchOS application.

 [`object AppWithoutIncludesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppWithoutIncludesResponse)

 A response containing a single app, without including related resources.

 [`object AppsWithoutIncludesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppsWithoutIncludesResponse)

 A response containing a list of apps, without including related resources.

 [`object AppUpdateRequest`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppUpdateRequest)

 The request body you use to update an App Update.

 [`object AppClipsResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppClipsResponse)

 The response body for endpoints that list App Clips for an app.

 [`object AppResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppResponse)

 The response body for endpoints that read or modify a single app in your team.

 [`object AppsResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppsResponse)

 A response containing a list of apps registered in your App Store Connect team.

 [`object InAppPurchase`](https://developer.apple.com/documentation/AppStoreConnectAPI/InAppPurchase)

 A one-time purchasable item available in an app, such as a consumable, non-consumable, or non-renewing subscription.

 [`object InAppPurchaseResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/InAppPurchaseResponse)

 The response body for endpoints that read a single in-app purchase.

 [`object InAppPurchasesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/InAppPurchasesResponse)

 The response body for endpoints that list in-app purchases for an app.

 [`object AppBetaTestersLinkagesRequest`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppBetaTestersLinkagesRequest)

 A request body you use to remove beta testers from an app.

 [`object AppPricePointV3`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppPricePointV3)

 A specific price tier in App Store pricing, defining the customer price and developer proceeds across territories.

 [`object AppPricePointV3Response`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppPricePointV3Response)

 A response containing a single App Store price point with its territory-specific pricing details.

 [`object AppPricePointsV3Response`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppPricePointsV3Response)

 A response containing a list of available App Store price points.

 [`object AppPriceSchedule`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppPriceSchedule)

 The pricing schedule for an app, specifying base territory prices, manual prices for other territories, and scheduled price changes.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageappcustomproductpageversionslinkagesresponse>
 */
public struct AppCustomProductPageAppCustomProductPageVersionsLinkagesResponse: Codable, Sendable, PagedResponse {
    public let data: [Data]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Data],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Data].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "appCustomProductPageVersions" }

        public init(id: String) {
            self.id = id
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
        }
    }
}
