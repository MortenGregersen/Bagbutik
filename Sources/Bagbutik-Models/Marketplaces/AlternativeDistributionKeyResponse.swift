import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKeyResponse
 A response that contains a single alternative distribution key resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeyresponse>
 */
public struct AlternativeDistributionKeyResponse: Codable {
    public let data: AlternativeDistributionKey
    public let links: DocumentLinks

    public init(data: AlternativeDistributionKey,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
