import Bagbutik_Core
import Foundation

/**
 # AppPreviewSetsResponse
 A response that contains a list of App Preview Set resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetsresponse>
 */
public struct AppPreviewSetsResponse: Codable, PagedResponse {
    public typealias Data = AppPreviewSet

    public let data: [AppPreviewSet]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppPreviewSet],
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([AppPreviewSet].self, forKey: .data)
        included = try container.decodeIfPresent([Included].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }

    public func getAppCustomProductPageLocalization(for appPreviewSet: AppPreviewSet) -> AppCustomProductPageLocalization? {
        included?.compactMap { relationship -> AppCustomProductPageLocalization? in
            guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
            return appCustomProductPageLocalization
        }.first { $0.id == appPreviewSet.relationships?.appCustomProductPageLocalization?.data?.id }
    }

    public func getAppPreviews(for appPreviewSet: AppPreviewSet) -> [AppPreview] {
        guard let appPreviewIds = appPreviewSet.relationships?.appPreviews?.data?.map(\.id),
              let appPreviews = included?.compactMap({ relationship -> AppPreview? in
                  guard case let .appPreview(appPreview) = relationship else { return nil }
                  return appPreviewIds.contains(appPreview.id) ? appPreview : nil
              })
        else {
            return []
        }
        return appPreviews
    }

    public func getAppStoreVersionExperimentTreatmentLocalization(for appPreviewSet: AppPreviewSet) -> AppStoreVersionExperimentTreatmentLocalization? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatmentLocalization? in
            guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
            return appStoreVersionExperimentTreatmentLocalization
        }.first { $0.id == appPreviewSet.relationships?.appStoreVersionExperimentTreatmentLocalization?.data?.id }
    }

    public func getAppStoreVersionLocalization(for appPreviewSet: AppPreviewSet) -> AppStoreVersionLocalization? {
        included?.compactMap { relationship -> AppStoreVersionLocalization? in
            guard case let .appStoreVersionLocalization(appStoreVersionLocalization) = relationship else { return nil }
            return appStoreVersionLocalization
        }.first { $0.id == appPreviewSet.relationships?.appStoreVersionLocalization?.data?.id }
    }

    public enum Included: Codable {
        case appCustomProductPageLocalization(AppCustomProductPageLocalization)
        case appPreview(AppPreview)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)
        case appStoreVersionLocalization(AppStoreVersionLocalization)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPageLocalization = try? AppCustomProductPageLocalization(from: decoder) {
                self = .appCustomProductPageLocalization(appCustomProductPageLocalization)
            } else if let appPreview = try? AppPreview(from: decoder) {
                self = .appPreview(appPreview)
            } else if let appStoreVersionExperimentTreatmentLocalization = try? AppStoreVersionExperimentTreatmentLocalization(from: decoder) {
                self = .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization)
            } else if let appStoreVersionLocalization = try? AppStoreVersionLocalization(from: decoder) {
                self = .appStoreVersionLocalization(appStoreVersionLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPageLocalization(value):
                try value.encode(to: encoder)
            case let .appPreview(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatmentLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersionLocalization(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
