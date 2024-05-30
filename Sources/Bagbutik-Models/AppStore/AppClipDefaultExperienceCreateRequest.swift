import Bagbutik_Core
import Foundation

/**
 # AppClipDefaultExperienceCreateRequest
 The request body you use to create a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest>
 */
public struct AppClipDefaultExperienceCreateRequest: Codable, RequestBody {
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
     # AppClipDefaultExperienceCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipDefaultExperiences" }
        /// The attributes that describe the request that creates a Default App Clip Experiences resource.
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
            case attributes
            case relationships
            case type
        }

        /**
         # AppClipDefaultExperienceCreateRequest.Data.Attributes
         The attributes you set that describe the Default App Clip Experiences resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The call-to-action verb that appears on the App Clip card.
            public var action: AppClipAction?

            public init(action: AppClipAction? = nil) {
                self.action = action
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                action = try container.decodeIfPresent(AppClipAction.self, forKey: .action)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(action, forKey: .action)
            }

            private enum CodingKeys: String, CodingKey {
                case action
            }
        }

        /**
         # AppClipDefaultExperienceCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related App Clips resource.
            public let appClip: AppClip
            /// The related Default App Clip Experience Templates resource.
            public var appClipDefaultExperienceTemplate: AppClipDefaultExperienceTemplate?
            /// The related App Store Versions resource.
            public var releaseWithAppStoreVersion: ReleaseWithAppStoreVersion?

            public init(appClip: AppClip,
                        appClipDefaultExperienceTemplate: AppClipDefaultExperienceTemplate? = nil,
                        releaseWithAppStoreVersion: ReleaseWithAppStoreVersion? = nil)
            {
                self.appClip = appClip
                self.appClipDefaultExperienceTemplate = appClipDefaultExperienceTemplate
                self.releaseWithAppStoreVersion = releaseWithAppStoreVersion
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                appClip = try container.decode(AppClip.self, forKey: .appClip)
                appClipDefaultExperienceTemplate = try container.decodeIfPresent(AppClipDefaultExperienceTemplate.self, forKey: .appClipDefaultExperienceTemplate)
                releaseWithAppStoreVersion = try container.decodeIfPresent(ReleaseWithAppStoreVersion.self, forKey: .releaseWithAppStoreVersion)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(appClip, forKey: .appClip)
                try container.encodeIfPresent(appClipDefaultExperienceTemplate, forKey: .appClipDefaultExperienceTemplate)
                try container.encodeIfPresent(releaseWithAppStoreVersion, forKey: .releaseWithAppStoreVersion)
            }

            private enum CodingKeys: String, CodingKey {
                case appClip
                case appClipDefaultExperienceTemplate
                case releaseWithAppStoreVersion
            }

            /**
             # AppClipDefaultExperienceCreateRequest.Data.Relationships.AppClip
             The relationship to the App Clips resource you set with the request that creates a Default App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/appclip>
             */
            public struct AppClip: Codable {
                /// The ID and type of the related App Clips resource.
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
                 # AppClipDefaultExperienceCreateRequest.Data.Relationships.AppClip.Data
                 The type and ID of the App Clips resource that you’re relating with the Default App Clip Experiences resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/appclip/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies an App Clips resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClips" }

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
             # AppClipDefaultExperienceCreateRequest.Data.Relationships.AppClipDefaultExperienceTemplate
             The relationship to the Default App Clip Experience Templates resource you set with the request that creates a Default App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/appclipdefaultexperiencetemplate>
             */
            public struct AppClipDefaultExperienceTemplate: Codable {
                /// The ID and type of the related App Clip Default Experience Templates resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # AppClipDefaultExperienceCreateRequest.Data.Relationships.AppClipDefaultExperienceTemplate.Data
                 The type and ID of the Default App Clip Experience Templates resource that you’re relating with the Default App Clip Experiences resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/appclipdefaultexperiencetemplate/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Default App Clip Experience Templates resource.
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

            /**
             # AppClipDefaultExperienceCreateRequest.Data.Relationships.ReleaseWithAppStoreVersion
             The relationship to the App Store Versions resource you set with the request that creates a Default App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/releasewithappstoreversion>
             */
            public struct ReleaseWithAppStoreVersion: Codable {
                /// The ID and type of the related App Store Versions resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # AppClipDefaultExperienceCreateRequest.Data.Relationships.ReleaseWithAppStoreVersion.Data
                 The type and ID of the App Store Versions resource that you’re relating with the Default App Clip Experiences resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencecreaterequest/data/relationships/releasewithappstoreversion/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related App Store Versions resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appStoreVersions" }

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
