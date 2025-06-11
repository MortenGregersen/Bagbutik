import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaFeedbackScreenshotSubmissionResponse
 A response that contains a single BetaFeedbackScreenshotSubmission resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betafeedbackscreenshotsubmissionresponse>
 */
public struct BetaFeedbackScreenshotSubmissionResponse: Codable, Sendable {
    public let data: BetaFeedbackScreenshotSubmission
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: BetaFeedbackScreenshotSubmission,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaFeedbackScreenshotSubmission.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getBuild() -> Build? {
        included?.compactMap { relationship -> Build? in
            guard case let .build(build) = relationship else { return nil }
            return build
        }.first { $0.id == data.relationships?.build?.data?.id }
    }

    public func getTester() -> BetaTester? {
        included?.compactMap { relationship -> BetaTester? in
            guard case let .betaTester(tester) = relationship else { return nil }
            return tester
        }.first { $0.id == data.relationships?.tester?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case betaTester(BetaTester)
        case build(Build)

        public init(from decoder: Decoder) throws {
            if let betaTester = try? BetaTester(from: decoder) {
                self = .betaTester(betaTester)
            } else if let build = try? Build(from: decoder) {
                self = .build(build)
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
            case let .betaTester(value):
                try value.encode(to: encoder)
            case let .build(value):
                try value.encode(to: encoder)
            }
        }
    }
}
