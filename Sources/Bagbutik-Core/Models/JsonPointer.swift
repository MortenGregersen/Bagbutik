import Foundation

/**
 # JsonPointer
 An object that contains the JSON pointer that indicates the location of the error.

 In some cases, the JSON pointer may indicate an element that isn’t in the request entity, but should be. For more information about JSON pointers, see the [RFC 6901](https://tools.ietf.org/html/rfc6901) proposed standards document.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/jsonpointer>
 */
public struct JsonPointer: Codable {
    /// A JSON pointer that indicates the location in the request entity where the error originates.
    public var pointer: String?

    public init(pointer: String? = nil) {
        self.pointer = pointer
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pointer = try container.decodeIfPresent(String.self, forKey: .pointer)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(pointer, forKey: .pointer)
    }

    private enum CodingKeys: String, CodingKey {
        case pointer
    }
}
