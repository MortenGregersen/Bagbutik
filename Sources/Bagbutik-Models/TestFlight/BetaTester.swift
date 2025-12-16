import Bagbutik_Core
import Foundation

/**
 # BetaTester
 The data structure that represents a Beta Testers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatester>
 */
public struct BetaTester: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaTesters" }
    /// The resource’s attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
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
        public var appDevices: [AppDevices]?
        public var email: String?
        public var firstName: String?
        public var inviteType: BetaInviteType?
        public var lastName: String?
        public var state: BetaTesterState?

        public init(appDevices: [AppDevices]? = nil,
                    email: String? = nil,
                    firstName: String? = nil,
                    inviteType: BetaInviteType? = nil,
                    lastName: String? = nil,
                    state: BetaTesterState? = nil)
        {
            self.appDevices = appDevices
            self.email = email
            self.firstName = firstName
            self.inviteType = inviteType
            self.lastName = lastName
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appDevices = try container.decodeIfPresent([AppDevices].self, forKey: "appDevices")
            email = try container.decodeIfPresent(String.self, forKey: "email")
            firstName = try container.decodeIfPresent(String.self, forKey: "firstName")
            inviteType = try container.decodeIfPresent(BetaInviteType.self, forKey: "inviteType")
            lastName = try container.decodeIfPresent(String.self, forKey: "lastName")
            state = try container.decodeIfPresent(BetaTesterState.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appDevices, forKey: "appDevices")
            try container.encodeIfPresent(email, forKey: "email")
            try container.encodeIfPresent(firstName, forKey: "firstName")
            try container.encodeIfPresent(inviteType, forKey: "inviteType")
            try container.encodeIfPresent(lastName, forKey: "lastName")
            try container.encodeIfPresent(state, forKey: "state")
        }

        public struct AppDevices: Codable, Sendable {
            public var appBuildVersion: String?
            public var model: String?
            public var osVersion: String?
            public var platform: Platform?

            public init(appBuildVersion: String? = nil,
                        model: String? = nil,
                        osVersion: String? = nil,
                        platform: Platform? = nil)
            {
                self.appBuildVersion = appBuildVersion
                self.model = model
                self.osVersion = osVersion
                self.platform = platform
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appBuildVersion = try container.decodeIfPresent(String.self, forKey: "appBuildVersion")
                model = try container.decodeIfPresent(String.self, forKey: "model")
                osVersion = try container.decodeIfPresent(String.self, forKey: "osVersion")
                platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(appBuildVersion, forKey: "appBuildVersion")
                try container.encodeIfPresent(model, forKey: "model")
                try container.encodeIfPresent(osVersion, forKey: "osVersion")
                try container.encodeIfPresent(platform, forKey: "platform")
            }

            public enum Platform: String, Sendable, Codable, CaseIterable {
                case iOS = "IOS"
                case macOS = "MAC_OS"
                case tvOS = "TV_OS"
                case visionOS = "VISION_OS"
                case watchOS = "WATCH_OS"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = Platform(rawValue: string) {
                        self = value
                    } else if let value = Platform(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid Platform value: \(string)"
                        )
                    }
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var apps: Apps?
        public var betaGroups: BetaGroups?
        public var builds: Builds?

        public init(apps: Apps? = nil,
                    betaGroups: BetaGroups? = nil,
                    builds: Builds? = nil)
        {
            self.apps = apps
            self.betaGroups = betaGroups
            self.builds = builds
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            apps = try container.decodeIfPresent(Apps.self, forKey: "apps")
            betaGroups = try container.decodeIfPresent(BetaGroups.self, forKey: "betaGroups")
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(apps, forKey: "apps")
            try container.encodeIfPresent(betaGroups, forKey: "betaGroups")
            try container.encodeIfPresent(builds, forKey: "builds")
        }

        public struct Apps: Codable, Sendable {
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
                public var type: String { "apps" }

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

        public struct BetaGroups: Codable, Sendable {
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
                public var type: String { "betaGroups" }

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

        public struct Builds: Codable, Sendable {
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
                public var type: String { "builds" }

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
