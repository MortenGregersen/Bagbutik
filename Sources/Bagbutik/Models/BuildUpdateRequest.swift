import Foundation

public struct BuildUpdateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public let id: String
        public var type: String { "builds" }
        public let attributes: Attributes?
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public let expired: Bool?
            public let usesNonExemptEncryption: Bool?

            public init(expired: Bool? = nil, usesNonExemptEncryption: Bool? = nil) {
                self.expired = expired
                self.usesNonExemptEncryption = usesNonExemptEncryption
            }
        }

        public struct Relationships: Codable {
            public let appEncryptionDeclaration: AppEncryptionDeclaration?

            public init(appEncryptionDeclaration: AppEncryptionDeclaration? = nil) {
                self.appEncryptionDeclaration = appEncryptionDeclaration
            }

            public struct AppEncryptionDeclaration: Codable {
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public struct Data: Codable {
                    public let id: String
                    public var type: String { "appEncryptionDeclarations" }

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
