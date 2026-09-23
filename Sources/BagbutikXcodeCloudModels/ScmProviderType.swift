import BagbutikCore
import Foundation

/**
 # ScmProviderType

 The source code management provider’s type.

 ```
 object ScmProviderType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmprovidertype>
 */
public struct ScmProviderType: Codable, Sendable {
    public var displayName: String?
    public var isOnPremise: Bool?
    public var kind: Kind?

    public init(displayName: String? = nil,
                isOnPremise: Bool? = nil,
                kind: Kind? = nil)
    {
        self.displayName = displayName
        self.isOnPremise = isOnPremise
        self.kind = kind
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        displayName = try container.decodeIfPresent(String.self, forKey: "displayName")
        isOnPremise = try container.decodeIfPresent(Bool.self, forKey: "isOnPremise")
        kind = try container.decodeIfPresent(Kind.self, forKey: "kind")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(displayName, forKey: "displayName")
        try container.encodeIfPresent(isOnPremise, forKey: "isOnPremise")
        try container.encodeIfPresent(kind, forKey: "kind")
    }

    public enum Kind: String, Sendable, Codable, CaseIterable {
        case bitbucketCloud = "BITBUCKET_CLOUD"
        case bitbucketServer = "BITBUCKET_SERVER"
        case githubCloud = "GITHUB_CLOUD"
        case githubEnterprise = "GITHUB_ENTERPRISE"
        case gitlabCloud = "GITLAB_CLOUD"
        case gitlabSelfManaged = "GITLAB_SELF_MANAGED"

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = Kind(rawValue: string) {
                self = value
            } else if let value = Kind(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Kind value: \(string)"
                )
            }
        }
    }
}
