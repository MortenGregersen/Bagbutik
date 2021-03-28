import Foundation

/// A property type with only a name of the type
public struct SimplePropertyType: Decodable, Equatable, CustomStringConvertible {
    /// A boolean property type
    public static let boolean = Self(type: "boolean")
    /// An interger property type
    public static let integer = Self(type: "integer")
    /// A string property type
    public static let string = Self(type: "string")

    public var description: String {
        switch self.type {
        case Self.boolean.type:
            return "Bool"
        case Self.integer.type:
            return "Int"
        case Self.string.type:
            return "String"
        default:
            return self.type
        }
    }

    internal let type: String
}
