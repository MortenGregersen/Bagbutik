import Foundation
import Bagbutik_Core

/**
 # CiGitRefKind
 A string that represents the kind of a Git References resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cigitrefkind>
 */
public enum CiGitRefKind: String, Codable, CaseIterable {
    /// The Git reference represents a branch.
    case branch = "BRANCH"
    /// The Git reference represents a tag.
    case tag = "TAG"
}
