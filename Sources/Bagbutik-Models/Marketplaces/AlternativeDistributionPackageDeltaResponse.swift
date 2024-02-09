import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageDeltaResponse
 A response that contains a single alternative distribution package delta resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagedeltaresponse>
 */
public struct AlternativeDistributionPackageDeltaResponse: Codable {
    public let data: AlternativeDistributionPackageDelta
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackageDelta,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
