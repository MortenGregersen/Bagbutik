import Foundation

/**
 A response that contains a single App Info Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationresponse>
 */
public struct AppInfoLocalizationResponse: Codable {
    /// The resource data.
    public let data: AppInfoLocalization
    /// The included related resources.
    public let included: [AppInfo]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppInfoLocalization, included: [AppInfo]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
