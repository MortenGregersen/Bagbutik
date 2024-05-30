import Bagbutik_Core
import Foundation

/**
 # AppEncryptionDeclaration
 The data structure that represents an App Encryption Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration>
 */
public struct AppEncryptionDeclaration: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appEncryptionDeclarations" }
    /// The resource's attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
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

    /**
     # AppEncryptionDeclaration.Attributes
     Attributes that describe an App Encryption Declarations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/attributes>
     */
    public struct Attributes: Codable {
        public var appDescription: String?
        /// The approval state of your export compliance documentation.
        public var appEncryptionDeclarationState: AppEncryptionDeclarationState?
        /// A Boolean value that indicates the intent to distribute your app on the French App Store.
        public var availableOnFrenchStore: Bool?
        /// A unique identifier that can be added to your app to associate it with a given declaration.
        public var codeValue: String?
        /// A Boolean value that indicates your app implements any proprietary encryption algorithms.
        public var containsProprietaryCryptography: Bool?
        /// A Boolean value that indicates your app implements any standard encryption algorithms instead of, or in addition to, using or accessing the encryption in Apple’s operating systems.
        public var containsThirdPartyCryptography: Bool?
        public var createdDate: Date?
        /// The document name of your submitted export compliance documentation.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var documentName: String? = nil
        /// The file type of your submitted export compliance documentation.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var documentType: String? = nil
        /// The URL to the file of your submitted export compliance documentation.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var documentUrl: String? = nil
        /// A Boolean value that indicates your app is exempt based on your use of encryption and the app's availability.
        public var exempt: Bool?
        /// The platform of the declaration.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var platform: Platform? = nil
        /// The date and time you submitted your declaration.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var uploadedDate: Date? = nil
        /// A Boolean value that indicates whether your app uses, contains, or incorporates cryptography.
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

    /**
     # AppEncryptionDeclaration.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships>
     */
    public struct Relationships: Codable {
        public var app: App?
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

        public init(app: App? = nil,
                    appEncryptionDeclarationDocument: AppEncryptionDeclarationDocument? = nil)
        {
            self.app = app
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

        /**
         # AppEncryptionDeclaration.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships/app>
         */
        public struct App: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # AppEncryptionDeclaration.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships/app/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
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

            /**
             # AppEncryptionDeclaration.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships/app/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        public struct AppEncryptionDeclarationDocument: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Identifiable {
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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        public struct Builds: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Identifiable {
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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
