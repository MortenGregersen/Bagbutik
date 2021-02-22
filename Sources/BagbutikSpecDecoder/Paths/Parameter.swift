import Foundation

extension Operation {
    public enum Parameter: Decodable, Equatable {
        case filter(name: String, type: ParameterValueType, required: Bool, description: String)
        case exists(name: String, type: ParameterValueType, description: String)
        case fields(name: String, type: ParameterValueType, description: String)
        case sort(type: ParameterValueType, description: String)
        case limit(name: String, description: String, maximum: Int)
        case include(type: ParameterValueType)
        
        private enum CodingKeys: String, CodingKey {
            case name, description, required, schema
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let name = try container.decode(String.self, forKey: .name)
            let description = try container.decode(String.self, forKey: .description)
            if name.starts(with: "filter") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                let required = try container.decodeIfPresent(Bool.self, forKey: .required) ?? false
                self = .filter(name: Self.getAttribute(forName: name), type: type, required: required, description: description)
            } else if name.starts(with: "exists") {
                let type = ParameterValueType.simple(type: .init(type: "Bool"))
                self = .exists(name: Self.getAttribute(forName: name), type: type, description: description)
            } else if name.starts(with: "fields") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .fields(name: Self.getAttribute(forName: name), type: type, description: description)
            } else if name.starts(with: "sort") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .sort(type: type, description: description)
            } else if name.starts(with: "limit") {
                let limitParameter = try container.decode(LimitParameter.self, forKey: .schema)
                self = .limit(name: Self.getAttribute(forName: name), description: description, maximum: limitParameter.maximum)
            } else if name.starts(with: "include") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .include(type: type)
            } else {
                throw DecodingError.dataCorruptedError(forKey: .name, in: container, debugDescription: "Parameter type not known")
            }
        }
        
        private static func getAttribute(forName name: String) -> String {
            let components = name.components(separatedBy: "[")
            guard components.count == 2 else { return name }
            return components[1].replacingOccurrences(of: "]", with: "")
        }
        
        private struct LimitParameter: Decodable {
            let maximum: Int
            
            enum CodingKeys: String, CodingKey {
                case maximum
            }
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                maximum = try container.decode(Int.self, forKey: .maximum)
            }
        }
        
        public enum ParameterValueType: Decodable, Equatable {
            case simple(type: SimplePropertyType)
            case `enum`(type: String, values: [String])
            
            enum CodingKeys: String, CodingKey {
                case items, type, `enum`
            }
            
            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let type = try container.decode(String.self, forKey: .type)
                if type == "array" {
                    let itemsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .items)
                    let itemType = try itemsContainer.decode(String.self, forKey: .type)
                    if let values = try itemsContainer.decodeIfPresent([String].self, forKey: .enum) {
                        self = .enum(type: itemType.capitalizingFirstLetter(), values: values)
                    } else {
                        self = .simple(type: .init(type: itemType))
                    }
                } else {
                    self = .simple(type: .init(type: type))
                }
            }
        }
    }
}
