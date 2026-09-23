import BagbutikCore
import Foundation

/**
 # AlternativeDistributionKeyResponse

 The response body for endpoints that create or read a single alternative distribution key.

 ```
 object AlternativeDistributionKeyResponse
 ```

 ## Discussion

 This object is the response from the alternative distribution key endpoints. For more information about alternative distribution keys, see Creating and reading keys.

 ```javascript
 {
   "data": {
      "type": "alternativeDistributionKeys",
      "id": "string",
      "attributes": {
        "publicKey": "string"
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
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeyresponse>
 */
public struct AlternativeDistributionKeyResponse: Codable, Sendable {
    public let data: AlternativeDistributionKey
    public let links: DocumentLinks

    public init(data: AlternativeDistributionKey,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AlternativeDistributionKey.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
