import Foundation

/**
 A response that contains a list of App Preview Set resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetsresponse>
 */
public struct AppPreviewSetsResponse: Codable, PagedResponse {
    public typealias Data = AppPreviewSet
    /// The resource data.
    public let data: [AppPreviewSet]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppPreviewSet], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
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
