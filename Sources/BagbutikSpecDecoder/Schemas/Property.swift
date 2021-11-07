/// A property on a type
public struct Property: Equatable {
    /// The type of the property
    public var type: PropertyType
    /// Tells if the property is deprecated
    public let deprecated: Bool

    /**
     Initialize a new property
     
     - Parameters:
        - type: The type of the property
        - deprecated: Tells if the property is deprecated
     */
    public init(type: PropertyType, deprecated: Bool = false) {
        self.type = type
        self.deprecated = deprecated
    }
}
