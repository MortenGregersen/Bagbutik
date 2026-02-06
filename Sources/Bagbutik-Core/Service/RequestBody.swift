import Foundation

/// A protocol used for structs to be sent with `Request`s.
public protocol RequestBody: Encodable, Sendable {
    /// A JSON representation of the struct.
    func jsonData() throws -> Data
}

public extension RequestBody {
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
