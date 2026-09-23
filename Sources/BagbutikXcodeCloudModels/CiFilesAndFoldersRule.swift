import BagbutikCore
import Foundation

/**
 # CiFilesAndFoldersRule

 Settings Xcode Cloud uses to determine whether a change should start a new build or not.

 ```
 object CiFilesAndFoldersRule
 ```

 ## Topics

 ### Objects

 [`object CiStartConditionFileMatcher`](https://developer.apple.com/documentation/AppStoreConnectAPI/CiStartConditionFileMatcher)

 A path pattern filter applied to an Xcode Cloud workflow start condition, restricting triggers to changes in specific files or directories.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cifilesandfoldersrule>
 */
public struct CiFilesAndFoldersRule: Codable, Sendable {
    public var matchers: [CiStartConditionFileMatcher]?
    public var mode: Mode?

    public init(matchers: [CiStartConditionFileMatcher]? = nil,
                mode: Mode? = nil)
    {
        self.matchers = matchers
        self.mode = mode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        matchers = try container.decodeIfPresent([CiStartConditionFileMatcher].self, forKey: "matchers")
        mode = try container.decodeIfPresent(Mode.self, forKey: "mode")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(matchers, forKey: "matchers")
        try container.encodeIfPresent(mode, forKey: "mode")
    }

    public enum Mode: String, Sendable, Codable, CaseIterable {
        case doNotStartIfAllFilesMatch = "DO_NOT_START_IF_ALL_FILES_MATCH"
        case startIfAnyFileMatches = "START_IF_ANY_FILE_MATCHES"

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = Mode(rawValue: string) {
                self = value
            } else if let value = Mode(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Mode value: \(string)"
                )
            }
        }
    }
}
