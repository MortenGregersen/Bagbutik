import Foundation

/**
 # AppClipAppStoreReviewDetail
 The data structure that represents an App Clip App Store Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetail>
 */
public struct AppClipAppStoreReviewDetail: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an App Clip App Store Review Details resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipAppStoreReviewDetails" }
    /// The attributes that describe the App Clip App Store Review Details resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
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
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
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
     # AppClipAppStoreReviewDetail.Attributes
     The attributes that describe the App Clip App Store Review Details resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetail/attributes>
     */
    public struct Attributes: Codable {
        /// An array of invocation URLs for your App Clip.
        public var invocationUrls: [String]?

        public init(invocationUrls: [String]? = nil) {
            self.invocationUrls = invocationUrls
        }
    }

    /**
     # AppClipAppStoreReviewDetail.Relationships
     The relationships of the App Clip App Store Details resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetail/relationships>
     */
    public struct Relationships: Codable {
        /// The related Default App Clip Experiences resource.
        public var appClipDefaultExperience: AppClipDefaultExperience?

        public init(appClipDefaultExperience: AppClipDefaultExperience? = nil) {
            self.appClipDefaultExperience = appClipDefaultExperience
        }

        /**
         # AppClipAppStoreReviewDetail.Relationships.AppClipDefaultExperience
         The data and links that describe the relationship between the App Clip App Store Review Details and the Default App Clip Experiences resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetail/relationships/appclipdefaultexperience>
         */
        public struct AppClipDefaultExperience: Codable {
            /// The ID and type of the related Default App Clip Experiences resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            /**
             # AppClipAppStoreReviewDetail.Relationships.AppClipDefaultExperience.Data
             The links to the related Default App Clip Experiences resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetail/relationships/appclipdefaultexperience/data>
             */
            public struct Data: Codable, Identifiable {
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

            /**
             # AppClipAppStoreReviewDetail.Relationships.AppClipDefaultExperience.Links
             The type and ID of a related Default App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetail/relationships/appclipdefaultexperience/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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
