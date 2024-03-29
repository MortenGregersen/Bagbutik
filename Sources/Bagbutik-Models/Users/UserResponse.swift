import Bagbutik_Core
import Foundation

/**
 # UserResponse
 A response that contains a single Users resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userresponse>
 */
public struct UserResponse: Codable {
    /// The resource data.
    public let data: User
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: User,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
