import Foundation

/**
 # JsonPointer

 An object that contains the JSON pointer that indicates the location of the error.

 ```
 object JsonPointer
 ```

 ## Discussion

 In some cases, the JSON pointer may indicate an element that isn’t in the request entity, but should be. For more information about JSON pointers, see the [RFC 6901](https://tools.ietf.org/html/rfc6901) proposed standards document.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/jsonpointer>
 */
public struct JsonPointer: Codable, Sendable {
    public let pointer: String

    public init(pointer: String) {
        self.pointer = pointer
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        pointer = try container.decode(String.self, forKey: "pointer")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(pointer, forKey: "pointer")
    }
}
