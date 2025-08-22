import Bagbutik_Core
import Foundation

public struct AppStoreVersionExperiment: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreVersionExperiments" }
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

    public struct Attributes: Codable, Sendable {
        public var endDate: Date?
        public var name: String?
        public var reviewRequired: Bool?
        public var startDate: Date?
        public var state: State?
        public var trafficProportion: Int?

        public init(endDate: Date? = nil,
                    name: String? = nil,
                    reviewRequired: Bool? = nil,
                    startDate: Date? = nil,
                    state: State? = nil,
                    trafficProportion: Int? = nil)
        {
            self.endDate = endDate
            self.name = name
            self.reviewRequired = reviewRequired
            self.startDate = startDate
            self.state = state
            self.trafficProportion = trafficProportion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            endDate = try container.decodeIfPresent(Date.self, forKey: "endDate")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            reviewRequired = try container.decodeIfPresent(Bool.self, forKey: "reviewRequired")
            startDate = try container.decodeIfPresent(Date.self, forKey: "startDate")
            state = try container.decodeIfPresent(State.self, forKey: "state")
            trafficProportion = try container.decodeIfPresent(Int.self, forKey: "trafficProportion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(endDate, forKey: "endDate")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(reviewRequired, forKey: "reviewRequired")
            try container.encodeIfPresent(startDate, forKey: "startDate")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(trafficProportion, forKey: "trafficProportion")
        }

        public enum State: String, Sendable, Codable, CaseIterable {
            case accepted = "ACCEPTED"
            case approved = "APPROVED"
            case completed = "COMPLETED"
            case inReview = "IN_REVIEW"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case readyForReview = "READY_FOR_REVIEW"
            case rejected = "REJECTED"
            case stopped = "STOPPED"
            case waitingForReview = "WAITING_FOR_REVIEW"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = State(rawValue: string) {
                    self = value
                } else if let value = State(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid State value: \(string)"
                    )
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appStoreVersion: AppStoreVersion?
        public var appStoreVersionExperimentTreatments: AppStoreVersionExperimentTreatments?

        public init(appStoreVersion: AppStoreVersion? = nil,
                    appStoreVersionExperimentTreatments: AppStoreVersionExperimentTreatments? = nil)
        {
            self.appStoreVersion = appStoreVersion
            self.appStoreVersionExperimentTreatments = appStoreVersionExperimentTreatments
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreVersion = try container.decodeIfPresent(AppStoreVersion.self, forKey: "appStoreVersion")
            appStoreVersionExperimentTreatments = try container.decodeIfPresent(AppStoreVersionExperimentTreatments.self, forKey: "appStoreVersionExperimentTreatments")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreVersion, forKey: "appStoreVersion")
            try container.encodeIfPresent(appStoreVersionExperimentTreatments, forKey: "appStoreVersionExperimentTreatments")
        }

        public struct AppStoreVersion: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersions" }

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
        }

        public struct AppStoreVersionExperimentTreatments: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersionExperimentTreatments" }

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
        }
    }
}
