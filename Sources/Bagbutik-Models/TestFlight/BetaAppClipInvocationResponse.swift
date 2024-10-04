import Bagbutik_Core
import Foundation

/**
 # BetaAppClipInvocationResponse
 A response that contains a single Beta App Clip Invocations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationresponse>
 */
public struct BetaAppClipInvocationResponse: Codable, Sendable {
    /// The resource data.
    public let data: BetaAppClipInvocation
    /// The requested relationship data.
    public var included: [BetaAppClipInvocationLocalization]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocation,
                included: [BetaAppClipInvocationLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaAppClipInvocation.self, forKey: "data")
        included = try container.decodeIfPresent([BetaAppClipInvocationLocalization].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
