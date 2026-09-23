import BagbutikCore
import Foundation

/**
 # BetaRecruitmentCriterionCompatibleBuildCheckResponse

 A response containing a single result of checking whether a build meets the requirements of a beta recruitment criterion.

 ```
 object BetaRecruitmentCriterionCompatibleBuildCheckResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
