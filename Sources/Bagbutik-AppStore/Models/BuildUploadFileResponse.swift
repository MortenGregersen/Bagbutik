import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BuildUploadFileResponse
 A response that contains a list of build upload resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/builduploadfileresponse>
 */
public struct BuildUploadFileResponse: Codable, Sendable {
    public let data: BuildUploadFile
    public let links: DocumentLinks

    public init(data: BuildUploadFile,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BuildUploadFile.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
