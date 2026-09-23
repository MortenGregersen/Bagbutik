import BagbutikCore
import Foundation

/**
 # ChecksumAlgorithm

 A string value identifying the algorithm used to verify the integrity of an uploaded background asset file.

 ```
 string ChecksumAlgorithm
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/checksumalgorithm>
 */
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
