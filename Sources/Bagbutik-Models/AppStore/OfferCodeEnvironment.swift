import Bagbutik_Core
import Foundation

public enum OfferCodeEnvironment: String, Sendable, Codable, CaseIterable {
    case production = "PRODUCTION"
    case sandbox = "SANDBOX"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = OfferCodeEnvironment(rawValue: string) {
            self = value
        } else if let value = OfferCodeEnvironment(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid OfferCodeEnvironment value: \(string)"
            )
        }
    }
}
