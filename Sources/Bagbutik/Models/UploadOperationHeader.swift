import Foundation

public struct UploadOperationHeader: Codable {
    public let name: String?
    public let value: String?

    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}
