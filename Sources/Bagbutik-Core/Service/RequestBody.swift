import Foundation

/// A protocol used for structs to be sent with `Request`s.
public protocol RequestBody: Encodable, Sendable {
    /// A JSON representation of the struct.
    @available(*, deprecated, message: "Use getJsonData() instead, which properly throws encoding errors rather than crashing")
    var jsonData: Data { get }
    
    /// A JSON representation of the struct.
    /// - Throws: An error if the encoding process encounters an issue, such as invalid floating-point values (e.g., NaN, infinity).
    func getJsonData() throws -> Data
}

public extension RequestBody {
    @available(*, deprecated, message: "Use getJsonData() instead, which properly throws encoding errors rather than crashing")
    var jsonData: Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try! encoder.encode(self)
    }
    
    /// A JSON representation of the struct.
    /// - Throws: An error if the encoding process encounters an issue, such as invalid floating-point values (e.g., NaN, infinity).
    func getJsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
