import Bagbutik_Core
import Foundation

/**
 # BetaGroupBetaTestersLinkagesRequest
 A request body you use to add or remove beta testers from a beta group.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupbetatesterslinkagesrequest>
 */
public struct BetaGroupBetaTestersLinkagesRequest: Codable, RequestBody {
    /// The types and IDs of related resources.
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Data].self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # BetaGroupBetaTestersLinkagesRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroupbetatesterslinkagesrequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaTesters" }

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
