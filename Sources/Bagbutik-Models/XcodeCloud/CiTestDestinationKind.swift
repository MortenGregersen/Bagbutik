import Bagbutik_Core
import Foundation

public enum CiTestDestinationKind: String, Sendable, Codable, CaseIterable {
    case mac = "MAC"
    case simulator = "SIMULATOR"
}
