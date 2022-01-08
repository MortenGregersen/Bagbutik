import Foundation

/**
 Upload instructions for assets such as app previews and app screenshots.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/uploadoperation>
 */
public struct UploadOperation: Codable {
    public var length: Int?
    public var method: String?
    public var offset: Int?
    @NullCodable public var requestHeaders: [HttpHeader]?
    public var url: String?

    public init(length: Int? = nil, method: String? = nil, offset: Int? = nil, requestHeaders: [HttpHeader]? = nil, url: String? = nil) {
        self.length = length
        self.method = method
        self.offset = offset
        self.requestHeaders = requestHeaders
        self.url = url
    }
}
