import Foundation
import Bagbutik_Core

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
}
