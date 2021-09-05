import Foundation

/**
 The data structure that represents a Start Condition File Matchers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cistartconditionfilematcher>
 */
public struct CiStartConditionFileMatcher: Codable {
    /// The directory you configure for a custom start condition’s Files and Folders setting.
    public let directory: String?
    /// The file extension you configure for a custom start condition’s Files and Folders setting.
    public let fileExtension: String?
    /// The filename you configure for a custom start condition’s Files and Folders setting.
    public let fileName: String?

    public init(directory: String? = nil, fileExtension: String? = nil, fileName: String? = nil) {
        self.directory = directory
        self.fileExtension = fileExtension
        self.fileName = fileName
    }
}
