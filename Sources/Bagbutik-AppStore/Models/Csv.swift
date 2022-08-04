import Foundation
import Bagbutik_Core

public struct Csv: PlainTextResponse {
    public let text: String

    public static func from(text: String) -> Csv {
        return Self(text: text)
    }
}
