import Foundation

/// A request header that is part of an upload operation.
public struct UploadOperationHeader: Codable {
    public let name: String?
    public let value: String?

    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}
