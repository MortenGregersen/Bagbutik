import Foundation

/**
 # gzip

 A binary value that represents a gzip-compressed file.

 ```
 binary gzip
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gzip>
 */
public struct Gzip: BinaryResponse {
    public let data: Data

    public static func from(data: Data) -> Gzip {
        return Self(data: data)
    }

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }
}
