import Bagbutik_Core
import Foundation

public struct CiManualPullRequestStartCondition: Codable {
    public var destination: CiBranchPatterns?
    public var source: CiBranchPatterns?

    public init(destination: CiBranchPatterns? = nil,
                source: CiBranchPatterns? = nil)
    {
        self.destination = destination
        self.source = source
    }
}
