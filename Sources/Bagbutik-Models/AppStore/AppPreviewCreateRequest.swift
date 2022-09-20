import Bagbutik_Core
import Foundation

/**
 # AppPreviewCreateRequest
 The request body you use to create an App Preview.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewcreaterequest>
 */
public struct AppPreviewCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # AppPreviewCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "appPreviews" }
        public let attributes: Attributes
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
         # AppPreviewCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let fileName: String
            public let fileSize: Int
            public var mimeType: String?
            public var previewFrameTimeCode: String?

            public init(fileName: String,
                        fileSize: Int,
                        mimeType: String? = nil,
                        previewFrameTimeCode: String? = nil)
            {
                self.fileName = fileName
                self.fileSize = fileSize
                self.mimeType = mimeType
                self.previewFrameTimeCode = previewFrameTimeCode
            }
        }

        /**
         # AppPreviewCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appPreviewSet: AppPreviewSet

            public init(appPreviewSet: AppPreviewSet) {
                self.appPreviewSet = appPreviewSet
            }

            /**
             # AppPreviewCreateRequest.Data.Relationships.AppPreviewSet
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewcreaterequest/data/relationships/apppreviewset>
             */
            public struct AppPreviewSet: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # AppPreviewCreateRequest.Data.Relationships.AppPreviewSet.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewcreaterequest/data/relationships/apppreviewset/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appPreviewSets" }

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
