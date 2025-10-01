import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionExperimentTreatmentsResponse
 A response that contains a list of app store version experiment treatments response resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionexperimenttreatmentsresponse>
 */
public struct AppStoreVersionExperimentTreatmentsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppStoreVersionExperimentTreatment

    public let data: [AppStoreVersionExperimentTreatment]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionExperimentTreatment],
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
        data = try container.decode([AppStoreVersionExperimentTreatment].self, forKey: "data")
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

    public func getAppStoreVersionExperiment(for appStoreVersionExperimentTreatment: AppStoreVersionExperimentTreatment) -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperiment) = relationship else { return nil }
            return appStoreVersionExperiment
        }.first { $0.id == appStoreVersionExperimentTreatment.relationships?.appStoreVersionExperiment?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatmentLocalizations(for appStoreVersionExperimentTreatment: AppStoreVersionExperimentTreatment) -> [AppStoreVersionExperimentTreatmentLocalization] {
        guard let appStoreVersionExperimentTreatmentLocalizationIds = appStoreVersionExperimentTreatment.relationships?.appStoreVersionExperimentTreatmentLocalizations?.data?.map(\.id),
              let appStoreVersionExperimentTreatmentLocalizations = included?.compactMap({ relationship -> AppStoreVersionExperimentTreatmentLocalization? in
                  guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
                  return appStoreVersionExperimentTreatmentLocalizationIds.contains(appStoreVersionExperimentTreatmentLocalization.id) ? appStoreVersionExperimentTreatmentLocalization : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentTreatmentLocalizations
    }

    public func getAppStoreVersionExperimentV2(for appStoreVersionExperimentTreatment: AppStoreVersionExperimentTreatment) -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperimentV2) = relationship else { return nil }
            return appStoreVersionExperimentV2
        }.first { $0.id == appStoreVersionExperimentTreatment.relationships?.appStoreVersionExperimentV2?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)

        public init(from decoder: Decoder) throws {
            if let appStoreVersionExperiment = try? AppStoreVersionExperiment(from: decoder) {
                self = .appStoreVersionExperiment(appStoreVersionExperiment)
            } else if let appStoreVersionExperimentTreatmentLocalization = try? AppStoreVersionExperimentTreatmentLocalization(from: decoder) {
                self = .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appStoreVersionExperiment(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatmentLocalization(value):
                try value.encode(to: encoder)
            }
        }
    }
}
