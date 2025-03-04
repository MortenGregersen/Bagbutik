import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BuildAppEncryptionDeclarationLinkageResponse
 A response body that contains the ID of a single related resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildappencryptiondeclarationlinkageresponse>
 */
public struct BuildAppEncryptionDeclarationLinkageResponse: Codable, Sendable {
    /// The object types and IDs of the related resources.
    public let data: Data
    /// Navigational links including the self-link and links to the related data.
    public let links: DocumentLinks

    public init(data: Data,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "appEncryptionDeclarations" }

        public init(id: String) {
            self.id = id
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
        }
    }
}
