import Bagbutik_Core
import Foundation

public struct InAppPurchaseSubmissionResponse: Codable {
    public let data: InAppPurchaseSubmission
    public var included: [InAppPurchaseV2]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseSubmission,
                included: [InAppPurchaseV2]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
