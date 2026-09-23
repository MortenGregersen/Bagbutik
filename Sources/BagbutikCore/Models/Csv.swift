import Foundation

/**
 # csv

 A string that represents a CSV-formatted report.

 ```
 string csv
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/csv>
 */
public struct Csv: PlainTextResponse {
    public let text: String

    public static func from(text: String) -> Csv {
        return Self(text: text)
    }

    public init(text: String) {
        self.text = text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        text = try container.decode(String.self, forKey: "text")
    }
}
