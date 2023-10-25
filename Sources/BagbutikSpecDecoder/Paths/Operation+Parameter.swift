import Foundation

public extension Operation {
    /// A parameter that can be sent with an operation
    enum Parameter: Decodable, Equatable {
        /// A parameter that filter the data in the response
        case filter(name: String, type: ParameterValueType, required: Bool, documentation: String)
        /// A parameter that checks for existance of a property
        case exists(name: String, type: ParameterValueType, documentation: String)
        /// A parameter that lists the desired fields in the response
        case fields(name: String, type: ParameterValueType, deprecated: Bool, documentation: String)
        /// A parameter that sorts the data in the response
        case sort(type: ParameterValueType, documentation: String)
        /// A parameter that limits the number of elements in the response
        case limit(name: String, documentation: String, maximum: Int)
        /// A parameter that indicates which related types shoudl be included in the response
        case include(type: ParameterValueType)
        /// A parameter that is custom for the operation
        case custom(name: String, type: ParameterValueType, documentation: String)
        
        private enum CodingKeys: String, CodingKey {
            case name, description, required, deprecated, schema
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let name = try container.decode(String.self, forKey: .name)
            let documentation = try container.decode(String.self, forKey: .description)
            if name.starts(with: "filter") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                let required = try container.decodeIfPresent(Bool.self, forKey: .required) ?? false
                self = .filter(name: Self.getAttribute(forName: name), type: type, required: required, documentation: documentation)
            } else if name.starts(with: "exists") {
                let type = ParameterValueType.simple(type: .boolean)
                self = .exists(name: Self.getAttribute(forName: name), type: type, documentation: documentation)
            } else if name.starts(with: "fields") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                let deprecated = try container.decodeIfPresent(Bool.self, forKey: .deprecated) ?? false
                self = .fields(name: Self.getAttribute(forName: name), type: type, deprecated: deprecated, documentation: documentation)
            } else if name.starts(with: "sort") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .sort(type: type, documentation: documentation)
            } else if name.starts(with: "limit") {
                let limitParameter = try container.decode(LimitParameter.self, forKey: .schema)
                self = .limit(name: Self.getAttribute(forName: name), documentation: documentation, maximum: limitParameter.maximum)
            } else if name.starts(with: "include") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .include(type: type)
            } else {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .custom(name: name, type: type, documentation: documentation)
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
        
        /// The type of value of a parameter
        public enum ParameterValueType: Decodable, Equatable {
            /// A simple value type
            case simple(type: SimplePropertyType)
            /// An enum value type
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
