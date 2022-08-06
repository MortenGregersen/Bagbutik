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
}
