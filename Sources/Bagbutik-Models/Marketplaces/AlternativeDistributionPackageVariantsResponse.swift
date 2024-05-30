import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageVariantsResponse
 A response that contains a list of alternative distribution package variant resources.

 This object is the response that contains a list of alternative distribution package variants. For more information, see [List variants information](https://developer.apple.com/documentation/appstoreconnectapi/list_variants_information). The schema of the response body is below.
 ```
 {
 ```

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagevariantsresponse>
 */
public struct AlternativeDistributionPackageVariantsResponse: Codable, PagedResponse {
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
