import Bagbutik_Core
import Foundation

public struct AppStoreVersionExperimentsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppStoreVersionExperiment

    public let data: [AppStoreVersionExperiment]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionExperiment],
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
        data = try container.decode([AppStoreVersionExperiment].self, forKey: "data")
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

    public func getAppStoreVersion(for appStoreVersionExperiment: AppStoreVersionExperiment) -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == appStoreVersionExperiment.relationships?.appStoreVersion?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatments(for appStoreVersionExperiment: AppStoreVersionExperiment) -> [AppStoreVersionExperimentTreatment] {
        guard let appStoreVersionExperimentTreatmentIds = appStoreVersionExperiment.relationships?.appStoreVersionExperimentTreatments?.data?.map(\.id),
              let appStoreVersionExperimentTreatments = included?.compactMap({ relationship -> AppStoreVersionExperimentTreatment? in
                  guard case let .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment) = relationship else { return nil }
                  return appStoreVersionExperimentTreatmentIds.contains(appStoreVersionExperimentTreatment.id) ? appStoreVersionExperimentTreatment : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentTreatments
    }

    public enum Included: Codable, Sendable {
        case appStoreVersion(AppStoreVersion)
        case appStoreVersionExperimentTreatment(AppStoreVersionExperimentTreatment)

        public init(from decoder: Decoder) throws {
            if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let appStoreVersionExperimentTreatment = try? AppStoreVersionExperimentTreatment(from: decoder) {
                self = .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatment(value):
                try value.encode(to: encoder)
            }
        }
    }
}
