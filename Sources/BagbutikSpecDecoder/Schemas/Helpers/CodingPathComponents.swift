internal extension Array where Element == CodingKey {
    var components: [String] {
        self
            .map(\.stringValue)
            .drop { $0 == "components" || $0 == "schemas" }
            .map { $0.capitalizingFirstLetter() }
    }
}
