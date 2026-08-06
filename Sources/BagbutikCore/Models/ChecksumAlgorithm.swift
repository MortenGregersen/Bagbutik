import Foundation

public enum ChecksumAlgorithm: String, Sendable, Codable, CaseIterable {
    case MD5
    case sha256 = "SHA_256"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = ChecksumAlgorithm(rawValue: string) {
            self = value
        } else if let value = ChecksumAlgorithm(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid ChecksumAlgorithm value: \(string)"
            )
        }
    }
}
