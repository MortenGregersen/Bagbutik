import BagbutikCore
import Foundation

/**
 # AppAssetLibraryVideoCreateRequest

 The request body you use to create an app asset library video.

 ```
 object AppAssetLibraryVideoCreateRequest
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryVideoCreateRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryVideoCreateRequest/Data-data.dictionary)

 The request body you use to create an app asset library video.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryvideocreaterequest>
 */
public struct AppAssetLibraryVideoCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "appAssetLibraryVideos" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public let category: AppAssetLibraryAssetCategory
            public let fileName: String
            public let fileSize: Int
            public var previewFrameTimeCode: String?
            public var referenceName: String?

            public init(category: AppAssetLibraryAssetCategory,
                        fileName: String,
                        fileSize: Int,
                        previewFrameTimeCode: String? = nil,
                        referenceName: String? = nil)
            {
                self.category = category
                self.fileName = fileName
                self.fileSize = fileSize
                self.previewFrameTimeCode = previewFrameTimeCode
                self.referenceName = referenceName
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                category = try container.decode(AppAssetLibraryAssetCategory.self, forKey: "category")
                fileName = try container.decode(String.self, forKey: "fileName")
                fileSize = try container.decode(Int.self, forKey: "fileSize")
                previewFrameTimeCode = try container.decodeIfPresent(String.self, forKey: "previewFrameTimeCode")
                referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(category, forKey: "category")
                try container.encode(fileName, forKey: "fileName")
                try container.encode(fileSize, forKey: "fileSize")
                try container.encodeIfPresent(previewFrameTimeCode, forKey: "previewFrameTimeCode")
                try container.encodeIfPresent(referenceName, forKey: "referenceName")
            }
        }

        public struct Relationships: Codable, Sendable {
            public let assetLibrary: AssetLibrary
            public var placements: Placements?

            public init(assetLibrary: AssetLibrary,
                        placements: Placements? = nil)
            {
                self.assetLibrary = assetLibrary
                self.placements = placements
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                assetLibrary = try container.decode(AssetLibrary.self, forKey: "assetLibrary")
                placements = try container.decodeIfPresent(Placements.self, forKey: "placements")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(assetLibrary, forKey: "assetLibrary")
                try container.encodeIfPresent(placements, forKey: "placements")
            }

            public struct AssetLibrary: Codable, Sendable {
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

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "appAssetLibraries" }

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

            public struct Placements: Codable, Sendable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "appAssetLibraryPlacements" }

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
