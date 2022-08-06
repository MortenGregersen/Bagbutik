import Bagbutik_Core
import Foundation

public struct Csv: PlainTextResponse {
    public let text: String

    public static func from(text: String) -> Csv {
        return Self(text: text)
    }
}
