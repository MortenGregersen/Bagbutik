import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportRequest
 The data structure that represents an analytics report request.

 To learn more about the response that includes this analytics report request object, see ``AnalyticsReportRequestCreateRequest``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest>
 */
public struct AnalyticsReportRequest: Codable, Identifiable, RequestBody {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "analyticsReportRequests" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
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
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # AnalyticsReportRequest.Attributes
     Attributes that describe an analytics report request resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest/attributes>
     */
    public struct Attributes: Codable {
        public var accessType: AccessType?
        public var stoppedDueToInactivity: Bool?

        public init(accessType: AccessType? = nil,
                    stoppedDueToInactivity: Bool? = nil)
        {
            self.accessType = accessType
            self.stoppedDueToInactivity = stoppedDueToInactivity
        }

        public enum AccessType: String, Codable, CaseIterable {
            case oneTimeSnapshot = "ONE_TIME_SNAPSHOT"
            case ongoing = "ONGOING"
        }
    }

    public struct Relationships: Codable {
        public var reports: Reports?

        public init(reports: Reports? = nil) {
            self.reports = reports
        }

        public struct Reports: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            /**
             # AnalyticsReportRequest.Relationships.Reports.Data
             The data structure that represents the reports ID for analytics report request resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest/relationships/reports/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "analyticsReports" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # AnalyticsReportRequest.Relationships.Reports.Links
             Links related to the report request document, including self-links.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest/relationships/reports/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
