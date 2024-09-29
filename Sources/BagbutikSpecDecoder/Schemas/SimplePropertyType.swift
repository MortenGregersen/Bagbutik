import Foundation

/// A property type with only a name of the type
public struct SimplePropertyType: Decodable, Equatable, CustomStringConvertible, Sendable {
    /// A boolean property type
    public static func boolean() -> Self { .init(type: "boolean") }
    /// An interger property type
    public static func integer() -> Self { .init(type: "integer") }
    /// A string property type
    public static func string() -> Self { .init(type: "string") }

    public var description: String {
        switch self.type {
        case Self.boolean().type:
            "Bool"
        case Self.integer().type:
            "Int"
        case Self.string().type:
            "String"
        default:
            self.type
        }
    }

    let type: String
}
