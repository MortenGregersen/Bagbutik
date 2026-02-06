import Foundation

/// A protocol used for structs to be sent with `Request`s.
///
/// - Important: **Breaking Change in Version X.X**: The `jsonData` property has been replaced with a throwing `jsonData()` method.
///   If you were accessing `body.jsonData` directly, you must now call `try body.jsonData()` instead.
///   This change allows proper error handling for encoding failures instead of crashing with force-try.
public protocol RequestBody: Encodable, Sendable {
    /// A JSON representation of the struct.
    /// - Throws: An error if the encoding process encounters an issue, such as invalid floating-point values (e.g., NaN, infinity).
    func jsonData() throws -> Data
}

public extension RequestBody {
    /// A JSON representation of the struct.
    /// - Throws: An error if the encoding process encounters an issue, such as invalid floating-point values (e.g., NaN, infinity).
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
