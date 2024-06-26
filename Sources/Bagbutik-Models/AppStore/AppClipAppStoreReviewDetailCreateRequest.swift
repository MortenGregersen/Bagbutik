import Bagbutik_Core
import Foundation

/**
 # AppClipAppStoreReviewDetailCreateRequest
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # AppClipAppStoreReviewDetailCreateRequest.Data
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

        public init(attributes: Attributes? = nil,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        /**
         # AppClipAppStoreReviewDetailCreateRequest.Data.Attributes
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                invocationUrls = try container.decodeIfPresent([String].self, forKey: "invocationUrls")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(invocationUrls, forKey: "invocationUrls")
            }
        }

        /**
         # AppClipAppStoreReviewDetailCreateRequest.Data.Relationships
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appClipDefaultExperience = try container.decode(AppClipDefaultExperience.self, forKey: "appClipDefaultExperience")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(appClipDefaultExperience, forKey: "appClipDefaultExperience")
            }

            /**
             # AppClipAppStoreReviewDetailCreateRequest.Data.Relationships.AppClipDefaultExperience
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

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppClipAppStoreReviewDetailCreateRequest.Data.Relationships.AppClipDefaultExperience.Data
                 The type and ID of the Default App Clip Experiences resource that you’re relating with the App Clip App Store Review Details resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailcreaterequest/data/relationships/appclipdefaultexperience/data>
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
}
