import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AndroidToIosAppMappingDetailCreateRequest
 The request body you use to create an Android to iOS app mapping detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/androidtoiosappmappingdetailcreaterequest>
 */
public struct AndroidToIosAppMappingDetailCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "androidToIosAppMappingDetails" }
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
            public let appSigningKeyPublicCertificateSha256Fingerprints: [String]
            public let packageName: String

            public init(appSigningKeyPublicCertificateSha256Fingerprints: [String],
                        packageName: String)
            {
                self.appSigningKeyPublicCertificateSha256Fingerprints = appSigningKeyPublicCertificateSha256Fingerprints
                self.packageName = packageName
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appSigningKeyPublicCertificateSha256Fingerprints = try container.decode([String].self, forKey: "appSigningKeyPublicCertificateSha256Fingerprints")
                packageName = try container.decode(String.self, forKey: "packageName")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(appSigningKeyPublicCertificateSha256Fingerprints, forKey: "appSigningKeyPublicCertificateSha256Fingerprints")
                try container.encode(packageName, forKey: "packageName")
            }
        }

        public struct Relationships: Codable, Sendable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                app = try container.decode(App.self, forKey: "app")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(app, forKey: "app")
            }

            public struct App: Codable, Sendable {
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
                    public var type: String { "apps" }

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
