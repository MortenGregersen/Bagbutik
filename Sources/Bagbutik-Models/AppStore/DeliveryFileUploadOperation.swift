import Bagbutik_Core
import Foundation

/**
 # DeliveryFileUploadOperation
 The data structure that represents a delivery file upload operation resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/deliveryfileuploadoperation>
 */
public struct DeliveryFileUploadOperation: Codable, Sendable {
    public var entityTag: String?
    public var expiration: Date?
    public var length: Int?
    public var method: String?
    public var offset: Int?
    public var partNumber: Int?
    public var requestHeaders: [HttpHeader]?
    public var url: String?

    public init(entityTag: String? = nil,
                expiration: Date? = nil,
                length: Int? = nil,
                method: String? = nil,
                offset: Int? = nil,
                partNumber: Int? = nil,
                requestHeaders: [HttpHeader]? = nil,
                url: String? = nil)
    {
        self.entityTag = entityTag
        self.expiration = expiration
        self.length = length
        self.method = method
        self.offset = offset
        self.partNumber = partNumber
        self.requestHeaders = requestHeaders
        self.url = url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        entityTag = try container.decodeIfPresent(String.self, forKey: "entityTag")
        expiration = try container.decodeIfPresent(Date.self, forKey: "expiration")
        length = try container.decodeIfPresent(Int.self, forKey: "length")
        method = try container.decodeIfPresent(String.self, forKey: "method")
        offset = try container.decodeIfPresent(Int.self, forKey: "offset")
        partNumber = try container.decodeIfPresent(Int.self, forKey: "partNumber")
        requestHeaders = try container.decodeIfPresent([HttpHeader].self, forKey: "requestHeaders")
        url = try container.decodeIfPresent(String.self, forKey: "url")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(entityTag, forKey: "entityTag")
        try container.encodeIfPresent(expiration, forKey: "expiration")
        try container.encodeIfPresent(length, forKey: "length")
        try container.encodeIfPresent(method, forKey: "method")
        try container.encodeIfPresent(offset, forKey: "offset")
        try container.encodeIfPresent(partNumber, forKey: "partNumber")
        try container.encodeIfPresent(requestHeaders, forKey: "requestHeaders")
        try container.encodeIfPresent(url, forKey: "url")
    }
}
