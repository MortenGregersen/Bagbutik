import Bagbutik_Core
import Foundation

/**
 # BuildBetaNotificationCreateRequest
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
     # BuildBetaNotificationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "buildBetaNotifications" }
        /// The types and IDs of the related data to update.
        public let relationships: Relationships

        public init(relationships: Relationships) {
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case relationships
            case type
        }

        /**
         # BuildBetaNotificationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let build: Build

            public init(build: Build) {
                self.build = build
            }

            /**
             # BuildBetaNotificationCreateRequest.Data.Relationships.Build
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data/relationships/build>
             */
            public struct Build: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # BuildBetaNotificationCreateRequest.Data.Relationships.Build.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationcreaterequest/data/relationships/build/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The types and IDs of the related data to update.
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
