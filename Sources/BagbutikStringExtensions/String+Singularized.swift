public extension String {
    /// Returns a singular copy of the string
    func singularized() -> String {
        guard self.hasSuffix("s") else { return self }
        if self.hasSuffix("ies") { return self.dropLast(3).appending("y") }
        return String(self.prefix(upTo: self.index(before: self.endIndex)))
    }
}
