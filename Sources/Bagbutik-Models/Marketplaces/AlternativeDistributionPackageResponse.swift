import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageResponse
 A response that contains a single alternative distribution package resource.

 This object is the response that contains a single the alternative distribution package. For more information, see [Creating and reading distribution packages](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_packages#4321952). The schema of the response body is below.
 ```
 {
 ```

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackageresponse>
 */
public struct AlternativeDistributionPackageResponse: Codable, Sendable {
    public let data: AlternativeDistributionPackage
    public var included: [AlternativeDistributionPackageVersion]?
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackage,
                included: [AlternativeDistributionPackageVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AlternativeDistributionPackage.self, forKey: "data")
        included = try container.decodeIfPresent([AlternativeDistributionPackageVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
