import Bagbutik_Core
import Foundation

public enum CiGitRefKind: String, Sendable, Codable, CaseIterable {
    case branch = "BRANCH"
    case tag = "TAG"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiGitRefKind(rawValue: string) {
            self = value
        } else if let value = CiGitRefKind(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiGitRefKind value: \(string)"
            )
        }
    }
}
