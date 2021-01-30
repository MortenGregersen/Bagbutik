import Foundation

extension ErrorResponse: Error {}

public struct EmptyResponse: Decodable {}

public struct GzipResponse: Decodable {
    public let data: Data
    public let unzippedData: Data

    public init(data: Data) throws {
        self.data = data
        self.unzippedData = try data.gunzippedData()
    }
}
