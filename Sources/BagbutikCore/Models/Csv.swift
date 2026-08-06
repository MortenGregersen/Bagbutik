import Foundation

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
