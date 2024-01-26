import Bagbutik_Core
import Foundation

public struct CiManualBranchStartCondition: Codable {
    public var source: CiBranchPatterns?

    public init(source: CiBranchPatterns? = nil) {
        self.source = source
    }
}
