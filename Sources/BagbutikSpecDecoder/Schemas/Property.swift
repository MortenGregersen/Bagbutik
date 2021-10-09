public struct Property: Equatable {
    public var type: PropertyType
    public let deprecated: Bool

    public init(type: PropertyType, deprecated: Bool = false) {
        self.type = type
        self.deprecated = deprecated
    }
}
