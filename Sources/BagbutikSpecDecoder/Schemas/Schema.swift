import Foundation

/// A wrapper for the different schema types
public enum Schema: Decodable, Equatable {
    /// An enum schema
    case `enum`(EnumSchema)
    /// An object schema
    case object(ObjectSchema)
    
    /// The name of the schema
    public var name: String {
        switch self {
        case .enum(let enumSchema):
            return enumSchema.name
        case .object(let objectSchema):
            return objectSchema.name
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case `enum`
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        if try container.decodeIfPresent([String].self, forKey: .enum) != nil { self = .enum(try EnumSchema(from: decoder)) }
        else if type == "object" { self = .object(try ObjectSchema(from: decoder)) }
        else { throw DecodingError.dataCorruptedError(forKey: CodingKeys.type, in: container, debugDescription: "Schema type not known") }
    }
}
