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

    public struct Attributes: Codable, Sendable {
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var appStoreAgeRating: AppStoreAgeRating? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var appStoreState: AppStoreVersionState? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var australiaAgeRating: AustraliaAgeRating? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var brazilAgeRating: BrazilAgeRating? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var brazilAgeRatingV2: BrazilAgeRatingV2? = nil
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var franceAgeRating: FranceAgeRating? = nil
        public var kidsAgeBand: KidsAgeBand?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var koreaAgeRating: KoreaAgeRating? = nil
        public var state: State?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(appStoreAgeRating: AppStoreAgeRating? = nil,
                    appStoreState: AppStoreVersionState? = nil,
                    australiaAgeRating: AustraliaAgeRating? = nil,
                    brazilAgeRating: BrazilAgeRating? = nil,
                    brazilAgeRatingV2: BrazilAgeRatingV2? = nil,
                    franceAgeRating: FranceAgeRating? = nil,
                    kidsAgeBand: KidsAgeBand? = nil,
                    koreaAgeRating: KoreaAgeRating? = nil,
                    state: State? = nil)
        {
            self.appStoreAgeRating = appStoreAgeRating
            self.appStoreState = appStoreState
            self.australiaAgeRating = australiaAgeRating
            self.brazilAgeRating = brazilAgeRating
            self.brazilAgeRatingV2 = brazilAgeRatingV2
            self.franceAgeRating = franceAgeRating
            self.kidsAgeBand = kidsAgeBand
            self.koreaAgeRating = koreaAgeRating
            self.state = state
        }

        public init(kidsAgeBand: KidsAgeBand? = nil,
                    state: State? = nil)
        {
            self.kidsAgeBand = kidsAgeBand
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreAgeRating = try container.decodeIfPresent(AppStoreAgeRating.self, forKey: "appStoreAgeRating")
            appStoreState = try container.decodeIfPresent(AppStoreVersionState.self, forKey: "appStoreState")
            australiaAgeRating = try container.decodeIfPresent(AustraliaAgeRating.self, forKey: "australiaAgeRating")
            brazilAgeRating = try container.decodeIfPresent(BrazilAgeRating.self, forKey: "brazilAgeRating")
            brazilAgeRatingV2 = try container.decodeIfPresent(BrazilAgeRatingV2.self, forKey: "brazilAgeRatingV2")
            franceAgeRating = try container.decodeIfPresent(FranceAgeRating.self, forKey: "franceAgeRating")
            kidsAgeBand = try container.decodeIfPresent(KidsAgeBand.self, forKey: "kidsAgeBand")
            koreaAgeRating = try container.decodeIfPresent(KoreaAgeRating.self, forKey: "koreaAgeRating")
            state = try container.decodeIfPresent(State.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreAgeRating, forKey: "appStoreAgeRating")
            try container.encodeIfPresent(appStoreState, forKey: "appStoreState")
            try container.encodeIfPresent(australiaAgeRating, forKey: "australiaAgeRating")
            try container.encodeIfPresent(brazilAgeRating, forKey: "brazilAgeRating")
            try container.encodeIfPresent(brazilAgeRatingV2, forKey: "brazilAgeRatingV2")
            try container.encodeIfPresent(franceAgeRating, forKey: "franceAgeRating")
            try container.encodeIfPresent(kidsAgeBand, forKey: "kidsAgeBand")
            try container.encodeIfPresent(koreaAgeRating, forKey: "koreaAgeRating")
            try container.encodeIfPresent(state, forKey: "state")
        }

        public enum AustraliaAgeRating: String, Sendable, Codable, CaseIterable {
            case eighteen = "EIGHTEEN"
            case fifteen = "FIFTEEN"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AustraliaAgeRating(rawValue: string) {
                    self = value
                } else if let value = AustraliaAgeRating(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AustraliaAgeRating value: \(string)"
                    )
                }
            }
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BrazilAgeRatingV2(rawValue: string) {
                    self = value
                } else if let value = BrazilAgeRatingV2(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BrazilAgeRatingV2 value: \(string)"
                    )
                }
            }
        }

        public enum FranceAgeRating: String, Sendable, Codable, CaseIterable {
            case eighteen = "EIGHTEEN"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = FranceAgeRating(rawValue: string) {
                    self = value
                } else if let value = FranceAgeRating(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid FranceAgeRating value: \(string)"
                    )
                }
            }
        }

        public enum KoreaAgeRating: String, Sendable, Codable, CaseIterable {
            case all = "ALL"
            case fifteen = "FIFTEEN"
            case nineteen = "NINETEEN"
            case notApplicable = "NOT_APPLICABLE"
            case twelve = "TWELVE"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = KoreaAgeRating(rawValue: string) {
                    self = value
                } else if let value = KoreaAgeRating(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid KoreaAgeRating value: \(string)"
                    )
                }
            }
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = State(rawValue: string) {
                    self = value
                } else if let value = State(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid State value: \(string)"
                    )
                }
            }
        }
    }

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

        public struct AgeRatingDeclaration: Codable, Sendable {
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
        }

        public struct App: Codable, Sendable {
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

        public struct AppInfoLocalizations: Codable, Sendable {
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
        }

        public struct PrimaryCategory: Codable, Sendable {
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
        }

        public struct PrimarySubcategoryOne: Codable, Sendable {
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
        }

        public struct PrimarySubcategoryTwo: Codable, Sendable {
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
        }

        public struct SecondaryCategory: Codable, Sendable {
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
        }

        public struct SecondarySubcategoryOne: Codable, Sendable {
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
        }

        public struct SecondarySubcategoryTwo: Codable, Sendable {
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
        }
    }
}
