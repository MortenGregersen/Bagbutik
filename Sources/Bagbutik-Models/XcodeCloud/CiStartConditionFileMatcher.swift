import Bagbutik_Core
import Foundation

public struct CiStartConditionFileMatcher: Codable, Sendable {
    public var directory: String?
    public var fileExtension: String?
    public var fileName: String?

    public init(directory: String? = nil,
                fileExtension: String? = nil,
                fileName: String? = nil)
    {
        self.directory = directory
        self.fileExtension = fileExtension
        self.fileName = fileName
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        directory = try container.decodeIfPresent(String.self, forKey: "directory")
        fileExtension = try container.decodeIfPresent(String.self, forKey: "fileExtension")
        fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(directory, forKey: "directory")
        try container.encodeIfPresent(fileExtension, forKey: "fileExtension")
        try container.encodeIfPresent(fileName, forKey: "fileName")
    }
}
