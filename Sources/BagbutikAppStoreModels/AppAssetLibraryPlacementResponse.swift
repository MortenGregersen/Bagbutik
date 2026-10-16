import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementResponse

 The response body for endpoints that create, read, or modify an app asset library placement.

 ```
 object AppAssetLibraryPlacementResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementresponse>
 */
public struct AppAssetLibraryPlacementResponse: Codable, Sendable {
    public let data: AppAssetLibraryPlacement
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppAssetLibraryPlacement,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppAssetLibraryPlacement.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppCustomProductPageLocalization() -> AppCustomProductPageLocalization? {
        included?.compactMap { relationship -> AppCustomProductPageLocalization? in
            guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
            return appCustomProductPageLocalization
        }.first { $0.id == data.relationships?.appCustomProductPageLocalization?.data?.id }
    }

    public func getAppEventLocalization() -> AppEventLocalization? {
        included?.compactMap { relationship -> AppEventLocalization? in
            guard case let .appEventLocalization(appEventLocalization) = relationship else { return nil }
            return appEventLocalization
        }.first { $0.id == data.relationships?.appEventLocalization?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatmentLocalization() -> AppStoreVersionExperimentTreatmentLocalization? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatmentLocalization? in
            guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
            return appStoreVersionExperimentTreatmentLocalization
        }.first { $0.id == data.relationships?.appStoreVersionExperimentTreatmentLocalization?.data?.id }
    }

    public func getAppStoreVersionLocalization() -> AppStoreVersionLocalization? {
        included?.compactMap { relationship -> AppStoreVersionLocalization? in
            guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
            return appStoreVersionLocalization
        }.first { $0.id == data.relationships?.appStoreVersionLocalization?.data?.id }
    }

    public func getImage() -> AppAssetLibraryImage? {
        included?.compactMap { relationship -> AppAssetLibraryImage? in
            guard case let .appAssetLibraryImage(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getVideo() -> AppAssetLibraryVideo? {
        included?.compactMap { relationship -> AppAssetLibraryVideo? in
            guard case let .appAssetLibraryVideo(video) = relationship else { return nil }
            return video
        }.first { $0.id == data.relationships?.video?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appAssetLibraryImage(AppAssetLibraryImage)
        case appAssetLibraryVideo(AppAssetLibraryVideo)
        case appCustomProductPageLocalization(AppCustomProductPageLocalization)
        case appEventLocalization(AppEventLocalization)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)
        case appStoreVersionLocalization(AppStoreVersionLocalization)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appAssetLibraryImages":
                self = .appAssetLibraryImage(try AppAssetLibraryImage(from: decoder))
            case "appAssetLibraryVideos":
                self = .appAssetLibraryVideo(try AppAssetLibraryVideo(from: decoder))
            case "appCustomProductPageLocalizations":
                self = .appCustomProductPageLocalization(try AppCustomProductPageLocalization(from: decoder))
            case "appEventLocalizations":
                self = .appEventLocalization(try AppEventLocalization(from: decoder))
            case "appStoreVersionExperimentTreatmentLocalizations":
                self = .appStoreVersionExperimentTreatmentLocalization(try AppStoreVersionExperimentTreatmentLocalization(from: decoder))
            case "appStoreVersionLocalizations":
                self = .appStoreVersionLocalization(try AppStoreVersionLocalization(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appAssetLibraryImage(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideo(value):
                try value.encode(to: encoder)
            case let .appCustomProductPageLocalization(value):
                try value.encode(to: encoder)
            case let .appEventLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatmentLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersionLocalization(value):
                try value.encode(to: encoder)
            }
        }
    }
}
