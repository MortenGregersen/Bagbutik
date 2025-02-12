import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AlternativeDistributionPackageVariantResponse
 A response that contains a single alternative distribution package variant resource.

 This object is the response that contains a single alternative distribution package variant. For more information, see [Read information for an alternative distribution package variants](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativedistributionpackagevariants-_id_). The schema of the response body is below.
 ```
 {
 ```

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
