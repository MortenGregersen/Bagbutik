import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportInstance
 The data structure that represents an analytics report instance.

 To learn more about the response that includes this analytics report instance object, see ``AnalyticsReportInstanceResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportinstance>
 */
public struct AnalyticsReportInstance: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "analyticsReportInstances" }
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # AnalyticsReportInstance.Attributes
     Attributes that describe an analytics report instance resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportinstance/attributes>
     */
    public struct Attributes: Codable {
        public var granularity: Granularity?
        /// Uses the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) standard, in the format `YYYY-MM-DD.`
        public var processingDate: String?

        public init(granularity: Granularity? = nil,
                    processingDate: String? = nil)
        {
            self.granularity = granularity
            self.processingDate = processingDate
        }

        public enum Granularity: String, Codable, CaseIterable {
            case daily = "DAILY"
            case monthly = "MONTHLY"
            case weekly = "WEEKLY"
        }
    }
}
