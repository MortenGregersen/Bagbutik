import Bagbutik_Core
import Foundation

public struct Gzip: BinaryResponse {
    public let data: Data

    public static func from(data: Data) -> Gzip {
        return Self(data: data)
    }

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }
}
