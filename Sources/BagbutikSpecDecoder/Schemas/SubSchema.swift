import Foundation

public enum SubSchema: Equatable {
    case objectSchema(ObjectSchema)
    case enumSchema(EnumSchema)
    case oneOf(name: String, schema: OneOfSchema)
    case attributes(ObjectSchema)
    case relationships(ObjectSchema)
    
    public var name: String {
        switch self {
        case .objectSchema(let objectSchema):
            return objectSchema.name
        case .enumSchema(let enumSchema):
            return enumSchema.name
        case .oneOf(let name, _):
            return name
        case .attributes:
            return "Attributes"
        case .relationships:
            return "Relationships"
        }
    }
}
