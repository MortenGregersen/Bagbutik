import Foundation

/// A protocol used for structs to be sent with `Request`s.
public protocol RequestBody: Encodable {
    /// A JSON representation of the struct.
    var jsonData: Data { get }
}

public extension RequestBody {
    var jsonData: Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try! encoder.encode(self)
    }
}
