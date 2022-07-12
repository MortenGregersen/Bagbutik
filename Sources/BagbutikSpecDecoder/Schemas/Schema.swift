import Foundation

/// A wrapper for the different schema types
public enum Schema: Decodable, Equatable {
    /// An enum schema
    case `enum`(EnumSchema)
    /// An object schema
    case object(ObjectSchema)
    /// A binary schema
    case binary(BinarySchema)
    /// A plain text schema
    case plainText(PlainTextSchema)
    
    /// The name of the schema
    public var name: String {
        switch self {
        case .enum(let enumSchema):
            return enumSchema.name
        case .object(let objectSchema):
            return objectSchema.name
        case .binary(let binarySchema):
            return binarySchema.name
        case .plainText(let plainTextSchema):
            return plainTextSchema.name
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        if try container.decodeIfPresent([String].self, forKey: .enum) != nil { self = .enum(try EnumSchema(from: decoder)) }
        else if type == "object" { self = .object(try ObjectSchema(from: decoder)) }
        else if type == "string" {
            if let format = try container.decodeIfPresent(String.self, forKey: .format) {
                guard format == "binary" else {
                    throw DecodingError.dataCorruptedError(forKey: CodingKeys.format, in: container, debugDescription: "Schema has format, but it is not 'binary'")
                }
                self = .binary(try BinarySchema(from: decoder))
            } else {
                self = .plainText(try PlainTextSchema(from: decoder))
            }
        } else { throw DecodingError.dataCorruptedError(forKey: CodingKeys.type, in: container, debugDescription: "Schema type '\(type)' not known") }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case format
        case `enum`
    }
}
