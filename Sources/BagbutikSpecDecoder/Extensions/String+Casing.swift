import Foundation

public extension StringProtocol {
    func camelCased(with separator: Character) -> String {
        guard self.contains(separator) else {
            var result = String(self)
            if self.allSatisfy({ $0.isUppercase }) { result = self.lowercased() }
            return result.fixTrademarkCasing()
        }
        return self.lowercased()
            .split(separator: separator)
            .enumerated()
            .map {
                if $0.offset > 0 {
                    if $0.element == "os" { return $0.element.uppercased() }
                    else if $0.element == "tv" { return "TV" }
                    return $0.element.capitalized
                }
                return $0.element.lowercased().fixTrademarkCasing()
            }
            .joined()
    }

    private func fixTrademarkCasing() -> String {
        switch self.lowercased() {
        case "ios": return "iOS"
        case "macos": return "macOS"
        case "tvos": return "tvOS"
        case "imessage": return "iMessage"
        case "ipad": return "iPad"
        case "iphone": return "iPhone"
        case "ipod": return "iPod"
        case "icloud": return "iCloud"
        case "homekit": return "homeKit"
        case "healthkit": return "healthKit"
        case "classkit": return "classKit"
        case "sirikit": return "siriKit"
        default: return String(self)
        }
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    func lowercasedFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
}
