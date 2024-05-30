import Bagbutik_Core
import Foundation

public struct AppStoreVersionExperimentTreatmentLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = AppStoreVersionExperimentTreatmentLocalization

    public let data: [AppStoreVersionExperimentTreatmentLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionExperimentTreatmentLocalization],
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
        data = try container.decode([AppStoreVersionExperimentTreatmentLocalization].self, forKey: "data")
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

    public func getAppPreviewSets(for appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization) -> [AppPreviewSet] {
        guard let appPreviewSetIds = appStoreVersionExperimentTreatmentLocalization.relationships?.appPreviewSets?.data?.map(\.id),
              let appPreviewSets = included?.compactMap({ relationship -> AppPreviewSet? in
                  guard case let .appPreviewSet(appPreviewSet) = relationship else { return nil }
                  return appPreviewSetIds.contains(appPreviewSet.id) ? appPreviewSet : nil
              })
        else {
            return []
        }
        return appPreviewSets
    }

    public func getAppScreenshotSets(for appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization) -> [AppScreenshotSet] {
        guard let appScreenshotSetIds = appStoreVersionExperimentTreatmentLocalization.relationships?.appScreenshotSets?.data?.map(\.id),
              let appScreenshotSets = included?.compactMap({ relationship -> AppScreenshotSet? in
                  guard case let .appScreenshotSet(appScreenshotSet) = relationship else { return nil }
                  return appScreenshotSetIds.contains(appScreenshotSet.id) ? appScreenshotSet : nil
              })
        else {
            return []
        }
        return appScreenshotSets
    }

    public func getAppStoreVersionExperimentTreatment(for appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization) -> AppStoreVersionExperimentTreatment? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatment? in
            guard case let .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment) = relationship else { return nil }
            return appStoreVersionExperimentTreatment
        }.first { $0.id == appStoreVersionExperimentTreatmentLocalization.relationships?.appStoreVersionExperimentTreatment?.data?.id }
    }

    public enum Included: Codable {
        case appPreviewSet(AppPreviewSet)
        case appScreenshotSet(AppScreenshotSet)
        case appStoreVersionExperimentTreatment(AppStoreVersionExperimentTreatment)

        public init(from decoder: Decoder) throws {
            if let appPreviewSet = try? AppPreviewSet(from: decoder) {
                self = .appPreviewSet(appPreviewSet)
            } else if let appScreenshotSet = try? AppScreenshotSet(from: decoder) {
                self = .appScreenshotSet(appScreenshotSet)
            } else if let appStoreVersionExperimentTreatment = try? AppStoreVersionExperimentTreatment(from: decoder) {
                self = .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appPreviewSet(value):
                try value.encode(to: encoder)
            case let .appScreenshotSet(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatment(value):
                try value.encode(to: encoder)
            }
        }
    }
}
