import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionUpdateRequest
 The request body you use to update an App Store Version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionupdaterequest>
 */
public struct AppStoreVersionUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "appStoreVersions" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var copyright: String?
            public var downloadable: Bool?
            public var earliestReleaseDate: Date?
            public var releaseType: AppStoreVersion.Attributes.ReleaseType?
            public var reviewType: AppStoreVersion.Attributes.ReviewType?
            public var versionString: String?

            public init(copyright: String? = nil,
                        downloadable: Bool? = nil,
                        earliestReleaseDate: Date? = nil,
                        releaseType: AppStoreVersion.Attributes.ReleaseType? = nil,
                        reviewType: AppStoreVersion.Attributes.ReviewType? = nil,
                        versionString: String? = nil)
            {
                self.copyright = copyright
                self.downloadable = downloadable
                self.earliestReleaseDate = earliestReleaseDate
                self.releaseType = releaseType
                self.reviewType = reviewType
                self.versionString = versionString
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                copyright = try container.decodeIfPresent(String.self, forKey: "copyright")
                downloadable = try container.decodeIfPresent(Bool.self, forKey: "downloadable")
                earliestReleaseDate = try container.decodeIfPresent(Date.self, forKey: "earliestReleaseDate")
                releaseType = try container.decodeIfPresent(AppStoreVersion.Attributes.ReleaseType.self, forKey: "releaseType")
                reviewType = try container.decodeIfPresent(AppStoreVersion.Attributes.ReviewType.self, forKey: "reviewType")
                versionString = try container.decodeIfPresent(String.self, forKey: "versionString")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(copyright, forKey: "copyright")
                try container.encodeIfPresent(downloadable, forKey: "downloadable")
                try container.encodeIfPresent(earliestReleaseDate, forKey: "earliestReleaseDate")
                try container.encodeIfPresent(releaseType, forKey: "releaseType")
                try container.encodeIfPresent(reviewType, forKey: "reviewType")
                try container.encodeIfPresent(versionString, forKey: "versionString")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var appClipDefaultExperience: AppClipDefaultExperience?
            public var build: Build?

            public init(appClipDefaultExperience: AppClipDefaultExperience? = nil,
                        build: Build? = nil)
            {
                self.appClipDefaultExperience = appClipDefaultExperience
                self.build = build
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appClipDefaultExperience = try container.decodeIfPresent(AppClipDefaultExperience.self, forKey: "appClipDefaultExperience")
                build = try container.decodeIfPresent(Build.self, forKey: "build")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(appClipDefaultExperience, forKey: "appClipDefaultExperience")
                try container.encodeIfPresent(build, forKey: "build")
            }

            public struct AppClipDefaultExperience: Codable, Sendable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
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

            public struct Build: Codable, Sendable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "builds" }

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
