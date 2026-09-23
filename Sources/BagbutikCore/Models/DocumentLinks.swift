import Foundation

/**
 # DocumentLinks

 Self-links to documents that can contain information for one or more resources.

 ```
 object DocumentLinks
 ```

 ## Discussion

 All the response data constitutes a *document*.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/documentlinks>
 */
public struct DocumentLinks: Codable, Sendable {
    public let itself: String

    public init(self itself: String) {
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        itself = try container.decode(String.self, forKey: "self")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(itself, forKey: "self")
    }
}
