import Foundation

/**
 A response body that contains a list of related resource IDs.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildappencryptiondeclarationlinkageresponse>
 */
public struct BuildAppEncryptionDeclarationLinkageResponse: Codable {
    /// The resource data.
    public let data: Data
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Data, links: DocumentLinks) {
        self.data = data
        self.links = links
    }

    public struct Data: Codable {
        public let id: String
        public var type: String { "appEncryptionDeclarations" }

        public init(id: String) {
            self.id = id
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
        }
    }
}
