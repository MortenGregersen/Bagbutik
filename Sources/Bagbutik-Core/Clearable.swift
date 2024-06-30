import Foundation

///  Wrapper for a property that can be cleared. Used in `UpdateRequest`s.
public enum Clearable<Value>: Codable, Equatable where Value: Codable & Equatable {
    /// The value to set
    case value(Value)
    /// Clear current value
    case clear

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = try .value(container.decode(Value.self))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .value(let value): try container.encode(value)
        case .clear: try container.encodeNil()
        }
    }
}
