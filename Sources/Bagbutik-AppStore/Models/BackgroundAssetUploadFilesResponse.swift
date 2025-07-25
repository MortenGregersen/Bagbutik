import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetUploadFilesResponse
 A response that contains a list of background asset upload file resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetuploadfilesresponse>
 */
public struct BackgroundAssetUploadFilesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BackgroundAssetUploadFile

    public let data: [BackgroundAssetUploadFile]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BackgroundAssetUploadFile],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([BackgroundAssetUploadFile].self, forKey: "data")
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
