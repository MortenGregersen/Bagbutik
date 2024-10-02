import Bagbutik_Core
import Foundation

public struct CiTagStartCondition: Codable, Sendable {
    public var autoCancel: Bool?
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
    public var source: CiTagPatterns?

    public init(autoCancel: Bool? = nil,
                filesAndFoldersRule: CiFilesAndFoldersRule? = nil,
                source: CiTagPatterns? = nil)
    {
        self.autoCancel = autoCancel
        self.filesAndFoldersRule = filesAndFoldersRule
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        autoCancel = try container.decodeIfPresent(Bool.self, forKey: "autoCancel")
        filesAndFoldersRule = try container.decodeIfPresent(CiFilesAndFoldersRule.self, forKey: "filesAndFoldersRule")
        source = try container.decodeIfPresent(CiTagPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(autoCancel, forKey: "autoCancel")
        try container.encodeIfPresent(filesAndFoldersRule, forKey: "filesAndFoldersRule")
        try container.encodeIfPresent(source, forKey: "source")
    }
}
