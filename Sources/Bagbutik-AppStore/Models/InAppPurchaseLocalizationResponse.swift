import Foundation
import Bagbutik_Core

public struct InAppPurchaseLocalizationResponse: Codable {
    public let data: InAppPurchaseLocalization
    public var included: [InAppPurchaseV2]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseLocalization,
                included: [InAppPurchaseV2]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
