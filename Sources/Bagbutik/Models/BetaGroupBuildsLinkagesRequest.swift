import Foundation

/**
 A request body you use to add or remove builds from a beta group.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupbuildslinkagesrequest>
 */
public struct BetaGroupBuildsLinkagesRequest: Codable, RequestBody {
    /// The types and IDs of related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroupbuildslinkagesrequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "builds" }

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
