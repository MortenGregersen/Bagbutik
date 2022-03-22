import Foundation

/// A property wrapper to use on properties that should be encoded with a `null` value (instead of being omitted).
@propertyWrapper
public struct NullCodable<Value>: Codable where Value: Codable {
    /// The wrapped value.
    public var wrappedValue: Value?

    /**
     Create a new property wrapper with the specified wrapped value.
     
     - Parameter wrappedValue: The wrapped value.
     */
    public init(wrappedValue: Value?) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Value.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .none: try container.encodeNil()
        case .some(let value): try container.encode(value)
        }
    }
}

extension NullCodable: Equatable where Value: Equatable {}

internal extension KeyedDecodingContainer {
    /// Decode a `@NullCodable` value with the value or an empty `@NullCodable` if the value isn't present.
    func decode<Value: Decodable>(_ type: NullCodable<Value>.Type, forKey key: Key) throws -> NullCodable<Value> {
        try decodeIfPresent(NullCodable<Value>.self, forKey: key) ?? NullCodable<Value>(wrappedValue: nil)
    }
}
