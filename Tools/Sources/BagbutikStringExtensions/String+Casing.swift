import Foundation

public extension StringProtocol {
    /**
      Turns a string with separators into a camel cased version. The string is separated by the separators
      and every word (except the first) is capitalized.

      - Parameter separator: The character used to separate the words in the string
     */
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
    
    /**
     Splits a camelCase or PascalCase string into its constituent words.
     
     - Returns: An array of words extracted from the camelCase string.
     */
    func splitCamelCase() -> [String] {
        guard !self.isEmpty else { return [] }
        var words: [String] = []
        var currentWord = ""
        for character in self {
            if character.isUppercase, !currentWord.isEmpty {
                words.append(currentWord)
                currentWord = "\(character)"
            } else {
                currentWord.append(character)
            }
        }
        if !currentWord.isEmpty {
            words.append(currentWord)
        }
        return words
    }

    /// Returns a copy of the string where the first letter is capitalized
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    /// Returns a copy of the string where the first letter is lowercased
    func lowercasedFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }

    /// Returns a correctly capitalized version of the string if it is an Apple trademark
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
}
