import BagbutikCore
import Foundation

/**
 # AlternativeDistributionPackageVariantsResponse

 A response containing a list of device-specific variants within an alternative distribution package.

 ```
 object AlternativeDistributionPackageVariantsResponse
 ```

 ## Discussion

 This object is the response that contains a list of alternative distribution package variants. For more information, see [`List Variants Information`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVersions-_id_-variants). The schema of the response body is below.

 ```javascript
 {
   "data": [
     {
       "type": "alternativeDistributionPackageVariants",
       "id": "string",
       "attributes": {
         "url": "string",
         "urlExpirationDate": "2024-02-27T00:58:50.105Z",
         "alternativeDistributionKeyBlob": "string"
       },
       "links": {
         "self": "string"
       }
     }
   ],
   "links": {
     "self": "string",
     "first": "string",
     "next": "string"
   },
   "meta": {
     "paging": {
       "total": 0,
       "limit": 0
     }
   }
 }
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagevariantsresponse>
 */
public struct AlternativeDistributionPackageVariantsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AlternativeDistributionPackageVariant

    public let data: [AlternativeDistributionPackageVariant]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AlternativeDistributionPackageVariant],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AlternativeDistributionPackageVariant].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
