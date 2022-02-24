import Foundation

/// A response with gzipped data.
public struct GzipResponse: Decodable {
    /// The gzipped data.
    public let data: Data
    /// The unzipped data.
    public let unzippedData: Data

    /**
     Create a new GzipResponse.
     
     - Parameters:
        - data: The gzipped data.
     */
    public init(data: Data) throws {
        self.data = data
        self.unzippedData = try data.gunzippedData()
    }
}
