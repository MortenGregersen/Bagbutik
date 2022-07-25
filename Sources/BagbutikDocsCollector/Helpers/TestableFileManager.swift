import Foundation

/**
 A file manager which can perform the operations needed internally.

 This is just an interface already implemented by Foundation's FileManager, needed to enable unit testing.

 # Reference
 <https://developer.apple.com/documentation/foundation/filemanager>
 */
public protocol TestableFileManager {
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1415371-createdirectory>
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1410695-createfile>
    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1413590-removeitem>
    func removeItem(at URL: URL) throws
}

extension FileManager: TestableFileManager {}
