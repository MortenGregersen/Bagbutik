import Foundation

/// A response with binary data.
public protocol BinaryResponse: Decodable {
    /// The gzipped data.
    var data: Data { get }

    /**
     Create a new instance with the data.

     - Parameters:
        - data: The data for the response.
     */
    static func from(data: Data) -> Self
}
