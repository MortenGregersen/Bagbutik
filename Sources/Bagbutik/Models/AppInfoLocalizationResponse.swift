import Foundation

/**
 A response that contains a single App Info Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationresponse>
 */
public struct AppInfoLocalizationResponse: Codable {
    /// The resource data.
    public let data: AppInfoLocalization
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppInfoLocalization, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
