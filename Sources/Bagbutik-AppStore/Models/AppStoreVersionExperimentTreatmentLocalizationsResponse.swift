import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppStoreVersionExperimentTreatmentLocalizationsResponse
 The response body for endpoints that list localized treatments for an App Store version experiment.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionexperimenttreatmentlocalizationsresponse>
 */
public struct AppStoreVersionExperimentTreatmentLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppStoreVersionExperimentTreatmentLocalization

    public let data: [AppStoreVersionExperimentTreatmentLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionExperimentTreatmentLocalization],
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
        data = try container.decode([AppStoreVersionExperimentTreatmentLocalization].self, forKey: "data")
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

    public func getAppStoreVersionExperimentTreatment(for appStoreVersionExperimentTreatmentLocalization: AppStoreVersionExperimentTreatmentLocalization) -> AppStoreVersionExperimentTreatment? {
        included?.compactMap { relationship -> AppStoreVersionExperimentTreatment? in
            guard case let .appStoreVersionExperimentTreatment(appStoreVersionExperimentTreatment) = relationship else { return nil }
            return appStoreVersionExperimentTreatment
        }.first { $0.id == appStoreVersionExperimentTreatmentLocalization.relationships?.appStoreVersionExperimentTreatment?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appPreviewSet(AppPreviewSet)
        case appScreenshotSet(AppScreenshotSet)
        case appStoreVersionExperimentTreatment(AppStoreVersionExperimentTreatment)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appPreviewSets":
                self = .appPreviewSet(try AppPreviewSet(from: decoder))
            case "appScreenshotSets":
                self = .appScreenshotSet(try AppScreenshotSet(from: decoder))
            case "appStoreVersionExperimentTreatments":
                self = .appStoreVersionExperimentTreatment(try AppStoreVersionExperimentTreatment(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
    }
}
