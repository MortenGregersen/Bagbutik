import Bagbutik_Core
import Foundation

public struct AppStoreVersionExperimentTreatmentResponse: Codable {
    public let data: AppStoreVersionExperimentTreatment
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppStoreVersionExperimentTreatment,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(AppStoreVersionExperimentTreatment.self, forKey: .data)
        included = try container.decodeIfPresent([Included].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }

    public func getAppStoreVersionExperiment() -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperiment) = relationship else { return nil }
            return appStoreVersionExperiment
        }.first { $0.id == data.relationships?.appStoreVersionExperiment?.data?.id }
    }

    public func getAppStoreVersionExperimentTreatmentLocalizations() -> [AppStoreVersionExperimentTreatmentLocalization] {
        guard let appStoreVersionExperimentTreatmentLocalizationIds = data.relationships?.appStoreVersionExperimentTreatmentLocalizations?.data?.map(\.id),
              let appStoreVersionExperimentTreatmentLocalizations = included?.compactMap({ relationship -> AppStoreVersionExperimentTreatmentLocalization? in
                  guard case let .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization) = relationship else { return nil }
                  return appStoreVersionExperimentTreatmentLocalizationIds.contains(appStoreVersionExperimentTreatmentLocalization.id) ? appStoreVersionExperimentTreatmentLocalization : nil
              })
        else {
            return []
        }
        return appStoreVersionExperimentTreatmentLocalizations
    }

    public func getAppStoreVersionExperimentV2() -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperimentV2) = relationship else { return nil }
            return appStoreVersionExperimentV2
        }.first { $0.id == data.relationships?.appStoreVersionExperimentV2?.data?.id }
    }

    public enum Included: Codable {
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)
        case appStoreVersionExperimentV2(AppStoreVersionExperimentV2)

        public init(from decoder: Decoder) throws {
            if let appStoreVersionExperiment = try? AppStoreVersionExperiment(from: decoder) {
                self = .appStoreVersionExperiment(appStoreVersionExperiment)
            } else if let appStoreVersionExperimentTreatmentLocalization = try? AppStoreVersionExperimentTreatmentLocalization(from: decoder) {
                self = .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization)
            } else if let appStoreVersionExperimentV2 = try? AppStoreVersionExperimentV2(from: decoder) {
                self = .appStoreVersionExperimentV2(appStoreVersionExperimentV2)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appStoreVersionExperiment(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentTreatmentLocalization(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperimentV2(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
