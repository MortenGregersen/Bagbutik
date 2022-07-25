import Foundation

/**
 The request body you use to create an App Clip App Store Review Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest>
 */
public struct AppClipAppStoreReviewDetailCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipAppStoreReviewDetails" }
        /// The attributes that describe the request that creates an App Clip App Store Review Details resource.
        public var attributes: Attributes?
        /// The navigational links to related data and included resource types and IDs.
        public let relationships: Relationships

        public init(attributes: Attributes? = nil, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        /**
         The attributes you set that describe the new App Clip App Store Review Details resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// An array of invocation URLs for your App Clip.
            public var invocationUrls: [String]?

            public init(invocationUrls: [String]? = nil) {
                self.invocationUrls = invocationUrls
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related Default App Clip Experiences resource.
            public let appClipDefaultExperience: AppClipDefaultExperience

            public init(appClipDefaultExperience: AppClipDefaultExperience) {
                self.appClipDefaultExperience = appClipDefaultExperience
            }

            /**
             The relationship to the Default App Clip Experiences resource you set with the request that creates an App Clip App Store Review Details resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/relationships/appclipdefaultexperience>
             */
            public struct AppClipDefaultExperience: Codable {
                /// The ID and type of the related Default App Clip Experiences resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the Default App Clip Experiences resource that you’re relating with the App Clip App Store Review Details resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/relationships/appclipdefaultexperience/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the related Default App Clip Experiences resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipDefaultExperiences" }

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
