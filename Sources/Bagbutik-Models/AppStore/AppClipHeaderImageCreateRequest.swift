import Bagbutik_Core
import Foundation

/**
 # AppClipHeaderImageCreateRequest
 The request body you use to reserve an image asset that appears on the App Clip card of a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest>
 */
public struct AppClipHeaderImageCreateRequest: Codable, RequestBody {
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
     # AppClipHeaderImageCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipHeaderImages" }
        /// The attributes that describes the request that creates an App Clip Header Images resource.
        public let attributes: Attributes
        /// The navigational links to related data and included resource types and IDs.
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
         # AppClipHeaderImageCreateRequest.Data.Attributes
         The attributes you set that describe the new App Clip Header Images resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The filename of the image asset that appears on the App Clip card for the default App Clip experience.
            public let fileName: String
            /// The size of the image asset that appears on the App Clip card for the default App Clip experience.
            public let fileSize: Int

            public init(fileName: String,
                        fileSize: Int)
            {
                self.fileName = fileName
                self.fileSize = fileSize
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                fileName = try container.decode(String.self, forKey: .fileName)
                fileSize = try container.decode(Int.self, forKey: .fileSize)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(fileName, forKey: .fileName)
                try container.encode(fileSize, forKey: .fileSize)
            }

            private enum CodingKeys: String, CodingKey {
                case fileName
                case fileSize
            }
        }

        /**
         # AppClipHeaderImageCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related Default App Clip Experience Localizations resource.
            public let appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization

            public init(appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization) {
                self.appClipDefaultExperienceLocalization = appClipDefaultExperienceLocalization
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                appClipDefaultExperienceLocalization = try container.decode(AppClipDefaultExperienceLocalization.self, forKey: .appClipDefaultExperienceLocalization)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(appClipDefaultExperienceLocalization, forKey: .appClipDefaultExperienceLocalization)
            }

            private enum CodingKeys: String, CodingKey {
                case appClipDefaultExperienceLocalization
            }

            /**
             # AppClipHeaderImageCreateRequest.Data.Relationships.AppClipDefaultExperienceLocalization
             The relationship to the Default App Clip Experience Localizations resource you set with the request that creates an App Clip Header Images resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/relationships/appclipdefaultexperiencelocalization>
             */
            public struct AppClipDefaultExperienceLocalization: Codable {
                /// The ID and type of the related Default App Clip Experience Localizations resource.
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
                 # AppClipHeaderImageCreateRequest.Data.Relationships.AppClipDefaultExperienceLocalization.Data
                 The type and ID of the Default App Clip Localizations resource that you’re relating with the App Clip Header Images resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimagecreaterequest/data/relationships/appclipdefaultexperiencelocalization/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies a Default App Clip Experience Localizations resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipDefaultExperienceLocalizations" }

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
