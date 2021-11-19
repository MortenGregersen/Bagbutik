import Foundation

/**
 The request body you use to create a Build Beta Notification.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest>
 */
public struct BuildBetaNotificationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "buildBetaNotifications" }
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(relationships: Relationships) {
            self.relationships = relationships
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case relationships
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let build: Build

            public init(build: Build) {
                self.build = build
            }

            public struct Build: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data/relationships/build/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

                    public init(id: String) {
                        self.id = id
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
