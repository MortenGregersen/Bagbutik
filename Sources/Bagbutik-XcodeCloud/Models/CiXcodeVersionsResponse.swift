import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiXcodeVersionsResponse
 A response that contains a list of Xcode Versions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversionsresponse>
 */
public struct CiXcodeVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = CiXcodeVersion

    /// The resource data.
    public let data: [CiXcodeVersion]
    /// The requested relationship data.
    public var included: [CiMacOsVersion]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiXcodeVersion],
                included: [CiMacOsVersion]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([CiXcodeVersion].self, forKey: "data")
        included = try container.decodeIfPresent([CiMacOsVersion].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getMacOsVersions(for ciXcodeVersion: CiXcodeVersion) -> [CiMacOsVersion] {
        guard let macOsVersionIds = ciXcodeVersion.relationships?.macOsVersions?.data?.map(\.id) else { return [] }
        return included?.filter { macOsVersionIds.contains($0.id) } ?? []
    }
}
