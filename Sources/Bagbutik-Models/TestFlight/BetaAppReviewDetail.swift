import Bagbutik_Core
import Foundation

/**
 # BetaAppReviewDetail
 The data structure that represents a Beta App Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetail>
 */
public struct BetaAppReviewDetail: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaAppReviewDetails" }
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # BetaAppReviewDetail.Attributes
     Attributes that describe a Beta App Review Details resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetail/attributes>
     */
    public struct Attributes: Codable {
        /// Email address of contact in case communication is needed with the beta app review.
        public var contactEmail: String?
        /// First name of contact in case communication is needed with the beta app review.
        public var contactFirstName: String?
        /// Last name of contact in case communication is needed with the beta app review.
        public var contactLastName: String?
        /// Phone number of contact in case communication is needed with the beta app review.
        public var contactPhone: String?
        /// The user name to sign in to your app to review its features.
        public var demoAccountName: String?
        /// The password to sign in to your app to review its features.
        public var demoAccountPassword: String?
        /// A Boolean value that indicates if sign-in information is required to review all the features of your app. If users sign in using social media, provide information for an account for review. Credentials must be valid and active for duration of review.
        public var demoAccountRequired: Bool?
        /// Additional information about your app that can help during the review process. Do not include demo account details. Review notes have a maximum of 4,000 characters.
        public var notes: String?

        public init(contactEmail: String? = nil,
                    contactFirstName: String? = nil,
                    contactLastName: String? = nil,
                    contactPhone: String? = nil,
                    demoAccountName: String? = nil,
                    demoAccountPassword: String? = nil,
                    demoAccountRequired: Bool? = nil,
                    notes: String? = nil)
        {
            self.contactEmail = contactEmail
            self.contactFirstName = contactFirstName
            self.contactLastName = contactLastName
            self.contactPhone = contactPhone
            self.demoAccountName = demoAccountName
            self.demoAccountPassword = demoAccountPassword
            self.demoAccountRequired = demoAccountRequired
            self.notes = notes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            contactEmail = try container.decodeIfPresent(String.self, forKey: .contactEmail)
            contactFirstName = try container.decodeIfPresent(String.self, forKey: .contactFirstName)
            contactLastName = try container.decodeIfPresent(String.self, forKey: .contactLastName)
            contactPhone = try container.decodeIfPresent(String.self, forKey: .contactPhone)
            demoAccountName = try container.decodeIfPresent(String.self, forKey: .demoAccountName)
            demoAccountPassword = try container.decodeIfPresent(String.self, forKey: .demoAccountPassword)
            demoAccountRequired = try container.decodeIfPresent(Bool.self, forKey: .demoAccountRequired)
            notes = try container.decodeIfPresent(String.self, forKey: .notes)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(contactEmail, forKey: .contactEmail)
            try container.encodeIfPresent(contactFirstName, forKey: .contactFirstName)
            try container.encodeIfPresent(contactLastName, forKey: .contactLastName)
            try container.encodeIfPresent(contactPhone, forKey: .contactPhone)
            try container.encodeIfPresent(demoAccountName, forKey: .demoAccountName)
            try container.encodeIfPresent(demoAccountPassword, forKey: .demoAccountPassword)
            try container.encodeIfPresent(demoAccountRequired, forKey: .demoAccountRequired)
            try container.encodeIfPresent(notes, forKey: .notes)
        }

        private enum CodingKeys: String, CodingKey {
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes
        }
    }

    /**
     # BetaAppReviewDetail.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetail/relationships>
     */
    public struct Relationships: Codable {
        public var app: App?

        public init(app: App? = nil) {
            self.app = app
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            app = try container.decodeIfPresent(App.self, forKey: .app)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(app, forKey: .app)
        }

        private enum CodingKeys: String, CodingKey {
            case app
        }

        /**
         # BetaAppReviewDetail.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetail/relationships/app>
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # BetaAppReviewDetail.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetail/relationships/app/data>
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

            /**
             # BetaAppReviewDetail.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetail/relationships/app/links>
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
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
