import BagbutikCore
import Foundation

/**
 # CiGitRefKind

 A string that represents the kind of a Git References resource.

 ```
 string CiGitRefKind
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cigitrefkind>
 */
public enum CiGitRefKind: String, Sendable, Codable, CaseIterable {
    case branch = "BRANCH"
    case tag = "TAG"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiGitRefKind(rawValue: string) {
            self = value
        } else if let value = CiGitRefKind(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiGitRefKind value: \(string)"
            )
        }
    }
}
