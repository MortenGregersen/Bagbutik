import Bagbutik_Core
import Foundation

public struct AppEncryptionDeclaration: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appEncryptionDeclarations" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var appDescription: String?
        public var appEncryptionDeclarationState: AppEncryptionDeclarationState?
        public var availableOnFrenchStore: Bool?
        public var codeValue: String?
        public var containsProprietaryCryptography: Bool?
        public var containsThirdPartyCryptography: Bool?
        public var createdDate: Date?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var documentName: String? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var documentType: String? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var documentUrl: String? = nil
        public var exempt: Bool?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var platform: Platform? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var uploadedDate: Date? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var usesEncryption: Bool? = nil

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(appDescription: String? = nil,
                    appEncryptionDeclarationState: AppEncryptionDeclarationState? = nil,
                    availableOnFrenchStore: Bool? = nil,
                    codeValue: String? = nil,
                    containsProprietaryCryptography: Bool? = nil,
                    containsThirdPartyCryptography: Bool? = nil,
                    createdDate: Date? = nil,
                    documentName: String? = nil,
                    documentType: String? = nil,
                    documentUrl: String? = nil,
                    exempt: Bool? = nil,
                    platform: Platform? = nil,
                    uploadedDate: Date? = nil,
                    usesEncryption: Bool? = nil)
        {
            self.appDescription = appDescription
            self.appEncryptionDeclarationState = appEncryptionDeclarationState
            self.availableOnFrenchStore = availableOnFrenchStore
            self.codeValue = codeValue
            self.containsProprietaryCryptography = containsProprietaryCryptography
            self.containsThirdPartyCryptography = containsThirdPartyCryptography
            self.createdDate = createdDate
            self.documentName = documentName
            self.documentType = documentType
            self.documentUrl = documentUrl
            self.exempt = exempt
            self.platform = platform
            self.uploadedDate = uploadedDate
            self.usesEncryption = usesEncryption
        }

        public init(appDescription: String? = nil,
                    appEncryptionDeclarationState: AppEncryptionDeclarationState? = nil,
                    availableOnFrenchStore: Bool? = nil,
                    codeValue: String? = nil,
                    containsProprietaryCryptography: Bool? = nil,
                    containsThirdPartyCryptography: Bool? = nil,
                    createdDate: Date? = nil,
                    exempt: Bool? = nil)
        {
            self.appDescription = appDescription
            self.appEncryptionDeclarationState = appEncryptionDeclarationState
            self.availableOnFrenchStore = availableOnFrenchStore
            self.codeValue = codeValue
            self.containsProprietaryCryptography = containsProprietaryCryptography
            self.containsThirdPartyCryptography = containsThirdPartyCryptography
            self.createdDate = createdDate
            self.exempt = exempt
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appDescription = try container.decodeIfPresent(String.self, forKey: "appDescription")
            appEncryptionDeclarationState = try container.decodeIfPresent(AppEncryptionDeclarationState.self, forKey: "appEncryptionDeclarationState")
            availableOnFrenchStore = try container.decodeIfPresent(Bool.self, forKey: "availableOnFrenchStore")
            codeValue = try container.decodeIfPresent(String.self, forKey: "codeValue")
            containsProprietaryCryptography = try container.decodeIfPresent(Bool.self, forKey: "containsProprietaryCryptography")
            containsThirdPartyCryptography = try container.decodeIfPresent(Bool.self, forKey: "containsThirdPartyCryptography")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            documentName = try container.decodeIfPresent(String.self, forKey: "documentName")
            documentType = try container.decodeIfPresent(String.self, forKey: "documentType")
            documentUrl = try container.decodeIfPresent(String.self, forKey: "documentUrl")
            exempt = try container.decodeIfPresent(Bool.self, forKey: "exempt")
            platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
            uploadedDate = try container.decodeIfPresent(Date.self, forKey: "uploadedDate")
            usesEncryption = try container.decodeIfPresent(Bool.self, forKey: "usesEncryption")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appDescription, forKey: "appDescription")
            try container.encodeIfPresent(appEncryptionDeclarationState, forKey: "appEncryptionDeclarationState")
            try container.encodeIfPresent(availableOnFrenchStore, forKey: "availableOnFrenchStore")
            try container.encodeIfPresent(codeValue, forKey: "codeValue")
            try container.encodeIfPresent(containsProprietaryCryptography, forKey: "containsProprietaryCryptography")
            try container.encodeIfPresent(containsThirdPartyCryptography, forKey: "containsThirdPartyCryptography")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(documentName, forKey: "documentName")
            try container.encodeIfPresent(documentType, forKey: "documentType")
            try container.encodeIfPresent(documentUrl, forKey: "documentUrl")
            try container.encodeIfPresent(exempt, forKey: "exempt")
            try container.encodeIfPresent(platform, forKey: "platform")
            try container.encodeIfPresent(uploadedDate, forKey: "uploadedDate")
            try container.encodeIfPresent(usesEncryption, forKey: "usesEncryption")
        }
    }

    public struct Relationships: Codable, Sendable {
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var app: App? = nil
        public var appEncryptionDeclarationDocument: AppEncryptionDeclarationDocument?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var builds: Builds? = nil

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(app: App? = nil,
                    appEncryptionDeclarationDocument: AppEncryptionDeclarationDocument? = nil,
                    builds: Builds? = nil)
        {
            self.app = app
            self.appEncryptionDeclarationDocument = appEncryptionDeclarationDocument
            self.builds = builds
        }

        public init(appEncryptionDeclarationDocument: AppEncryptionDeclarationDocument? = nil) {
            self.appEncryptionDeclarationDocument = appEncryptionDeclarationDocument
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
            appEncryptionDeclarationDocument = try container.decodeIfPresent(AppEncryptionDeclarationDocument.self, forKey: "appEncryptionDeclarationDocument")
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(appEncryptionDeclarationDocument, forKey: "appEncryptionDeclarationDocument")
            try container.encodeIfPresent(builds, forKey: "builds")
        }

        public struct App: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
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

        public struct AppEncryptionDeclarationDocument: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appEncryptionDeclarationDocuments" }

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

        public struct Builds: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
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
