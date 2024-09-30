import Bagbutik_Core
import Foundation

/**
 # AppInfo
 The data structure that represent an App Infos resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfo>
 */
public struct AppInfo: Codable, Sendable, Identifiable {
    /// An opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appInfos" }
    /// The resource’s attributes.
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
     # AppInfo.Attributes
     Attributes that describe an App Infos resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The app’s age rating as it appears on the App Store for all platforms.
        public var appStoreAgeRating: AppStoreAgeRating?
        /// The state of an app version in the App Store.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var appStoreState: AppStoreVersionState? = nil
        /// The app’s age rating as it appears on the App Store in Brazil for all platforms.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var brazilAgeRating: BrazilAgeRating? = nil
        public var brazilAgeRatingV2: BrazilAgeRatingV2?
        /// A Made for Kids app’s age band.
        public var kidsAgeBand: KidsAgeBand?
        public var state: State?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(appStoreAgeRating: AppStoreAgeRating? = nil,
                    appStoreState: AppStoreVersionState? = nil,
                    brazilAgeRating: BrazilAgeRating? = nil,
                    brazilAgeRatingV2: BrazilAgeRatingV2? = nil,
                    kidsAgeBand: KidsAgeBand? = nil,
                    state: State? = nil)
        {
            self.appStoreAgeRating = appStoreAgeRating
            self.appStoreState = appStoreState
            self.brazilAgeRating = brazilAgeRating
            self.brazilAgeRatingV2 = brazilAgeRatingV2
            self.kidsAgeBand = kidsAgeBand
            self.state = state
        }

        public init(appStoreAgeRating: AppStoreAgeRating? = nil,
                    brazilAgeRatingV2: BrazilAgeRatingV2? = nil,
                    kidsAgeBand: KidsAgeBand? = nil,
                    state: State? = nil)
        {
            self.appStoreAgeRating = appStoreAgeRating
            self.brazilAgeRatingV2 = brazilAgeRatingV2
            self.kidsAgeBand = kidsAgeBand
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreAgeRating = try container.decodeIfPresent(AppStoreAgeRating.self, forKey: "appStoreAgeRating")
            appStoreState = try container.decodeIfPresent(AppStoreVersionState.self, forKey: "appStoreState")
            brazilAgeRating = try container.decodeIfPresent(BrazilAgeRating.self, forKey: "brazilAgeRating")
            brazilAgeRatingV2 = try container.decodeIfPresent(BrazilAgeRatingV2.self, forKey: "brazilAgeRatingV2")
            kidsAgeBand = try container.decodeIfPresent(KidsAgeBand.self, forKey: "kidsAgeBand")
            state = try container.decodeIfPresent(State.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreAgeRating, forKey: "appStoreAgeRating")
            try container.encodeIfPresent(appStoreState, forKey: "appStoreState")
            try container.encodeIfPresent(brazilAgeRating, forKey: "brazilAgeRating")
            try container.encodeIfPresent(brazilAgeRatingV2, forKey: "brazilAgeRatingV2")
            try container.encodeIfPresent(kidsAgeBand, forKey: "kidsAgeBand")
            try container.encodeIfPresent(state, forKey: "state")
        }

        public enum BrazilAgeRatingV2: String, Sendable, Codable, CaseIterable {
            case officialEighteen = "OFFICIAL_EIGHTEEN"
            case officialFourteen = "OFFICIAL_FOURTEEN"
            case officialL = "OFFICIAL_L"
            case officialSixteen = "OFFICIAL_SIXTEEN"
            case officialTen = "OFFICIAL_TEN"
            case officialTwelve = "OFFICIAL_TWELVE"
            case selfRatedEighteen = "SELF_RATED_EIGHTEEN"
            case selfRatedFourteen = "SELF_RATED_FOURTEEN"
            case selfRatedL = "SELF_RATED_L"
            case selfRatedSixteen = "SELF_RATED_SIXTEEN"
            case selfRatedTen = "SELF_RATED_TEN"
            case selfRatedTwelve = "SELF_RATED_TWELVE"
        }

        public enum State: String, Sendable, Codable, CaseIterable {
            case accepted = "ACCEPTED"
            case developerRejected = "DEVELOPER_REJECTED"
            case inReview = "IN_REVIEW"
            case pendingRelease = "PENDING_RELEASE"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case readyForDistribution = "READY_FOR_DISTRIBUTION"
            case readyForReview = "READY_FOR_REVIEW"
            case rejected = "REJECTED"
            case replacedWithNewInfo = "REPLACED_WITH_NEW_INFO"
            case waitingForReview = "WAITING_FOR_REVIEW"
        }
    }

    /**
     # AppInfo.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships>
     */
    public struct Relationships: Codable, Sendable {
        public var ageRatingDeclaration: AgeRatingDeclaration?
        public var app: App?
        public var appInfoLocalizations: AppInfoLocalizations?
        public var primaryCategory: PrimaryCategory?
        public var primarySubcategoryOne: PrimarySubcategoryOne?
        public var primarySubcategoryTwo: PrimarySubcategoryTwo?
        public var secondaryCategory: SecondaryCategory?
        public var secondarySubcategoryOne: SecondarySubcategoryOne?
        public var secondarySubcategoryTwo: SecondarySubcategoryTwo?

        public init(ageRatingDeclaration: AgeRatingDeclaration? = nil,
                    app: App? = nil,
                    appInfoLocalizations: AppInfoLocalizations? = nil,
                    primaryCategory: PrimaryCategory? = nil,
                    primarySubcategoryOne: PrimarySubcategoryOne? = nil,
                    primarySubcategoryTwo: PrimarySubcategoryTwo? = nil,
                    secondaryCategory: SecondaryCategory? = nil,
                    secondarySubcategoryOne: SecondarySubcategoryOne? = nil,
                    secondarySubcategoryTwo: SecondarySubcategoryTwo? = nil)
        {
            self.ageRatingDeclaration = ageRatingDeclaration
            self.app = app
            self.appInfoLocalizations = appInfoLocalizations
            self.primaryCategory = primaryCategory
            self.primarySubcategoryOne = primarySubcategoryOne
            self.primarySubcategoryTwo = primarySubcategoryTwo
            self.secondaryCategory = secondaryCategory
            self.secondarySubcategoryOne = secondarySubcategoryOne
            self.secondarySubcategoryTwo = secondarySubcategoryTwo
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            ageRatingDeclaration = try container.decodeIfPresent(AgeRatingDeclaration.self, forKey: "ageRatingDeclaration")
            app = try container.decodeIfPresent(App.self, forKey: "app")
            appInfoLocalizations = try container.decodeIfPresent(AppInfoLocalizations.self, forKey: "appInfoLocalizations")
            primaryCategory = try container.decodeIfPresent(PrimaryCategory.self, forKey: "primaryCategory")
            primarySubcategoryOne = try container.decodeIfPresent(PrimarySubcategoryOne.self, forKey: "primarySubcategoryOne")
            primarySubcategoryTwo = try container.decodeIfPresent(PrimarySubcategoryTwo.self, forKey: "primarySubcategoryTwo")
            secondaryCategory = try container.decodeIfPresent(SecondaryCategory.self, forKey: "secondaryCategory")
            secondarySubcategoryOne = try container.decodeIfPresent(SecondarySubcategoryOne.self, forKey: "secondarySubcategoryOne")
            secondarySubcategoryTwo = try container.decodeIfPresent(SecondarySubcategoryTwo.self, forKey: "secondarySubcategoryTwo")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(ageRatingDeclaration, forKey: "ageRatingDeclaration")
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(appInfoLocalizations, forKey: "appInfoLocalizations")
            try container.encodeIfPresent(primaryCategory, forKey: "primaryCategory")
            try container.encodeIfPresent(primarySubcategoryOne, forKey: "primarySubcategoryOne")
            try container.encodeIfPresent(primarySubcategoryTwo, forKey: "primarySubcategoryTwo")
            try container.encodeIfPresent(secondaryCategory, forKey: "secondaryCategory")
            try container.encodeIfPresent(secondarySubcategoryOne, forKey: "secondarySubcategoryOne")
            try container.encodeIfPresent(secondarySubcategoryTwo, forKey: "secondarySubcategoryTwo")
        }

        /**
         # AppInfo.Relationships.AgeRatingDeclaration
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/ageratingdeclaration>
         */
        public struct AgeRatingDeclaration: Codable, Sendable {
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
             # AppInfo.Relationships.AgeRatingDeclaration.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/ageratingdeclaration/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "ageRatingDeclarations" }

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
             # AppInfo.Relationships.AgeRatingDeclaration.Links
             The links to the related data and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/ageratingdeclaration/links>
             */
            public struct Links: Codable, Sendable {
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

        /**
         # AppInfo.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/app>
         */
        public struct App: Codable, Sendable {
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
             # AppInfo.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/app/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
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
             # AppInfo.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/app/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.AppInfoLocalizations
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/appinfolocalizations>
         */
        public struct AppInfoLocalizations: Codable, Sendable {
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

            /**
             # AppInfo.Relationships.AppInfoLocalizations.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/appinfolocalizations/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appInfoLocalizations" }

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
             # AppInfo.Relationships.AppInfoLocalizations.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/appinfolocalizations/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.PrimaryCategory
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarycategory>
         */
        public struct PrimaryCategory: Codable, Sendable {
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
             # AppInfo.Relationships.PrimaryCategory.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarycategory/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCategories" }

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
             # AppInfo.Relationships.PrimaryCategory.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarycategory/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.PrimarySubcategoryOne
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarysubcategoryone>
         */
        public struct PrimarySubcategoryOne: Codable, Sendable {
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
             # AppInfo.Relationships.PrimarySubcategoryOne.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarysubcategoryone/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCategories" }

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
             # AppInfo.Relationships.PrimarySubcategoryOne.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarysubcategoryone/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.PrimarySubcategoryTwo
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarysubcategorytwo>
         */
        public struct PrimarySubcategoryTwo: Codable, Sendable {
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
             # AppInfo.Relationships.PrimarySubcategoryTwo.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarysubcategorytwo/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCategories" }

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
             # AppInfo.Relationships.PrimarySubcategoryTwo.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/primarysubcategorytwo/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.SecondaryCategory
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarycategory>
         */
        public struct SecondaryCategory: Codable, Sendable {
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
             # AppInfo.Relationships.SecondaryCategory.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarycategory/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCategories" }

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
             # AppInfo.Relationships.SecondaryCategory.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarycategory/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.SecondarySubcategoryOne
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarysubcategoryone>
         */
        public struct SecondarySubcategoryOne: Codable, Sendable {
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
             # AppInfo.Relationships.SecondarySubcategoryOne.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarysubcategoryone/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCategories" }

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
             # AppInfo.Relationships.SecondarySubcategoryOne.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarysubcategoryone/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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

        /**
         # AppInfo.Relationships.SecondarySubcategoryTwo
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarysubcategorytwo>
         */
        public struct SecondarySubcategoryTwo: Codable, Sendable {
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
             # AppInfo.Relationships.SecondarySubcategoryTwo.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarysubcategorytwo/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// An opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appCategories" }

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
             # AppInfo.Relationships.SecondarySubcategoryTwo.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfo/relationships/secondarysubcategorytwo/links>
             */
            public struct Links: Codable, Sendable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
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
