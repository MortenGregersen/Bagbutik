import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportSegment
 The data structure that represents an analytics report segment.

 To learn more about the response that includes this analytics report segment object, see ``AnalyticsReportSegmentResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportsegment>
 */
public struct AnalyticsReportSegment: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "analyticsReportSegments" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    /**
     # AnalyticsReportSegment.Attributes
     Attributes that describe an analytics report segment resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportsegment/attributes>
     */
    public struct Attributes: Codable {
        /// This is a `md5` checksum.
        public var checksum: String?
        public var sizeInBytes: Int?
        public var url: String?

        public init(checksum: String? = nil,
                    sizeInBytes: Int? = nil,
                    url: String? = nil)
        {
            self.checksum = checksum
            self.sizeInBytes = sizeInBytes
            self.url = url
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            checksum = try container.decodeIfPresent(String.self, forKey: "checksum")
            sizeInBytes = try container.decodeIfPresent(Int.self, forKey: "sizeInBytes")
            url = try container.decodeIfPresent(String.self, forKey: "url")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(checksum, forKey: "checksum")
            try container.encodeIfPresent(sizeInBytes, forKey: "sizeInBytes")
            try container.encodeIfPresent(url, forKey: "url")
        }
    }
}
