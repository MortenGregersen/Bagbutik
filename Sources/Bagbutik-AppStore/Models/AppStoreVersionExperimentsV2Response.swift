import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct AppStoreVersionExperimentsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = AppStoreVersionExperimentV2

    public let data: [AppStoreVersionExperimentV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionExperimentV2],
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
        data = try container.decode([AppStoreVersionExperimentV2].self, forKey: "data")
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

    public func getApp(for appStoreVersionExperimentV2: AppStoreVersionExperimentV2) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appStoreVersionExperimentV2.relationships?.app?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatments(for appStoreVersionExperimentV2: AppStoreVersionExperimentV2) -> [AppStoreVersionExperimentTreatment] {
        guard let appStoreVersionExperimentTreatmentIds = appStoreVersionExperimentV2.relationships?.appStoreVersionExperimentTreatments?.data?.map(\.id),
              let appStoreVersionExperimentTreatments = included?.compactMap({ relationship -> AppStoreVersionExperimentTreatment? in
                  guard case let .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment) = relationship else { return nil }
                  return appStoreVersionExperimentTreatmentIds.contains(appStoreVersionExperimentTreatment.id) ? appStoreVersionExperimentTreatment : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentTreatments
    }

    public func getControlVersions(for appStoreVersionExperimentV2: AppStoreVersionExperimentV2) -> [AppStoreVersion] {
        guard let controlVersionIds = appStoreVersionExperimentV2.relationships?.controlVersions?.data?.map(\.id),
              let controlVersions = included?.compactMap({ relationship -> AppStoreVersion? in
                  guard case let .appStoreVersion(controlVersion) = relationship else { return nil }
                  return controlVersionIds.contains(controlVersion.id) ? controlVersion : nil
              })
        else {
            return []
        }
        return controlVersions
    }

    public func getLatestControlVersion(for appStoreVersionExperimentV2: AppStoreVersionExperimentV2) -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(latestControlVersion) = relationship else { return nil }
            return latestControlVersion
        }.first { $0.id == appStoreVersionExperimentV2.relationships?.latestControlVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case appStoreVersion(AppStoreVersion)
        case appStoreVersionExperimentTreatment(AppStoreVersionExperimentTreatment)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let appStoreVersionExperimentTreatment = try? AppStoreVersionExperimentTreatment(from: decoder) {
                self = .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment)
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
            case let .app(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatment(value):
                try value.encode(to: encoder)
            }
        }
    }
}
