import Foundation

/**
 An object that contains the JSON pointer that indicates the location of the error.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/errorsourcepointer/jsonpointer>

 In some cases, the JSON pointer may indicate an element that isn't in the request entity, but should be. For more information about JSON pointers, see the [RFC 6901](https://tools.ietf.org/html/rfc6901) proposed standards document.
 */
public struct JsonPointer: Codable {
    /// A JSON pointer that indicates the location in the request entity where the error originates.
    public let pointer: String?

    public init(pointer: String? = nil) {
        self.pointer = pointer
    }
}
