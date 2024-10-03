import Bagbutik_Core
import Foundation

public struct CiGitUser: Codable, Sendable {
    public var avatarUrl: String?
    public var displayName: String?

    public init(avatarUrl: String? = nil,
                displayName: String? = nil)
    {
        self.avatarUrl = avatarUrl
        self.displayName = displayName
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        avatarUrl = try container.decodeIfPresent(String.self, forKey: "avatarUrl")
        displayName = try container.decodeIfPresent(String.self, forKey: "displayName")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(avatarUrl, forKey: "avatarUrl")
        try container.encodeIfPresent(displayName, forKey: "displayName")
    }
}
