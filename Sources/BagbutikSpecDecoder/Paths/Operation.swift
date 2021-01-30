import Foundation

public struct Operation: Decodable {
    public let name: String
    public let documentation: Documentation
    public let method: HTTPMethod
    public let parameters: [Parameter]?
    public let requestBody: String?
    public let successResponseType: String
    public let errorResponseType: String
    
    private static let getInstanceRegex = try! NSRegularExpression(pattern: "(.*)-get_instance", options: [])
    private static let getCollectionRegex = try! NSRegularExpression(pattern: "(.*)-get_collection", options: [])
    private static let getToOneRelationshipRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-get_to_one_relationship", options: [])
    private static let getToManyRelationshipRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-get_to_many_relationship", options: [])
    private static let getToOneRelatedRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-get_to_one_related", options: [])
    private static let getToManyRelatedRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-get_to_many_related", options: [])
    private static let createInstanceRegex = try! NSRegularExpression(pattern: "(.*)-create_instance", options: [])
    private static let createToManyRelationshipRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-create_to_many_relationship", options: [])
    private static let replaceToManyRelationshipRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-replace_to_many_relationship", options: [])
    private static let updateInstanceRegex = try! NSRegularExpression(pattern: "(.*)-update_instance", options: [])
    private static let updateToOneRelationshipRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-update_to_one_relationship", options: [])
    private static let deleteInstanceRegex = try! NSRegularExpression(pattern: "(.*)-delete_instance", options: [])
    private static let deleteToManyRelationshipRegex = try! NSRegularExpression(pattern: "(.*)-(.*)-delete_to_many_relationship", options: [])
    
    enum CodingKeys: String, CodingKey {
        case operationId, parameters, requestBody, responses
    }
    
    enum RequestBodyCodingKeys: String, CodingKey {
        case content, applicationJson = "application/json", schema, ref = "$ref"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let operationId = try container.decode(String.self, forKey: .operationId)
        name = Self.name(forId: operationId)
        documentation = Self.documentation(forId: operationId)
        method = HTTPMethod(rawValue: container.codingPath.last!.stringValue)!
        parameters = try container.decodeIfPresent([Parameter].self, forKey: .parameters)
        if let requestBodyContainter = try? container.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .requestBody),
           let contentContainter = try? requestBodyContainter.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .content),
           let applicationJsonContainter = try? contentContainter.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .applicationJson),
           let schemaContainer = try? applicationJsonContainter.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .schema)
        {
            requestBody = try schemaContainer.decodeIfPresent(String.self, forKey: .ref)?.components(separatedBy: "/").last
        } else {
            requestBody = nil
        }
        let responsesContainer = try container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: .responses)
        let successCode = responsesContainer.allKeys.first { $0.stringValue.hasPrefix("2") }!.stringValue
        successResponseType = try Self.responseType(forCode: successCode, in: responsesContainer)
        let errorCode = responsesContainer.allKeys.first { $0.stringValue.hasPrefix("4") }!.stringValue
        errorResponseType = try Self.responseType(forCode: errorCode, in: responsesContainer)
    }
    
    private static func name(forId operationId: String) -> String {
        let range = NSRange(location: 0, length: operationId.utf16.count)
        if let result = getInstanceRegex.firstMatch(in: operationId, options: [], range: range) {
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "get\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = getCollectionRegex.firstMatch(in: operationId, options: [], range: range) {
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            if operationId == "salesReports-get_collection" || operationId == "financeReports-get_collection" {
                return "get\(name.capitalizingFirstLetter())"
            }
            return "list\(name.capitalizingFirstLetter())"
        } else if let result = getToOneRelationshipRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "get\(singularize(relationship.capitalizingFirstLetter()))IdsFor\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = getToManyRelationshipRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "list\(singularize(relationship.capitalizingFirstLetter()))IdsFor\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = getToOneRelatedRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "get\(relationship.capitalizingFirstLetter())For\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = getToManyRelatedRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "list\(relationship.capitalizingFirstLetter())For\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = createInstanceRegex.firstMatch(in: operationId, options: [], range: range) {
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "create\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = createToManyRelationshipRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "create\(relationship.capitalizingFirstLetter())For\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = replaceToManyRelationshipRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "replace\(relationship.capitalizingFirstLetter())For\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = updateInstanceRegex.firstMatch(in: operationId, options: [], range: range) {
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "update\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = updateToOneRelationshipRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "update\(relationship.capitalizingFirstLetter())For\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = deleteInstanceRegex.firstMatch(in: operationId, options: [], range: range) {
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "delete\(singularize(name.capitalizingFirstLetter()))"
        } else if let result = deleteToManyRelationshipRegex.firstMatch(in: operationId, options: [], range: range) {
            let relationship = String(operationId[Range(result.range(at: 2), in: operationId)!])
            let name = String(operationId[Range(result.range(at: 1), in: operationId)!])
            return "delete\(relationship.capitalizingFirstLetter())For\(singularize(name.capitalizingFirstLetter()))"
        }
        fatalError("Can't find name for operation: \(operationId)")
    }
    
    private static func documentation(forId operationId: String) -> Documentation {
        guard let documentation = Documentation.allDocumentation[operationId] else {
            fatalError("Can't find name for operation: \(operationId)")
        }
        return documentation
    }
    
    private static func singularize(_ word: String) -> String {
        guard word.hasSuffix("s") else { return word }
        if word.hasSuffix("ies") { return word.dropLast(3).appending("y") }
        return String(word.prefix(upTo: word.index(before: word.endIndex)))
    }
    
    private static func responseType(forCode statusCode: String, in responsesContainer: KeyedDecodingContainer<DynamicCodingKeys>) throws -> String {
        if let contentContainer = try? responsesContainer
            .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: statusCode)!)
            .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "content")!)
        {
            if let jsonContainer = try? contentContainer
                .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "application/json")!)
            {
                return try jsonContainer
                    .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "schema")!)
                    .decode(String.self, forKey: DynamicCodingKeys(stringValue: "$ref")!)
                    .components(separatedBy: "/")
                    .last!
            } else if let _ = try? contentContainer
                .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "gzip")!)
            {
                return "GzipResponse"
            }
        }
        return "EmptyResponse"
    }
    
    public enum Parameter: Decodable {
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
                self = .filter(name: Self.attribute(forName: name), type: type, required: required, description: description)
            } else if name.starts(with: "exists") {
                let type = ParameterValueType.simple(type: .init(type: "Bool"))
                self = .exists(name: Self.attribute(forName: name), type: type, description: description)
            } else if name.starts(with: "fields") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .fields(name: Self.attribute(forName: name), type: type, description: description)
            } else if name.starts(with: "sort") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .sort(type: type, description: description)
            } else if name.starts(with: "limit") {
                let limitParameter = try container.decode(LimitParameter.self, forKey: .schema)
                self = .limit(name: Self.attribute(forName: name), description: description, maximum: limitParameter.maximum)
            } else if name.starts(with: "include") {
                let type = try container.decode(ParameterValueType.self, forKey: .schema)
                self = .include(type: type)
            } else {
                throw DecodingError.dataCorruptedError(forKey: .name, in: container, debugDescription: "Parameter type not known")
            }
        }
        
        private static func attribute(forName name: String) -> String {
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
        
        public enum ParameterValueType: Decodable {
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
