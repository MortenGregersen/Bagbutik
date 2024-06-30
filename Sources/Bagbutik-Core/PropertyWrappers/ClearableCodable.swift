import Foundation

/// A property wrapper to use on properties that should be encoded with a `null` value when `.clear` is specified and omitted if `nil`.
@propertyWrapper
public struct ClearableCodable<Value>: Codable & Equatable where Value: Codable & Equatable {
    public var wrappedValue: Clearable<Value>?

    /**
     Create a new property wrapper with the specified wrapped value.

     - Parameter wrappedValue: The wrapped value.
     */
    public init(wrappedValue: Clearable<Value>?) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = .value(try container.decode(Value.self))
    }

    public func encode(to encoder: Encoder) throws {
        if let wrappedValue {
            var container = encoder.singleValueContainer()
            switch wrappedValue {
            case .value(let value): try container.encode(value)
            case .clear: try container.encodeNil()
            }
        }
    }
}

public enum Clearable<Value>: Codable, Equatable where Value: Codable & Equatable {
    case value(Value)
    case clear
}

extension KeyedEncodingContainer {
    public mutating func encodeIfPresent<T>(
        _ value: ClearableCodable<T>,
        forKey key: KeyedEncodingContainer<K>.Key) throws
    {
        if value.wrappedValue != nil {
            try encode(value, forKey: key)
        }
    }
}

internal extension KeyedDecodingContainer {
    /// Decode a `@ClearableCodable` value with a `clear`  if the value isn't present.
    func decode<Value: Decodable>(_ type: ClearableCodable<Value>.Type, forKey key: Key) throws -> ClearableCodable<Value> {
        try decodeIfPresent(ClearableCodable<Value>.self, forKey: key) ?? ClearableCodable<Value>(wrappedValue: .clear)
    }
}
