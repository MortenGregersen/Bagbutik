import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionExperimentTreatmentResponse
 A response that contains a single app store version experiment treatment response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionexperimenttreatmentresponse>
 */
public struct AppStoreVersionExperimentTreatmentResponse: Codable, Sendable {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppStoreVersionExperimentTreatment.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
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

    public enum Included: Codable, Sendable {
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appStoreVersionExperiments":
                self = .appStoreVersionExperiment(try AppStoreVersionExperiment(from: decoder))
            case "appStoreVersionExperimentTreatmentLocalizations":
                self = .appStoreVersionExperimentTreatmentLocalization(try AppStoreVersionExperimentTreatmentLocalization(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
