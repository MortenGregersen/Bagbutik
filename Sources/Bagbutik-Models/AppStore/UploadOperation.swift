import Bagbutik_Core
import Foundation

/**
 # UploadOperation
 Upload instructions for assets such as app previews and app screenshots.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/uploadoperation>
 */
public struct UploadOperation: Codable {
    public var length: Int?
    public var method: String?
    public var offset: Int?
    public var requestHeaders: [HttpHeader]?
    public var url: String?

    public init(length: Int? = nil,
                method: String? = nil,
                offset: Int? = nil,
                requestHeaders: [HttpHeader]? = nil,
                url: String? = nil)
    {
        self.length = length
        self.method = method
        self.offset = offset
        self.requestHeaders = requestHeaders
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        length = try container.decodeIfPresent(Int.self, forKey: "length")
        method = try container.decodeIfPresent(String.self, forKey: "method")
        offset = try container.decodeIfPresent(Int.self, forKey: "offset")
        requestHeaders = try container.decodeIfPresent([HttpHeader].self, forKey: "requestHeaders")
        url = try container.decodeIfPresent(String.self, forKey: "url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(length, forKey: "length")
        try container.encodeIfPresent(method, forKey: "method")
        try container.encodeIfPresent(offset, forKey: "offset")
        try container.encodeIfPresent(requestHeaders, forKey: "requestHeaders")
        try container.encodeIfPresent(url, forKey: "url")
    }
}
