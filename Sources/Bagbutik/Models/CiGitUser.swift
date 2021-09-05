import Foundation

/**
 The data structure that represents a Git Users resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cigituser>
 */
public struct CiGitUser: Codable {
    /// The URL to the Git user’s avatar image.
    public let avatarUrl: String?
    /// The name of the Git user.
    public let displayName: String?

    public init(avatarUrl: String? = nil, displayName: String? = nil) {
        self.avatarUrl = avatarUrl
        self.displayName = displayName
    }
}
