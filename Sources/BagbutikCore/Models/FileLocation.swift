import Foundation

/**
 # FileLocation

 A source code location reference indicating the file path, line number, and column of an issue in an Xcode Cloud build.

 ```
 object FileLocation
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/filelocation>
 */
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
