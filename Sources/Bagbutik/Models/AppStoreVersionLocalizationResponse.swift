import Foundation

/**
 A response that contains a single App Store Version Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationresponse>
 */
public struct AppStoreVersionLocalizationResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionLocalization
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionLocalization, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case appPreviewSet(AppPreviewSet)
        case appScreenshotSet(AppScreenshotSet)
        case appStoreVersion(AppStoreVersion)

        public init(from decoder: Decoder) throws {
            if let appPreviewSet = try? AppPreviewSet(from: decoder) {
                self = .appPreviewSet(appPreviewSet)
            } else if let appScreenshotSet = try? AppScreenshotSet(from: decoder) {
                self = .appScreenshotSet(appScreenshotSet)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
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
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
