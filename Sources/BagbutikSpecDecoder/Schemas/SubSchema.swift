import Foundation

/// A schema contained in another schema
public indirect enum SubSchema: Equatable {
    /// An object schema
    case objectSchema(ObjectSchema)
    /// An enum schema
    case enumSchema(EnumSchema)
    /// An one of schema
    case oneOf(name: String, schema: OneOfSchema)
    /// An attributes schema
    case attributes(ObjectSchema)
    /// A relationships schema
    case relationships(ObjectSchema)
    
    /// The name of the schema
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
