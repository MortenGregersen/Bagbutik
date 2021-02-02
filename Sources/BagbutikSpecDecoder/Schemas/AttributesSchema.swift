import Foundation

public struct AttributesSchema: Decodable {
    public let properties: [String: PropertyType]
}
