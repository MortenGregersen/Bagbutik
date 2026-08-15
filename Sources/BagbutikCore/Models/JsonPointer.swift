import Foundation

/**
 # JsonPointer
 An object that contains the JSON pointer that indicates the location of the error.

 In some cases, the JSON pointer may indicate an element that isn’t in the request entity, but should be. For more information about JSON pointers, see the [RFC 6901](https://developer.apple.comhttps://tools.ietf.org/html/rfc6901) proposed standards document.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/jsonpointer>
 */
public struct JsonPointer: Codable, Sendable {
    /// A JSON pointer that indicates the location in the request entity where the error originates.
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
