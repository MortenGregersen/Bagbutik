import Foundation
import Bagbutik_Core

/**
 # AppInfoLocalizationResponse
 A response that contains a single App Info Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationresponse>
 */
public struct AppInfoLocalizationResponse: Codable {
    public let data: AppInfoLocalization
    public var included: [AppInfo]?
    public let links: DocumentLinks

    public init(data: AppInfoLocalization,
                included: [AppInfo]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
