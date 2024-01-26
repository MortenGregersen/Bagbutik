import Bagbutik_Core
import Foundation

public struct CiManualTagStartCondition: Codable {
    public var source: CiTagPatterns?

    public init(source: CiTagPatterns? = nil) {
        self.source = source
    }
}
