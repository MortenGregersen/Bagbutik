import Foundation

/**
 A response that contains a single Beta App Clip Invocation Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationresponse>
 */
public struct BetaAppClipInvocationLocalizationResponse: Codable {
    /// The resource data.
    public let data: BetaAppClipInvocationLocalization
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocationLocalization, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
