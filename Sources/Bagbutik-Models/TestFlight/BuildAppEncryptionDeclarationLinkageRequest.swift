import Bagbutik_Core
import Foundation

/**
 # BuildAppEncryptionDeclarationLinkageRequest
 The request body you use to attach an app encryption declaration to a build.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildappencryptiondeclarationlinkagerequest>
 */
public struct BuildAppEncryptionDeclarationLinkageRequest: Codable, RequestBody {
    /// The types and IDs of related resources.
    @NullCodable public var data: Data?

    public init(data: Data? = nil) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(Data.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(data, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }

    /**
     # BuildAppEncryptionDeclarationLinkageRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildappencryptiondeclarationlinkagerequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
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
            try container.encode(type, forKey: .type)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
        }
    }
}
