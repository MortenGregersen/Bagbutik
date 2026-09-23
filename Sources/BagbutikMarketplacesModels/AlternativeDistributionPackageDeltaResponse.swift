import BagbutikCore
import Foundation

/**
 # AlternativeDistributionPackageDeltaResponse

 A response containing a single delta update for an alternative distribution package.

 ```
 object AlternativeDistributionPackageDeltaResponse
 ```

 ## Discussion

 This object is the response that contains a single alternative distribution package delta. For more information about alternative distribution package deltas see [`Read Information for Alternative Distribution Package Deltas`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageDeltas-_id_). The schema of the response body is below.

 ```javascript
 {
   "data": {
     "type": "alternativeDistributionPackageDeltas",
     "id": "string",
     "attributes": {
       "url": "string",
       "urlExpirationDate": "2024-02-23T06:50:07.723Z",
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
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagedeltaresponse>
 */
public struct AlternativeDistributionPackageDeltaResponse: Codable, Sendable {
    public let data: AlternativeDistributionPackageDelta
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackageDelta,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AlternativeDistributionPackageDelta.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
