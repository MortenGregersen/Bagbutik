import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportRequest
 The data structure that represents an analytics report request.

 To learn more about the response that includes this analytics report request object, see ``AnalyticsReportRequestCreateRequest``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest>
 */
public struct AnalyticsReportRequest: Codable, Sendable, Identifiable, RequestBody {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # AnalyticsReportRequest.Attributes
     Attributes that describe an analytics report request resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest/attributes>
     */
    public struct Attributes: Codable, Sendable {
        public var accessType: AccessType?
        public var stoppedDueToInactivity: Bool?

        public init(accessType: AccessType? = nil,
                    stoppedDueToInactivity: Bool? = nil)
        {
            self.accessType = accessType
            self.stoppedDueToInactivity = stoppedDueToInactivity
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            accessType = try container.decodeIfPresent(AccessType.self, forKey: "accessType")
            stoppedDueToInactivity = try container.decodeIfPresent(Bool.self, forKey: "stoppedDueToInactivity")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(accessType, forKey: "accessType")
            try container.encodeIfPresent(stoppedDueToInactivity, forKey: "stoppedDueToInactivity")
        }

        public enum AccessType: String, Sendable, Codable, CaseIterable {
            case oneTimeSnapshot = "ONE_TIME_SNAPSHOT"
            case ongoing = "ONGOING"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var reports: Reports?

        public init(reports: Reports? = nil) {
            self.reports = reports
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            reports = try container.decodeIfPresent(Reports.self, forKey: "reports")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(reports, forKey: "reports")
        }

        public struct Reports: Codable, Sendable {
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
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # AnalyticsReportRequest.Relationships.Reports.Data
             The data structure that represents the reports ID for analytics report request resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest/relationships/reports/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "analyticsReports" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }

            /**
             # AnalyticsReportRequest.Relationships.Reports.Links
             Links related to the report request document, including self-links.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequest/relationships/reports/links>
             */
            public struct Links: Codable, Sendable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
