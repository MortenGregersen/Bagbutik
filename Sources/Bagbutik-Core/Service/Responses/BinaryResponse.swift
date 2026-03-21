import Foundation

/// A response type that is initialized directly from binary data instead of JSON.
public protocol BinaryResponse: Decodable {
    /// The binary payload returned by the endpoint.
    var data: Data { get }

    /**
     Creates a response from the raw payload returned by the server.

     - Parameters:
        - data: The data for the response.
     */
    static func from(data: Data) -> Self
}
