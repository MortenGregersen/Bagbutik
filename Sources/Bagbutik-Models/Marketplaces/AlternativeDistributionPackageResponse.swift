import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageResponse
 A response that contains a single alternative distribution package resource.

 This object is the response that contains a single the alternative distribution package. For more information, see [Creating and reading distribution packages](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_packages#4321952). The schema of the response body is below.
 ```
 {
 ```

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackageresponse>
 */
public struct AlternativeDistributionPackageResponse: Codable {
    public let data: AlternativeDistributionPackage
    public var included: [AlternativeDistributionPackageVersion]?
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackage,
                included: [AlternativeDistributionPackageVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
