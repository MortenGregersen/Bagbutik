import Foundation

/// A protocol for request bodies that should be JSON encoded before sending.
public protocol RequestBody: Encodable, Sendable {
    /// A JSON representation of the request body.
    @available(*, deprecated, message: "Use getJsonData() instead. This property uses force-try and will crash if encoding fails (e.g., with NaN or infinity values)")
    var jsonData: Data { get }
    
    /// Encodes the request body as JSON using Bagbutik's default encoder configuration.
    /// - Throws: An error if encoding fails, for example because the body contains `NaN` or infinity values.
    func getJsonData() throws -> Data
}

public extension RequestBody {
    @available(*, deprecated, message: "Use getJsonData() instead. This property uses force-try and will crash if encoding fails (e.g., with NaN or infinity values)")
    var jsonData: Data {
        try! getJsonData()
    }
    
    /// Encodes the request body as JSON using ISO 8601 dates.
    /// - Throws: An error if encoding fails, for example because the body contains `NaN` or infinity values.
    func getJsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
