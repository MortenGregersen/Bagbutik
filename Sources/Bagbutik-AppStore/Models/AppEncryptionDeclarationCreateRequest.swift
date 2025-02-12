import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppEncryptionDeclarationCreateRequest
 The request body you use to create an app encryption declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclarationcreaterequest>
 */
public struct AppEncryptionDeclarationCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "appEncryptionDeclarations" }
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
            public let appDescription: String
            public let availableOnFrenchStore: Bool
            public let containsProprietaryCryptography: Bool
            public let containsThirdPartyCryptography: Bool

            public init(appDescription: String,
                        availableOnFrenchStore: Bool,
                        containsProprietaryCryptography: Bool,
                        containsThirdPartyCryptography: Bool)
            {
                self.appDescription = appDescription
                self.availableOnFrenchStore = availableOnFrenchStore
                self.containsProprietaryCryptography = containsProprietaryCryptography
                self.containsThirdPartyCryptography = containsThirdPartyCryptography
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appDescription = try container.decode(String.self, forKey: "appDescription")
                availableOnFrenchStore = try container.decode(Bool.self, forKey: "availableOnFrenchStore")
                containsProprietaryCryptography = try container.decode(Bool.self, forKey: "containsProprietaryCryptography")
                containsThirdPartyCryptography = try container.decode(Bool.self, forKey: "containsThirdPartyCryptography")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(appDescription, forKey: "appDescription")
                try container.encode(availableOnFrenchStore, forKey: "availableOnFrenchStore")
                try container.encode(containsProprietaryCryptography, forKey: "containsProprietaryCryptography")
                try container.encode(containsThirdPartyCryptography, forKey: "containsThirdPartyCryptography")
            }
        }

        public struct Relationships: Codable, Sendable {
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public let app: App

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
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
