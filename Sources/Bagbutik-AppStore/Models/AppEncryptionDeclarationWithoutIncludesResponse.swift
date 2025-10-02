import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppEncryptionDeclarationWithoutIncludesResponse
 A response that contains a list of app encryption declaration without includes response resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationwithoutincludesresponse>
 */
public struct AppEncryptionDeclarationWithoutIncludesResponse: Codable, Sendable {
    public let data: AppEncryptionDeclaration
    public let links: DocumentLinks

    public init(data: AppEncryptionDeclaration,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppEncryptionDeclaration.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
