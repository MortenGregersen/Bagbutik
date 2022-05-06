import Foundation

public struct AppStoreVersionExperimentTreatmentsResponse: Codable, PagedResponse {
    public typealias Data = AppStoreVersionExperimentTreatment
    /// The resource data.
    public let data: [AppStoreVersionExperimentTreatment]
    /// The included related resources.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionExperimentTreatment], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
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

    public enum Included: Codable {
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case appStoreVersionExperimentTreatmentLocalization(AppStoreVersionExperimentTreatmentLocalization)

        public init(from decoder: Decoder) throws {
            if let appStoreVersionExperiment = try? AppStoreVersionExperiment(from: decoder) {
                self = .appStoreVersionExperiment(appStoreVersionExperiment)
            } else if let appStoreVersionExperimentTreatmentLocalization = try? AppStoreVersionExperimentTreatmentLocalization(from: decoder) {
                self = .appStoreVersionExperimentTreatmentLocalization(appStoreVersionExperimentTreatmentLocalization)
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
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
