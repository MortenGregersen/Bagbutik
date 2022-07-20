import Foundation

/**
 A response that contains a single Beta Build Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationresponse>
 */
public struct BetaBuildLocalizationResponse: Codable {
    /// The resource data.
    public let data: BetaBuildLocalization
    public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaBuildLocalization, included: [Build]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
