import Bagbutik_Core
import Foundation

public struct AppStoreVersionExperimentV2Response: Codable, Sendable {
    public let data: AppStoreVersionExperimentV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppStoreVersionExperimentV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreVersionExperimentV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatments() -> [AppStoreVersionExperimentTreatment] {
        guard let appStoreVersionExperimentTreatmentIds = data.relationships?.appStoreVersionExperimentTreatments?.data?.map(\.id),
              let appStoreVersionExperimentTreatments = included?.compactMap({ relationship -> AppStoreVersionExperimentTreatment? in
                  guard case let .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment) = relationship else { return nil }
                  return appStoreVersionExperimentTreatmentIds.contains(appStoreVersionExperimentTreatment.id) ? appStoreVersionExperimentTreatment : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentTreatments
    }

    public func getControlVersions() -> [AppStoreVersion] {
        guard let controlVersionIds = data.relationships?.controlVersions?.data?.map(\.id),
              let controlVersions = included?.compactMap({ relationship -> AppStoreVersion? in
                  guard case let .appStoreVersion(controlVersion) = relationship else { return nil }
                  return controlVersionIds.contains(controlVersion.id) ? controlVersion : nil
              })
        else {
            return []
        }
        return controlVersions
    }

    public func getLatestControlVersion() -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(latestControlVersion) = relationship else { return nil }
            return latestControlVersion
        }.first { $0.id == data.relationships?.latestControlVersion?.data?.id }
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
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
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
