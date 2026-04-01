/// A coding key that can be created from arbitrary string values.
public struct AnyCodingKey: CodingKey {
    public let stringValue: String
    public let intValue: Int? = nil
    
    public init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public init?(intValue: Int) {
        nil // We are not using this, so just return nil
    }
}

/// Allows `AnyCodingKey` to be created from string literals in internal encoding helpers.
extension AnyCodingKey: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.stringValue = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.stringValue = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.stringValue = value
    }
}
