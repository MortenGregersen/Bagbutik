import Bagbutik_Core
import Foundation

/**
 # AppStoreVersion
 The data structure that represent an App Store Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion>
 */
public struct AppStoreVersion: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreVersions" }
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

    /**
     # AppStoreVersion.Attributes
     Attributes that describe an App Store Versions resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/attributes>
     */
    public struct Attributes: Codable, Sendable {
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var appStoreState: AppStoreVersionState? = nil
        public var appVersionState: AppVersionState?
        public var copyright: String?
        public var createdDate: Date?
        public var downloadable: Bool?
        public var earliestReleaseDate: Date?
        public var platform: Platform?
        public var releaseType: ReleaseType?
        public var reviewType: ReviewType?
        public var versionString: String?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(appStoreState: AppStoreVersionState? = nil,
                    appVersionState: AppVersionState? = nil,
                    copyright: String? = nil,
                    createdDate: Date? = nil,
                    downloadable: Bool? = nil,
                    earliestReleaseDate: Date? = nil,
                    platform: Platform? = nil,
                    releaseType: ReleaseType? = nil,
                    reviewType: ReviewType? = nil,
                    versionString: String? = nil)
        {
            self.appStoreState = appStoreState
            self.appVersionState = appVersionState
            self.copyright = copyright
            self.createdDate = createdDate
            self.downloadable = downloadable
            self.earliestReleaseDate = earliestReleaseDate
            self.platform = platform
            self.releaseType = releaseType
            self.reviewType = reviewType
            self.versionString = versionString
        }

        public init(appVersionState: AppVersionState? = nil,
                    copyright: String? = nil,
                    createdDate: Date? = nil,
                    downloadable: Bool? = nil,
                    earliestReleaseDate: Date? = nil,
                    platform: Platform? = nil,
                    releaseType: ReleaseType? = nil,
                    reviewType: ReviewType? = nil,
                    versionString: String? = nil)
        {
            self.appVersionState = appVersionState
            self.copyright = copyright
            self.createdDate = createdDate
            self.downloadable = downloadable
            self.earliestReleaseDate = earliestReleaseDate
            self.platform = platform
            self.releaseType = releaseType
            self.reviewType = reviewType
            self.versionString = versionString
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreState = try container.decodeIfPresent(AppStoreVersionState.self, forKey: "appStoreState")
            appVersionState = try container.decodeIfPresent(AppVersionState.self, forKey: "appVersionState")
            copyright = try container.decodeIfPresent(String.self, forKey: "copyright")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            downloadable = try container.decodeIfPresent(Bool.self, forKey: "downloadable")
            earliestReleaseDate = try container.decodeIfPresent(Date.self, forKey: "earliestReleaseDate")
            platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
            releaseType = try container.decodeIfPresent(ReleaseType.self, forKey: "releaseType")
            reviewType = try container.decodeIfPresent(ReviewType.self, forKey: "reviewType")
            versionString = try container.decodeIfPresent(String.self, forKey: "versionString")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreState, forKey: "appStoreState")
            try container.encodeIfPresent(appVersionState, forKey: "appVersionState")
            try container.encodeIfPresent(copyright, forKey: "copyright")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(downloadable, forKey: "downloadable")
            try container.encodeIfPresent(earliestReleaseDate, forKey: "earliestReleaseDate")
            try container.encodeIfPresent(platform, forKey: "platform")
            try container.encodeIfPresent(releaseType, forKey: "releaseType")
            try container.encodeIfPresent(reviewType, forKey: "reviewType")
            try container.encodeIfPresent(versionString, forKey: "versionString")
        }

        public enum ReleaseType: String, Sendable, Codable, CaseIterable {
            case afterApproval = "AFTER_APPROVAL"
            case manual = "MANUAL"
            case scheduled = "SCHEDULED"
        }

        public enum ReviewType: String, Sendable, Codable, CaseIterable {
            case appStore = "APP_STORE"
            case notarization = "NOTARIZATION"
        }
    }

    /**
     # AppStoreVersion.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships>
     */
    public struct Relationships: Codable, Sendable {
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var ageRatingDeclaration: AgeRatingDeclaration? = nil
        public var alternativeDistributionPackage: AlternativeDistributionPackage?
        public var app: App?
        /// The related Default App Clip Experiences resource.
        public var appClipDefaultExperience: AppClipDefaultExperience?
        public var appStoreReviewDetail: AppStoreReviewDetail?
        public var appStoreVersionExperiments: AppStoreVersionExperiments?
        public var appStoreVersionExperimentsV2: AppStoreVersionExperimentsV2?
        public var appStoreVersionLocalizations: AppStoreVersionLocalizations?
        public var appStoreVersionPhasedRelease: AppStoreVersionPhasedRelease?
        public var appStoreVersionSubmission: AppStoreVersionSubmission?
        public var build: Build?
        public var routingAppCoverage: RoutingAppCoverage?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(ageRatingDeclaration: AgeRatingDeclaration? = nil,
                    alternativeDistributionPackage: AlternativeDistributionPackage? = nil,
                    app: App? = nil,
                    appClipDefaultExperience: AppClipDefaultExperience? = nil,
                    appStoreReviewDetail: AppStoreReviewDetail? = nil,
                    appStoreVersionExperiments: AppStoreVersionExperiments? = nil,
                    appStoreVersionExperimentsV2: AppStoreVersionExperimentsV2? = nil,
                    appStoreVersionLocalizations: AppStoreVersionLocalizations? = nil,
                    appStoreVersionPhasedRelease: AppStoreVersionPhasedRelease? = nil,
                    appStoreVersionSubmission: AppStoreVersionSubmission? = nil,
                    build: Build? = nil,
                    routingAppCoverage: RoutingAppCoverage? = nil)
        {
            self.ageRatingDeclaration = ageRatingDeclaration
            self.alternativeDistributionPackage = alternativeDistributionPackage
            self.app = app
            self.appClipDefaultExperience = appClipDefaultExperience
            self.appStoreReviewDetail = appStoreReviewDetail
            self.appStoreVersionExperiments = appStoreVersionExperiments
            self.appStoreVersionExperimentsV2 = appStoreVersionExperimentsV2
            self.appStoreVersionLocalizations = appStoreVersionLocalizations
            self.appStoreVersionPhasedRelease = appStoreVersionPhasedRelease
            self.appStoreVersionSubmission = appStoreVersionSubmission
            self.build = build
            self.routingAppCoverage = routingAppCoverage
        }

        public init(alternativeDistributionPackage: AlternativeDistributionPackage? = nil,
                    app: App? = nil,
                    appClipDefaultExperience: AppClipDefaultExperience? = nil,
                    appStoreReviewDetail: AppStoreReviewDetail? = nil,
                    appStoreVersionExperiments: AppStoreVersionExperiments? = nil,
                    appStoreVersionExperimentsV2: AppStoreVersionExperimentsV2? = nil,
                    appStoreVersionLocalizations: AppStoreVersionLocalizations? = nil,
                    appStoreVersionPhasedRelease: AppStoreVersionPhasedRelease? = nil,
                    appStoreVersionSubmission: AppStoreVersionSubmission? = nil,
                    build: Build? = nil,
                    routingAppCoverage: RoutingAppCoverage? = nil)
        {
            self.alternativeDistributionPackage = alternativeDistributionPackage
            self.app = app
            self.appClipDefaultExperience = appClipDefaultExperience
            self.appStoreReviewDetail = appStoreReviewDetail
            self.appStoreVersionExperiments = appStoreVersionExperiments
            self.appStoreVersionExperimentsV2 = appStoreVersionExperimentsV2
            self.appStoreVersionLocalizations = appStoreVersionLocalizations
            self.appStoreVersionPhasedRelease = appStoreVersionPhasedRelease
            self.appStoreVersionSubmission = appStoreVersionSubmission
            self.build = build
            self.routingAppCoverage = routingAppCoverage
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            ageRatingDeclaration = try container.decodeIfPresent(AgeRatingDeclaration.self, forKey: "ageRatingDeclaration")
            alternativeDistributionPackage = try container.decodeIfPresent(AlternativeDistributionPackage.self, forKey: "alternativeDistributionPackage")
            app = try container.decodeIfPresent(App.self, forKey: "app")
            appClipDefaultExperience = try container.decodeIfPresent(AppClipDefaultExperience.self, forKey: "appClipDefaultExperience")
            appStoreReviewDetail = try container.decodeIfPresent(AppStoreReviewDetail.self, forKey: "appStoreReviewDetail")
            appStoreVersionExperiments = try container.decodeIfPresent(AppStoreVersionExperiments.self, forKey: "appStoreVersionExperiments")
            appStoreVersionExperimentsV2 = try container.decodeIfPresent(AppStoreVersionExperimentsV2.self, forKey: "appStoreVersionExperimentsV2")
            appStoreVersionLocalizations = try container.decodeIfPresent(AppStoreVersionLocalizations.self, forKey: "appStoreVersionLocalizations")
            appStoreVersionPhasedRelease = try container.decodeIfPresent(AppStoreVersionPhasedRelease.self, forKey: "appStoreVersionPhasedRelease")
            appStoreVersionSubmission = try container.decodeIfPresent(AppStoreVersionSubmission.self, forKey: "appStoreVersionSubmission")
            build = try container.decodeIfPresent(Build.self, forKey: "build")
            routingAppCoverage = try container.decodeIfPresent(RoutingAppCoverage.self, forKey: "routingAppCoverage")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(ageRatingDeclaration, forKey: "ageRatingDeclaration")
            try container.encodeIfPresent(alternativeDistributionPackage, forKey: "alternativeDistributionPackage")
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(appClipDefaultExperience, forKey: "appClipDefaultExperience")
            try container.encodeIfPresent(appStoreReviewDetail, forKey: "appStoreReviewDetail")
            try container.encodeIfPresent(appStoreVersionExperiments, forKey: "appStoreVersionExperiments")
            try container.encodeIfPresent(appStoreVersionExperimentsV2, forKey: "appStoreVersionExperimentsV2")
            try container.encodeIfPresent(appStoreVersionLocalizations, forKey: "appStoreVersionLocalizations")
            try container.encodeIfPresent(appStoreVersionPhasedRelease, forKey: "appStoreVersionPhasedRelease")
            try container.encodeIfPresent(appStoreVersionSubmission, forKey: "appStoreVersionSubmission")
            try container.encodeIfPresent(build, forKey: "build")
            try container.encodeIfPresent(routingAppCoverage, forKey: "routingAppCoverage")
        }

        /**
         # AppStoreVersion.Relationships.AgeRatingDeclaration
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/ageratingdeclaration>
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
             # AppStoreVersion.Relationships.AgeRatingDeclaration.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/ageratingdeclaration/data>
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
             # AppStoreVersion.Relationships.AgeRatingDeclaration.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/ageratingdeclaration/links>
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

        public struct AlternativeDistributionPackage: Codable, Sendable {
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

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "alternativeDistributionPackages" }

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
         # AppStoreVersion.Relationships.App
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/app>
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
             # AppStoreVersion.Relationships.App.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/app/data>
             */
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

            /**
             # AppStoreVersion.Relationships.App.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/app/links>
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
         # AppStoreVersion.Relationships.AppClipDefaultExperience
         The data and links that describe the relationship between the App Store Versions and the Default App Clip Experiences resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appclipdefaultexperience>
         */
        public struct AppClipDefaultExperience: Codable, Sendable {
            /// The ID and type of the related Default App Clip Experiences resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
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
             # AppStoreVersion.Relationships.AppClipDefaultExperience.Data
             The type and ID of a related Default App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appclipdefaultexperience/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Default App Clip Experiences resource.
                public let id: String
                /// The resource type.
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

            /**
             # AppStoreVersion.Relationships.AppClipDefaultExperience.Links
             The links to the related Default App Clip Experiences resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appclipdefaultexperience/links>
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
         # AppStoreVersion.Relationships.AppStoreReviewDetail
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstorereviewdetail>
         */
        public struct AppStoreReviewDetail: Codable, Sendable {
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
             # AppStoreVersion.Relationships.AppStoreReviewDetail.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstorereviewdetail/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreReviewDetails" }

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
             # AppStoreVersion.Relationships.AppStoreReviewDetail.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstorereviewdetail/links>
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

        public struct AppStoreVersionExperiments: Codable, Sendable {
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

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersionExperiments" }

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

        public struct AppStoreVersionExperimentsV2: Codable, Sendable {
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

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersionExperiments" }

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
         # AppStoreVersion.Relationships.AppStoreVersionLocalizations
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionlocalizations>
         */
        public struct AppStoreVersionLocalizations: Codable, Sendable {
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
             # AppStoreVersion.Relationships.AppStoreVersionLocalizations.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionlocalizations/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersionLocalizations" }

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
             # AppStoreVersion.Relationships.AppStoreVersionLocalizations.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionlocalizations/links>
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
         # AppStoreVersion.Relationships.AppStoreVersionPhasedRelease
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionphasedrelease>
         */
        public struct AppStoreVersionPhasedRelease: Codable, Sendable {
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
             # AppStoreVersion.Relationships.AppStoreVersionPhasedRelease.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionphasedrelease/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersionPhasedReleases" }

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
             # AppStoreVersion.Relationships.AppStoreVersionPhasedRelease.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionphasedrelease/links>
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
         # AppStoreVersion.Relationships.AppStoreVersionSubmission
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionsubmission>
         */
        public struct AppStoreVersionSubmission: Codable, Sendable {
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
             # AppStoreVersion.Relationships.AppStoreVersionSubmission.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionsubmission/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appStoreVersionSubmissions" }

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
             # AppStoreVersion.Relationships.AppStoreVersionSubmission.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/appstoreversionsubmission/links>
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
         # AppStoreVersion.Relationships.Build
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/build>
         */
        public struct Build: Codable, Sendable {
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
             # AppStoreVersion.Relationships.Build.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/build/data>
             */
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

            /**
             # AppStoreVersion.Relationships.Build.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/build/links>
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
         # AppStoreVersion.Relationships.RoutingAppCoverage
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/routingappcoverage>
         */
        public struct RoutingAppCoverage: Codable, Sendable {
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
             # AppStoreVersion.Relationships.RoutingAppCoverage.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/routingappcoverage/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "routingAppCoverages" }

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
             # AppStoreVersion.Relationships.RoutingAppCoverage.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversion/relationships/routingappcoverage/links>
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
    }
}
