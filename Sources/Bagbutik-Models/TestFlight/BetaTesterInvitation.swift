import Bagbutik_Core
import Foundation

/**
 # BetaTesterInvitation
 The data structure that represents a Beta Tester Invitations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterinvitation>
 */
public struct BetaTesterInvitation: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// The resource type.
    public var type: String { "betaTesterInvitations" }

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
