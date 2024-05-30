import Bagbutik_Core
import Foundation

/**
 # CiGitUser
 The data structure that represents a Git Users resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cigituser>
 */
public struct CiGitUser: Codable {
    /// The URL to the Git user’s avatar image.
    public var avatarUrl: String?
    /// The name of the Git user.
    public var displayName: String?

    public init(avatarUrl: String? = nil,
                displayName: String? = nil)
    {
        self.avatarUrl = avatarUrl
        self.displayName = displayName
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(displayName, forKey: .displayName)
    }

    private enum CodingKeys: String, CodingKey {
        case avatarUrl
        case displayName
    }
}
