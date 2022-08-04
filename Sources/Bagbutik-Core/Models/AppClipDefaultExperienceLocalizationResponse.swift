import Foundation

/**
 # AppClipDefaultExperienceLocalizationResponse
 A response that contains a single Default App Clip Experience Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalizationresponse>
 */
public struct AppClipDefaultExperienceLocalizationResponse: Codable {
    /// The resource data.
    public let data: AppClipDefaultExperienceLocalization
    /// The requested relationship data.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipDefaultExperienceLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAppClipDefaultExperience() -> AppClipDefaultExperience? {
        included?.compactMap { relationship -> AppClipDefaultExperience? in
            guard case let .appClipDefaultExperience(appClipDefaultExperience) = relationship else { return nil }
            return appClipDefaultExperience
        }.first { $0.id == data.relationships?.appClipDefaultExperience?.data?.id }
    }

    public func getAppClipHeaderImage() -> AppClipHeaderImage? {
        included?.compactMap { relationship -> AppClipHeaderImage? in
            guard case let .appClipHeaderImage(appClipHeaderImage) = relationship else { return nil }
            return appClipHeaderImage
        }.first { $0.id == data.relationships?.appClipHeaderImage?.data?.id }
    }

    public enum Included: Codable {
        case appClipDefaultExperience(AppClipDefaultExperience)
        case appClipHeaderImage(AppClipHeaderImage)

        public init(from decoder: Decoder) throws {
            if let appClipDefaultExperience = try? AppClipDefaultExperience(from: decoder) {
                self = .appClipDefaultExperience(appClipDefaultExperience)
            } else if let appClipHeaderImage = try? AppClipHeaderImage(from: decoder) {
                self = .appClipHeaderImage(appClipHeaderImage)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appClipDefaultExperience(value):
                try value.encode(to: encoder)
            case let .appClipHeaderImage(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
