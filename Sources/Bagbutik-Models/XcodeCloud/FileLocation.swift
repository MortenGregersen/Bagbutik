import Bagbutik_Core
import Foundation

public struct FileLocation: Codable, Sendable {
    public var lineNumber: Int?
    public var path: String?

    public init(lineNumber: Int? = nil,
                path: String? = nil)
    {
        self.lineNumber = lineNumber
        self.path = path
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        lineNumber = try container.decodeIfPresent(Int.self, forKey: "lineNumber")
        path = try container.decodeIfPresent(String.self, forKey: "path")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(lineNumber, forKey: "lineNumber")
        try container.encodeIfPresent(path, forKey: "path")
    }
}
