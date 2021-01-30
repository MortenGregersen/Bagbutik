import Foundation

public enum OneOfOption: Decodable, Equatable {
    case objectSchema(ObjectSchema)
    case schemaRef(String)
    
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
    
    public static func == (lhs: OneOfOption, rhs: OneOfOption) -> Bool {
        switch lhs {
        case .schemaRef(let schemaName):
            if case .schemaRef(let otherSchemaName) = rhs {
                return schemaName == otherSchemaName
            }
            return false
        case .objectSchema(let objectSchema):
            if case .objectSchema(let otherObjectSchema) = rhs {
                return objectSchema.name == otherObjectSchema.name
            }
            return false
        }
    }
}
