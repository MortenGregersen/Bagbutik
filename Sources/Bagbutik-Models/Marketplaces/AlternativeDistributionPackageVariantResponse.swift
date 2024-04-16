import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageVariantResponse
 A response that contains a single alternative distribution package variant resource.

 This object is the response that contains a single alternative distribution package variant. For more information, see [Read information for an alternative distribution package variants](https://developer.apple.com/documentation/appstoreconnectapi/read_information_for_an_alternative_distribution_package_variants). The schema of the response body is below.
 ```
 {
 ```

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
