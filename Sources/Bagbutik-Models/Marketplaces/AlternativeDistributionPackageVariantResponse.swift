import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageVariantResponse
 A response that contains a single alternative distribution package variant resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagevariantresponse>
 */
public struct AlternativeDistributionPackageVariantResponse: Codable {
    public let data: AlternativeDistributionPackageVariant
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackageVariant,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
