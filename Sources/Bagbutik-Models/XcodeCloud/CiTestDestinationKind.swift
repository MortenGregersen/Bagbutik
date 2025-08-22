import Bagbutik_Core
import Foundation

public enum CiTestDestinationKind: String, Sendable, Codable, CaseIterable {
    case mac = "MAC"
    case simulator = "SIMULATOR"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiTestDestinationKind(rawValue: string) {
            self = value
        } else if let value = CiTestDestinationKind(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiTestDestinationKind value: \(string)"
            )
        }
    }
}
