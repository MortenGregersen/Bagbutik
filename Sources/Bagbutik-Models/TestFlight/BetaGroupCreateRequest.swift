import Bagbutik_Core
import Foundation

/**
 # BetaGroupCreateRequest
 The request body you use to create a Beta Group.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest>
 */
public struct BetaGroupCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }

    /**
     # BetaGroupCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaGroups" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// Navigational links to related data and included resource types and IDs.
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
         # BetaGroupCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var feedbackEnabled: Bool?
            public var hasAccessToAllBuilds: Bool?
            public var isInternalGroup: Bool?
            /// The name for the beta group.
            public let name: String
            /// A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.
            public var publicLinkEnabled: Bool?
            /// The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.
            public var publicLinkLimit: Int?
            /// A Boolean value that limits the number of testers who can join the beta group using the public link.
            public var publicLinkLimitEnabled: Bool?

            public init(feedbackEnabled: Bool? = nil,
                        hasAccessToAllBuilds: Bool? = nil,
                        isInternalGroup: Bool? = nil,
                        name: String,
                        publicLinkEnabled: Bool? = nil,
                        publicLinkLimit: Int? = nil,
                        publicLinkLimitEnabled: Bool? = nil)
            {
                self.feedbackEnabled = feedbackEnabled
                self.hasAccessToAllBuilds = hasAccessToAllBuilds
                self.isInternalGroup = isInternalGroup
                self.name = name
                self.publicLinkEnabled = publicLinkEnabled
                self.publicLinkLimit = publicLinkLimit
                self.publicLinkLimitEnabled = publicLinkLimitEnabled
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                feedbackEnabled = try container.decodeIfPresent(Bool.self, forKey: .feedbackEnabled)
                hasAccessToAllBuilds = try container.decodeIfPresent(Bool.self, forKey: .hasAccessToAllBuilds)
                isInternalGroup = try container.decodeIfPresent(Bool.self, forKey: .isInternalGroup)
                name = try container.decode(String.self, forKey: .name)
                publicLinkEnabled = try container.decodeIfPresent(Bool.self, forKey: .publicLinkEnabled)
                publicLinkLimit = try container.decodeIfPresent(Int.self, forKey: .publicLinkLimit)
                publicLinkLimitEnabled = try container.decodeIfPresent(Bool.self, forKey: .publicLinkLimitEnabled)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(feedbackEnabled, forKey: .feedbackEnabled)
                try container.encodeIfPresent(hasAccessToAllBuilds, forKey: .hasAccessToAllBuilds)
                try container.encodeIfPresent(isInternalGroup, forKey: .isInternalGroup)
                try container.encode(name, forKey: .name)
                try container.encodeIfPresent(publicLinkEnabled, forKey: .publicLinkEnabled)
                try container.encodeIfPresent(publicLinkLimit, forKey: .publicLinkLimit)
                try container.encodeIfPresent(publicLinkLimitEnabled, forKey: .publicLinkLimitEnabled)
            }

            private enum CodingKeys: String, CodingKey {
                case feedbackEnabled
                case hasAccessToAllBuilds
                case isInternalGroup
                case name
                case publicLinkEnabled
                case publicLinkLimit
                case publicLinkLimitEnabled
            }
        }

        /**
         # BetaGroupCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let app: App
            public var betaTesters: BetaTesters?
            public var builds: Builds?

            public init(app: App,
                        betaTesters: BetaTesters? = nil,
                        builds: Builds? = nil)
            {
                self.app = app
                self.betaTesters = betaTesters
                self.builds = builds
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                app = try container.decode(App.self, forKey: .app)
                betaTesters = try container.decodeIfPresent(BetaTesters.self, forKey: .betaTesters)
                builds = try container.decodeIfPresent(Builds.self, forKey: .builds)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(app, forKey: .app)
                try container.encodeIfPresent(betaTesters, forKey: .betaTesters)
                try container.encodeIfPresent(builds, forKey: .builds)
            }

            private enum CodingKeys: String, CodingKey {
                case app
                case betaTesters
                case builds
            }

            /**
             # BetaGroupCreateRequest.Data.Relationships.App
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships/app>
             */
            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decode(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # BetaGroupCreateRequest.Data.Relationships.App.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
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

            /**
             # BetaGroupCreateRequest.Data.Relationships.BetaTesters
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships/betatesters>
             */
            public struct BetaTesters: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent([Data].self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # BetaGroupCreateRequest.Data.Relationships.BetaTesters.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships/betatesters/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "betaTesters" }

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

            /**
             # BetaGroupCreateRequest.Data.Relationships.Builds
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships/builds>
             */
            public struct Builds: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent([Data].self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # BetaGroupCreateRequest.Data.Relationships.Builds.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupcreaterequest/data/relationships/builds/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

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
