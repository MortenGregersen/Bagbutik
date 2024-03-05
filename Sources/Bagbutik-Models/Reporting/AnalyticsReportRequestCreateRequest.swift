import Bagbutik_Core
import Foundation

/**
 # AnalyticsReportRequestCreateRequest
 The request body you use to create an analytics report request.

 Use this object with [Request reports](https://developer.apple.com/documentation/appstoreconnectapi/request_reports).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestcreaterequest>
 */
public struct AnalyticsReportRequestCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # AnalyticsReportRequestCreateRequest.Data
     The data structure that represents an analytics report request create request resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "analyticsReportRequests" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # AnalyticsReportRequestCreateRequest.Data.Attributes
         Attributes that describe an analytics report create request resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The `accessType` `ONGOING` provides current data and is the most typical. It generates reports daily, weekly and monthly. Use `ONE_TIME_SNAPSHOT` to get historical data.
            public let accessType: AnalyticsReportRequest.Attributes.AccessType

            public init(accessType: AnalyticsReportRequest.Attributes.AccessType) {
                self.accessType = accessType
            }
        }

        public struct Relationships: Codable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # AnalyticsReportRequestCreateRequest.Data.Relationships.App.Data
                 The data structure that represents the app Apple ID for analytics report create request resource.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/analyticsreportrequestcreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the Apps resource. Obtain the app resource ID from the [List Apps](https://developer.apple.com/documentation/appstoreconnectapi/list_apps) response.
                    public let id: String
                    public var type: String { "apps" }

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
            }
        }
    }
}
