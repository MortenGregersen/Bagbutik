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

/// A response with gzipped data.
public struct GzipResponse: BinaryResponse {
    /// The gzipped data.
    public let data: Data
    /// The unzipped data.
    public let unzippedData: Data

    /**
     Create a new GzipResponse.

     - Parameters:
        - data: The gzipped data.
     */
    public static func from(data: Data) -> Self {
        Self(data: data, unzippedData: try! data.gunzippedData())
    }
}
