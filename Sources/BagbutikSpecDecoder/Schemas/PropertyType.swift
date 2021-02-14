import Foundation

public enum PropertyType: Decodable, Equatable, CustomStringConvertible {
    case simple(SimplePropertyType)
    case constant(String)
    case schemaRef(String)
    case schema(ObjectSchema)
    case enumSchema(EnumSchema)
    case arrayOfSchemaRef(String)
    case arrayOfSubSchema(ObjectSchema)
    case oneOf(name: String, schema: OneOfSchema)
    case arrayOfOneOf(name: String, schema: OneOfSchema)

    public var description: String {
        switch self {
        case .simple(let simplePropertyType):
            return simplePropertyType.description
        case .constant(let constant):
            return constant
        case .schema(let schema):
            return schema.name
        case .enumSchema(let schema):
            return schema.name
        case .schemaRef(let schemaName):
            return schemaName
        case .arrayOfSchemaRef(let schemaName):
            return "[\(schemaName)]"
        case .arrayOfSubSchema(let schema):
            return "[\(schema.name.capitalizingFirstLetter())]"
        case .oneOf(let name, _):
            return name
        case .arrayOfOneOf(let name, _):
            return "[\(name)]"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case format
        case items
        case `enum`
        case ref = "$ref"
        case oneOf
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
                self = .schema(try ObjectSchema(from: decoder))
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
