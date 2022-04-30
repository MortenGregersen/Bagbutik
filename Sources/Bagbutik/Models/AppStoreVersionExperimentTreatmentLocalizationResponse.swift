import Foundation

public struct AppStoreVersionExperimentTreatmentLocalizationResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionExperimentTreatmentLocalization
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionExperimentTreatmentLocalization, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAppPreviewSets() -> [AppPreviewSet] {
        guard let appPreviewSetIds = data.relationships?.appPreviewSets?.data?.map(\.id),
              let appPreviewSets = included?.compactMap({ relationship -> AppPreviewSet? in
                  guard case let .appPreviewSet(appPreviewSet) = relationship else { return nil }
                  return appPreviewSetIds.contains(appPreviewSet.id) ? appPreviewSet : nil
              })
        else {
            return []
        }
        return appPreviewSets
    }

    public func getAppScreenshotSets() -> [AppScreenshotSet] {
        guard let appScreenshotSetIds = data.relationships?.appScreenshotSets?.data?.map(\.id),
              let appScreenshotSets = included?.compactMap({ relationship -> AppScreenshotSet? in
                  guard case let .appScreenshotSet(appScreenshotSet) = relationship else { return nil }
                  return appScreenshotSetIds.contains(appScreenshotSet.id) ? appScreenshotSet : nil
              })
        else {
            return []
        }
        return appScreenshotSets
    }

    public func getAppStoreVersionExperimentTreatment() -> AppStoreVersionExperimentTreatment? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatment? in
            guard case let .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment) = relationship else { return nil }
            return appStoreVersionExperimentTreatment
        }.first { $0.id == data.relationships?.appStoreVersionExperimentTreatment?.data?.id }
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
