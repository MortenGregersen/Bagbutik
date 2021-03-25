import Foundation

/// A reprensetation of an enum case with an associated value
public enum OneOfOption: Decodable, Equatable {
    /// An object schema
    case objectSchema(ObjectSchema)
    /// A name of a schema
    case schemaRef(String)
    
    /// The name of the associated schema
    public var schemaName: String {
        switch self {
        case .objectSchema(let objectSchema):
            return objectSchema.name
        case .schemaRef(let schemaName):
            return schemaName
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case ref = "$ref"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let schemaPath = try container.decodeIfPresent(String.self, forKey: .ref),
            let schemaName = schemaPath.components(separatedBy: "/").last {
            self = .schemaRef(schemaName)
        } else if let type = try container.decodeIfPresent(String.self, forKey: .type),
            type == "object" {
            self = .objectSchema(try ObjectSchema(from: decoder))
        } else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.type, in: container, debugDescription: "OneOf option not known")
        }
    }
}
