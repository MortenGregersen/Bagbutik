import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementsResponse

 The response body for endpoints that list app asset library placements.

 ```
 object AppAssetLibraryPlacementsResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementsresponse>
 */
public struct AppAssetLibraryPlacementsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppAssetLibraryPlacement

    public let data: [AppAssetLibraryPlacement]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppAssetLibraryPlacement],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AppAssetLibraryPlacement].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getAppCustomProductPageLocalization(for appAssetLibraryPlacement: AppAssetLibraryPlacement) -> AppCustomProductPageLocalization? {
        included?.compactMap { relationship -> AppCustomProductPageLocalization? in
            guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
            return appCustomProductPageLocalization
        }.first { $0.id == appAssetLibraryPlacement.relationships?.appCustomProductPageLocalization?.data?.id }
    }

    public func getAppEventLocalization(for appAssetLibraryPlacement: AppAssetLibraryPlacement) -> AppEventLocalization? {
        included?.compactMap { relationship -> AppEventLocalization? in
            guard case let .appEventLocalization(appEventLocalization) = relationship else { return nil }
            return appEventLocalization
        }.first { $0.id == appAssetLibraryPlacement.relationships?.appEventLocalization?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatmentLocalization(for appAssetLibraryPlacement: AppAssetLibraryPlacement) -> AppStoreVersionExperimentTreatmentLocalization? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatmentLocalization? in
            guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
            return appStoreVersionExperimentTreatmentLocalization
        }.first { $0.id == appAssetLibraryPlacement.relationships?.appStoreVersionExperimentTreatmentLocalization?.data?.id }
    }

    public func getAppStoreVersionLocalization(for appAssetLibraryPlacement: AppAssetLibraryPlacement) -> AppStoreVersionLocalization? {
        included?.compactMap { relationship -> AppStoreVersionLocalization? in
            guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
            return appStoreVersionLocalization
        }.first { $0.id == appAssetLibraryPlacement.relationships?.appStoreVersionLocalization?.data?.id }
    }

    public func getImage(for appAssetLibraryPlacement: AppAssetLibraryPlacement) -> AppAssetLibraryImage? {
        included?.compactMap { relationship -> AppAssetLibraryImage? in
            guard case let .appAssetLibraryImage(image) = relationship else { return nil }
            return image
        }.first { $0.id == appAssetLibraryPlacement.relationships?.image?.data?.id }
    }

    public func getVideo(for appAssetLibraryPlacement: AppAssetLibraryPlacement) -> AppAssetLibraryVideo? {
        included?.compactMap { relationship -> AppAssetLibraryVideo? in
            guard case let .appAssetLibraryVideo(video) = relationship else { return nil }
            return video
        }.first { $0.id == appAssetLibraryPlacement.relationships?.video?.data?.id }
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
