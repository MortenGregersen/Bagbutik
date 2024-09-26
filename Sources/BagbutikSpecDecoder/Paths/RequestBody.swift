import Foundation

/// Information about an object that can be sent as request body
public struct RequestBody: Decodable, Equatable, Sendable {
    /// The name of the request body type
    public let name: String
    /// The documentation for the request body parameter
    public let documentation: String
}
