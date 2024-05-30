import Bagbutik_Core
import Foundation

/**
 # FileLocation
 The data structure that represents a File Locations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/filelocation>
 */
public struct FileLocation: Codable {
    /// The line number of a file that contains code.
    public var lineNumber: Int?
    /// The path to the file that caused an issue.
    public var path: String?

    public init(lineNumber: Int? = nil,
                path: String? = nil)
    {
        self.lineNumber = lineNumber
        self.path = path
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lineNumber = try container.decodeIfPresent(Int.self, forKey: .lineNumber)
        path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lineNumber, forKey: .lineNumber)
        try container.encodeIfPresent(path, forKey: .path)
    }

    private enum CodingKeys: String, CodingKey {
        case lineNumber
        case path
    }
}
