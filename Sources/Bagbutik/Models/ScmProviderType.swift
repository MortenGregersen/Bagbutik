import Foundation

/**
 The source code management provider’s type.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmprovidertype>
 */
public struct ScmProviderType: Codable {
    /// The source code management provider’s display name; for example, Bitbucket Server.
    public var displayName: String?
    /// A Boolean value that indicates whether it’s a self-hosted source code management provider.
    public var isOnPremise: Bool?
    /// A string that represents the kind of a Providers resource.
    public var kind: Kind?

    public init(displayName: String? = nil, isOnPremise: Bool? = nil, kind: Kind? = nil) {
        self.displayName = displayName
        self.isOnPremise = isOnPremise
        self.kind = kind
    }

    public enum Kind: String, Codable, CaseIterable {
        case bitbucketCloud = "BITBUCKET_CLOUD"
        case bitbucketServer = "BITBUCKET_SERVER"
        case githubCloud = "GITHUB_CLOUD"
        case githubEnterprise = "GITHUB_ENTERPRISE"
        case gitlabCloud = "GITLAB_CLOUD"
        case gitlabSelfManaged = "GITLAB_SELF_MANAGED"
    }
}
