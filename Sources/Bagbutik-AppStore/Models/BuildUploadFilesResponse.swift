import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BuildUploadFilesResponse
 A response that contains a list of build upload resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/builduploadfilesresponse>
 */
public struct BuildUploadFilesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BuildUploadFile

    public let data: [BuildUploadFile]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BuildUploadFile],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([BuildUploadFile].self, forKey: "data")
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
