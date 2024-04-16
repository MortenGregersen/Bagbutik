import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKeyResponse
 A response that contains a single alternative distribution key resource.

 This object is the response from the alternative distribution key endpoints. For more information about alternative distribution keys, see [Creating and reading keys](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_keys#4321951).
 ```
 {
 ```

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
