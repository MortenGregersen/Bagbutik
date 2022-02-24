import Foundation

/// A type for a property
public indirect enum PropertyType: Decodable, Equatable, CustomStringConvertible {
    /// A simple type
    case simple(SimplePropertyType)
    /// A constant type
    case constant(String)
    /// A schema
    case schemaRef(String)
    /// An object schema
    case schema(ObjectSchema)
    /// An enum schema
    case enumSchema(EnumSchema)
    /// An array of schema
    case arrayOfSchemaRef(String)
    /// An array of object schema
    case arrayOfSubSchema(ObjectSchema)
    /// A one of schema
    case oneOf(name: String, schema: OneOfSchema)
    /// An array of one of schema
    case arrayOfOneOf(name: String, schema: OneOfSchema)
    /// A dictionary with values of type
    case dictionary(PropertyType)

    /// Returns true if the type is a constant (to minimize pattern matching code elsewhere)
    public var isConstant: Bool {
        if case .constant = self {
            return true
        }
        return false
    }
    
    /// Returns true if the type is a simple data type (to minimize pattern matching code elsewhere)
    public var isSimple: Bool {
        if case .simple(_) = self {
            return true
        }
        return false
    }

    public var description: String {
        switch self {
        case .simple(let simplePropertyType):
            return simplePropertyType.description
        case .constant(let _):
            return SimplePropertyType.string.description
        case .schemaRef(let schemaName):
            return schemaName
        case .schema(let schema):
            return schema.name
        case .enumSchema(let schema):
            return schema.name
        case .arrayOfSchemaRef(let schemaName):
            return "[\(schemaName)]"
        case .arrayOfSubSchema(let schema):
            return "[\(schema.name)]"
        case .oneOf(let name, _):
            return name
        case .arrayOfOneOf(let name, _):
            return "[\(name)]"
        case .dictionary(let propertyType):
            return "[String: \(propertyType.description)]"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case format
        case items
        case `enum`
        case ref = "$ref"
        case oneOf
        case additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if var type = try container.decodeIfPresent(String.self, forKey: .type) {
            if type == "array" {
                if let schema = try? container.decodeIfPresent(ObjectSchema.self, forKey: .items) {
                    self = .arrayOfSubSchema(schema)
                } else if case .schemaRef(let schemaName) = try? container.decodeIfPresent(PropertyType.self, forKey: .items) {
                    self = .arrayOfSchemaRef(schemaName)
                } else if let oneOfOptions = try container
                    .nestedContainer(keyedBy: CodingKeys.self, forKey: .items)
                    .decodeIfPresent([OneOfOption].self, forKey: .oneOf)?
                    .reduce(into: [OneOfOption](), { uniqueOptions, option in
                        if !uniqueOptions.contains(option) {
                            uniqueOptions.append(option)
                        }
                    }),
                    let oneOfName = container.codingPath.last?.stringValue.capitalizingFirstLetter()
                {
                    self = .arrayOfOneOf(name: oneOfName, schema: OneOfSchema(options: oneOfOptions))
                } else {
                    self = try container.decode(PropertyType.self, forKey: .items)
                }
            } else if type == "object" {
                if let dictionaryValueType = try container.decodeIfPresent(PropertyType.self, forKey: .additionalProperties) {
                    self = .dictionary(dictionaryValueType)
                } else {
                    self = .schema(try ObjectSchema(from: decoder))
                }
            } else {
                if type == "number" { type = "Double" }
                if type == "string", let format = try? container.decodeIfPresent(String.self, forKey: .format), format == "date-time" {
                    type = "Date"
                }
                if type == "string", let enumSchema = try? EnumSchema(from: decoder) {
                    if enumSchema.cases.filter({ $0.value.first!.isLowercase }).count == 1 {
                        self = .constant(enumSchema.cases[0].value)
                    } else {
                        self = .enumSchema(enumSchema)
                    }
                } else {
                    self = .simple(SimplePropertyType(type: type))
                }
            }
        } else if let schemaPath = try container.decodeIfPresent(String.self, forKey: .ref),
                  let schemaName = schemaPath.components(separatedBy: "/").last
        {
            self = .schemaRef(schemaName)
        } else if let oneOfOptions = try container.decodeIfPresent([OneOfOption].self, forKey: .oneOf),
                  let oneOfName = container.codingPath.last?.stringValue.capitalizingFirstLetter()
        {
            self = .oneOf(name: oneOfName, schema: OneOfSchema(options: oneOfOptions))
        } else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.type, in: container, debugDescription: "Schema type not known")
        }
    }
}
