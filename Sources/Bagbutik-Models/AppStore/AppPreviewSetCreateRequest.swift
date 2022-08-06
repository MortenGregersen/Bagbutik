import Bagbutik_Core
import Foundation

/**
 # AppPreviewSetCreateRequest
 The request body you use to create an App Preview Set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest>
 */
public struct AppPreviewSetCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # AppPreviewSetCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "appPreviewSets" }
        public let attributes: Attributes
        public var relationships: Relationships?

        public init(attributes: Attributes,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # AppPreviewSetCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let previewType: PreviewType

            public init(previewType: PreviewType) {
                self.previewType = previewType
            }
        }

        /**
         # AppPreviewSetCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public var appCustomProductPageLocalization: AppCustomProductPageLocalization?
            public var appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization?
            public var appStoreVersionLocalization: AppStoreVersionLocalization?

            public init(appCustomProductPageLocalization: AppCustomProductPageLocalization? = nil,
                        appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization? = nil,
                        appStoreVersionLocalization: AppStoreVersionLocalization? = nil)
            {
                self.appCustomProductPageLocalization = appCustomProductPageLocalization
                self.appStoreVersionExperimentTreatmentLocalization = appStoreVersionExperimentTreatmentLocalization
                self.appStoreVersionLocalization = appStoreVersionLocalization
            }

            public struct AppCustomProductPageLocalization: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appCustomProductPageLocalizations" }

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

            public struct AppStoreVersionExperimentTreatmentLocalization: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appStoreVersionExperimentTreatmentLocalizations" }

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
             # AppPreviewSetCreateRequest.Data.Relationships.AppStoreVersionLocalization
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/relationships/appstoreversionlocalization>
             */
            public struct AppStoreVersionLocalization: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 # AppPreviewSetCreateRequest.Data.Relationships.AppStoreVersionLocalization.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetcreaterequest/data/relationships/appstoreversionlocalization/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appStoreVersionLocalizations" }

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
