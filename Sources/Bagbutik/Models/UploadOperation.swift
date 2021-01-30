import Foundation

public struct UploadOperation: Codable {
    public let length: Int?
    public let method: String?
    public let offset: Int?
    public let requestHeaders: [UploadOperationHeader]?
    public let url: String?

    public init(length: Int? = nil, method: String? = nil, offset: Int? = nil, requestHeaders: [UploadOperationHeader]? = nil, url: String? = nil) {
        self.length = length
        self.method = method
        self.offset = offset
        self.requestHeaders = requestHeaders
        self.url = url
    }
}
