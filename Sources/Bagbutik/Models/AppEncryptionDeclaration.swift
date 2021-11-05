import Foundation

/**
 The data structure that represents an App Encryption Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration>
 */
public struct AppEncryptionDeclaration: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appEncryptionDeclarations" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    /**
     Attributes that describe an App Encryption Declarations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/attributes>
     */
    public struct Attributes: Codable {
        /// The approval state of your export compliance documentation.
        public let appEncryptionDeclarationState: AppEncryptionDeclarationState?
        /// A Boolean value that indicates the intent to distribute your app on the French App Store.
        public let availableOnFrenchStore: Bool?
        /// A unique identifier that can be added to your app to associate it with a given declaration.
        public let codeValue: String?
        /// A Boolean value that indicates your app implements any proprietary encryption algorithms.
        public let containsProprietaryCryptography: Bool?
        /// A Boolean value that indicates your app implements any standard encryption algorithms instead of, or in addition to, using or accessing the encryption in Apple’s operating systems.
        public let containsThirdPartyCryptography: Bool?
        /// The document name of your submitted export compliance documentation.
        public let documentName: String?
        /// The file type of your submitted export compliance documentation.
        public let documentType: String?
        /// The URL to the file of your submitted export compliance documentation.
        public let documentUrl: String?
        /// A Boolean value that indicates your app is exempt based on your use of encryption and the app's availability.
        public let exempt: Bool?
        /// The platform of the declaration.
        public let platform: Platform?
        /// The date and time you submitted your declaration.
        public let uploadedDate: Date?
        /// A Boolean value that indicates whether your app uses, contains, or incorporates cryptography.
        public let usesEncryption: Bool?

        public init(appEncryptionDeclarationState: AppEncryptionDeclarationState? = nil, availableOnFrenchStore: Bool? = nil, codeValue: String? = nil, containsProprietaryCryptography: Bool? = nil, containsThirdPartyCryptography: Bool? = nil, documentName: String? = nil, documentType: String? = nil, documentUrl: String? = nil, exempt: Bool? = nil, platform: Platform? = nil, uploadedDate: Date? = nil, usesEncryption: Bool? = nil) {
            self.appEncryptionDeclarationState = appEncryptionDeclarationState
            self.availableOnFrenchStore = availableOnFrenchStore
            self.codeValue = codeValue
            self.containsProprietaryCryptography = containsProprietaryCryptography
            self.containsThirdPartyCryptography = containsThirdPartyCryptography
            self.documentName = documentName
            self.documentType = documentType
            self.documentUrl = documentUrl
            self.exempt = exempt
            self.platform = platform
            self.uploadedDate = uploadedDate
            self.usesEncryption = usesEncryption
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships>
     */
    public struct Relationships: Codable {
        public let app: App?

        public init(app: App? = nil) {
            self.app = app
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships/app>
         */
        public struct App: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships/app/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "apps" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appencryptiondeclaration/relationships/app/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
