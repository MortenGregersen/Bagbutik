import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementCommonRelationships

 The relationships shared by every app asset library placement to its target localizations.

 ```
 object AppAssetLibraryPlacementCommonRelationships
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryPlacementCommonRelationships.AppEventLocalization`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementCommonRelationships/AppEventLocalization-data.dictionary)

 The in-app event localization on which the app asset library placement appears.

 [`object AppAssetLibraryPlacementCommonRelationships.AppStoreVersionLocalization`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementCommonRelationships/AppStoreVersionLocalization-data.dictionary)

 The App Store version localization on which the app asset library placement appears.

 [`object AppAssetLibraryPlacementCommonRelationships.AppCustomProductPageLocalization`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementCommonRelationships/AppCustomProductPageLocalization-data.dictionary)

 The custom product page localization on which the app asset library placement appears.

 [`object AppAssetLibraryPlacementCommonRelationships.AppStoreVersionExperimentTreatmentLocalization`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementCommonRelationships/AppStoreVersionExperimentTreatmentLocalization-data.dictionary)

 The App Store version experiment treatment localization on which the app asset library placement appears.

 ## Relationships

 ### Inherited By

 [`AppAssetLibraryPlacementVideoRelationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementVideoRelationships)

 [`AppAssetLibraryPlacementImageRelationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementImageRelationships)

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementcommonrelationships>
 */
public struct AppAssetLibraryPlacementCommonRelationships: Codable, Sendable {
    public var appCustomProductPageLocalization: AppCustomProductPageLocalization?
    public var appEventLocalization: AppEventLocalization?
    public var appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization?
    public var appStoreVersionLocalization: AppStoreVersionLocalization?

    public init(appCustomProductPageLocalization: AppCustomProductPageLocalization? = nil,
                appEventLocalization: AppEventLocalization? = nil,
                appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization? = nil,
                appStoreVersionLocalization: AppStoreVersionLocalization? = nil)
    {
        self.appCustomProductPageLocalization = appCustomProductPageLocalization
        self.appEventLocalization = appEventLocalization
        self.appStoreVersionExperimentTreatmentLocalization = appStoreVersionExperimentTreatmentLocalization
        self.appStoreVersionLocalization = appStoreVersionLocalization
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        appCustomProductPageLocalization = try container.decodeIfPresent(AppCustomProductPageLocalization.self, forKey: "appCustomProductPageLocalization")
        appEventLocalization = try container.decodeIfPresent(AppEventLocalization.self, forKey: "appEventLocalization")
        appStoreVersionExperimentTreatmentLocalization = try container.decodeIfPresent(AppStoreVersionExperimentTreatmentLocalization.self, forKey: "appStoreVersionExperimentTreatmentLocalization")
        appStoreVersionLocalization = try container.decodeIfPresent(AppStoreVersionLocalization.self, forKey: "appStoreVersionLocalization")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(appCustomProductPageLocalization, forKey: "appCustomProductPageLocalization")
        try container.encodeIfPresent(appEventLocalization, forKey: "appEventLocalization")
        try container.encodeIfPresent(appStoreVersionExperimentTreatmentLocalization, forKey: "appStoreVersionExperimentTreatmentLocalization")
        try container.encodeIfPresent(appStoreVersionLocalization, forKey: "appStoreVersionLocalization")
    }

    public struct AppCustomProductPageLocalization: Codable, Sendable {
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
            public var type: String { "appCustomProductPageLocalizations" }

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

    public struct AppEventLocalization: Codable, Sendable {
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
            public var type: String { "appEventLocalizations" }

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

    public struct AppStoreVersionExperimentTreatmentLocalization: Codable, Sendable {
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
            public var type: String { "appStoreVersionExperimentTreatmentLocalizations" }

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

    public struct AppStoreVersionLocalization: Codable, Sendable {
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
    }
}
