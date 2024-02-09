import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageResponse
 A response that contains a single alternative distribution package resource.

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
