import BagbutikCore
import Foundation

/**
 # AlternativeDistributionPackageVariantResponse

 A response containing a single variant of an alternative distribution package.

 ```
 object AlternativeDistributionPackageVariantResponse
 ```

 ## Discussion

 This object is the response that contains a single alternative distribution package variant. For more information, see [`Read variant information for an alternative distribution package`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVariants-_id_). The schema of the response body is below.

 ```javascript
 {
   "data": {
     "type": "alternativeDistributionPackageVariants",
     "id": "string",
     "attributes": {
       "url": "string",
       "urlExpirationDate": "2025-02-23T06:53:07.520Z",
       "alternativeDistributionKeyBlob": "string"
     },
     "links": {
       "self": "string"
     }
   },
   "links": {
     "self": "string"
   }
 }
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagevariantresponse>
 */
public struct AlternativeDistributionPackageVariantResponse: Codable, Sendable {
    public let data: AlternativeDistributionPackageVariant
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackageVariant,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AlternativeDistributionPackageVariant.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
