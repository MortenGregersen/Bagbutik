import Foundation

public struct AttributesSchema: Decodable {
    public let type: String
    public let properties: [String: PropertyType]
}
