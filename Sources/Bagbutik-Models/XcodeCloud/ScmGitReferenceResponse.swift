import Bagbutik_Core
import Foundation

/**
 # ScmGitReferenceResponse
 A response that contains a single Git References resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmgitreferenceresponse>
 */
public struct ScmGitReferenceResponse: Codable {
    /// The resource data.
    public let data: ScmGitReference
    /// The requested relationship data.
    public var included: [ScmRepository]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ScmGitReference,
                included: [ScmRepository]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(ScmGitReference.self, forKey: .data)
        included = try container.decodeIfPresent([ScmRepository].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }
}
