import Foundation

public struct AttributesSchema: Decodable, Equatable {
    public let properties: [String: PropertyType]
}
