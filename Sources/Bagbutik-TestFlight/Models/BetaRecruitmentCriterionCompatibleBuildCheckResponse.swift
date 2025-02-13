import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaRecruitmentCriterionCompatibleBuildCheckResponse
 A response that contains a single beta recruitment criteria-compatible, build-check resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betarecruitmentcriterioncompatiblebuildcheckresponse>
 */
public struct BetaRecruitmentCriterionCompatibleBuildCheckResponse: Codable, Sendable {
    public let data: BetaRecruitmentCriterionCompatibleBuildCheck
    public let links: DocumentLinks

    public init(data: BetaRecruitmentCriterionCompatibleBuildCheck,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaRecruitmentCriterionCompatibleBuildCheck.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
