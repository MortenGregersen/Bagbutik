import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaAppClipInvocationLocalizationResponse
 A response that contains a single Beta App Clip Invocation Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationresponse>
 */
public struct BetaAppClipInvocationLocalizationResponse: Codable, Sendable {
    /// The resource data.
    public let data: BetaAppClipInvocationLocalization
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocationLocalization,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaAppClipInvocationLocalization.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
