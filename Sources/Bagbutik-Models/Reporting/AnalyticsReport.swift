import Bagbutik_Core
import Foundation

/**
 # AnalyticsReport
 The data structure that represents an analytics report.

 To learn more about the response that includes this analytics report request object, see ``AnalyticsReportResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreport>
 */
public struct AnalyticsReport: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "analyticsReports" }
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

    public struct Attributes: Codable {
        public var category: Category?
        public var name: String?

        public init(category: Category? = nil,
                    name: String? = nil)
        {
            self.category = category
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            category = try container.decodeIfPresent(Category.self, forKey: .category)
            name = try container.decodeIfPresent(String.self, forKey: .name)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(category, forKey: .category)
            try container.encodeIfPresent(name, forKey: .name)
        }

        private enum CodingKeys: String, CodingKey {
            case category
            case name
        }

        public enum Category: String, Codable, CaseIterable {
            case appStoreEngagement = "APP_STORE_ENGAGEMENT"
            case appUsage = "APP_USAGE"
            case commerce = "COMMERCE"
            case frameworkUsage = "FRAMEWORK_USAGE"
            case performance = "PERFORMANCE"
        }
    }
}
