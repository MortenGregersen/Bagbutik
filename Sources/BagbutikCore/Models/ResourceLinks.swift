import Foundation

/**
 # ResourceLinks

 Self-links to requested resources.

 ```
 object ResourceLinks
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/resourcelinks>
 */
public struct ResourceLinks: Codable, Sendable {
    public var itself: String?

    public init(self itself: String? = nil) {
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        itself = try container.decodeIfPresent(String.self, forKey: "self")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(itself, forKey: "self")
    }
}
