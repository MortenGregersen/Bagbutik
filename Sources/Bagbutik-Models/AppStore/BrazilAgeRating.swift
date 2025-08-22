import Bagbutik_Core
import Foundation

public enum BrazilAgeRating: String, Sendable, Codable, CaseIterable {
    case eighteen = "EIGHTEEN"
    case fourteen = "FOURTEEN"
    case l = "L"
    case sixteen = "SIXTEEN"
    case ten = "TEN"
    case twelve = "TWELVE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BrazilAgeRating(rawValue: string) {
            self = value
        } else if let value = BrazilAgeRating(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BrazilAgeRating value: \(string)"
            )
        }
    }
}
