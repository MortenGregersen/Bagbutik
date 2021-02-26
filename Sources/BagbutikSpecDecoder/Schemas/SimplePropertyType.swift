import Foundation

public struct SimplePropertyType: Decodable, Equatable, CustomStringConvertible {
    public static let boolean = Self(type: "boolean")
    public static let integer = Self(type: "integer")
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

    public let type: String
}
