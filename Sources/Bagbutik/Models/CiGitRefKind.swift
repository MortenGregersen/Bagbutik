import Foundation

/// A string that represents the kind of a Git References resource.
public enum CiGitRefKind: String, Codable, CaseIterable {
    /// The Git reference represents a branch.
    case branch = "BRANCH"
    /// The Git reference represents a tag.
    case tag = "TAG"
}
