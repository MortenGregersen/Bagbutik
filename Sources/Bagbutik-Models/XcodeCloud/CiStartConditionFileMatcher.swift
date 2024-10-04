import Bagbutik_Core
import Foundation

/**
 # CiStartConditionFileMatcher
 The data structure that represents a Start Condition File Matchers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cistartconditionfilematcher>
 */
public struct CiStartConditionFileMatcher: Codable, Sendable {
    /// The directory you configure for a custom start condition’s Files and Folders setting.
    public var directory: String?
    /// The file extension you configure for a custom start condition’s Files and Folders setting.
    public var fileExtension: String?
    /// The filename you configure for a custom start condition’s Files and Folders setting.
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
