/// A property on a type
public struct Property: Equatable, Sendable {
    /// The type of the property
    public var type: PropertyType
    /// Tells if the property is deprecated
    public let deprecated: Bool
    /// Tells if the property can be cleared (in update requests)
    public let clearable: Bool

    /**
     Initialize a new property
     
     - Parameters:
        - type: The type of the property
        - deprecated: Tells if the property is deprecated
        - clearable: Tells if the property can be cleared (in `UpdateRequest`s)
     */
    public init(type: PropertyType, deprecated: Bool = false, clearable: Bool = false) {
        self.type = type
        self.deprecated = deprecated
        self.clearable = clearable
    }
}
