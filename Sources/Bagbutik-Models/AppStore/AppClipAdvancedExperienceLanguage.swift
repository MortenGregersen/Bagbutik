import Bagbutik_Core
import Foundation

public enum AppClipAdvancedExperienceLanguage: String, Sendable, Codable, CaseIterable {
    case ar = "AR"
    case ca = "CA"
    case cs = "CS"
    case da = "DA"
    case de = "DE"
    case el = "EL"
    case en = "EN"
    case es = "ES"
    case fi = "FI"
    case fr = "FR"
    case he = "HE"
    case hi = "HI"
    case hr = "HR"
    case hu = "HU"
    case id = "ID"
    case it = "IT"
    case ja = "JA"
    case ko = "KO"
    case ms = "MS"
    case nl = "NL"
    case no = "NO"
    case pl = "PL"
    case pt = "PT"
    case ro = "RO"
    case ru = "RU"
    case sk = "SK"
    case sv = "SV"
    case th = "TH"
    case tr = "TR"
    case uk = "UK"
    case vi = "VI"
    case zh = "ZH"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppClipAdvancedExperienceLanguage(rawValue: string) {
            self = value
        } else if let value = AppClipAdvancedExperienceLanguage(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppClipAdvancedExperienceLanguage value: \(string)"
            )
        }
    }
}
