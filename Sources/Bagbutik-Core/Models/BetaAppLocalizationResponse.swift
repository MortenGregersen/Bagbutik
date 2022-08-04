import Foundation

/**
 # BetaAppLocalizationResponse
 A response that contains a single Beta App Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationresponse>
 */
public struct BetaAppLocalizationResponse: Codable {
    /// The resource data.
    public let data: BetaAppLocalization
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppLocalization,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
