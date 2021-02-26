import Foundation

public enum OperationError: Error {
    case missingDocumentation(operationId: String)
    case unknownOperationIdPattern(operationId: String)
}

public struct Operation: Decodable {
    public let name: String
    public let documentation: Documentation
    public let method: HTTPMethod
    public let parameters: [Parameter]?
    public let requestBody: RequestBody?
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
        case content, applicationJson = "application/json", schema, ref = "$ref", description
    }
    
    public init(name: String, documentation: Documentation, method: HTTPMethod, parameters: [Parameter]? = nil, requestBody: RequestBody? = nil, successResponseType: String, errorResponseType: String) {
        self.name = name
        self.documentation = documentation
        self.method = method
        self.parameters = parameters
        self.requestBody = requestBody
        self.successResponseType = successResponseType
        self.errorResponseType = errorResponseType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let operationId = try container.decode(String.self, forKey: .operationId)
        let name = try Self.getName(forId: operationId)
        let documentation = try Self.getDocumentation(forId: operationId)
        let method = HTTPMethod(rawValue: container.codingPath.last!.stringValue)!
        let parameters = try container.decodeIfPresent([Parameter].self, forKey: .parameters)
        let requestBody: RequestBody?
        if let requestBodyContainter = try? container.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .requestBody),
           let contentContainter = try? requestBodyContainter.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .content),
           let applicationJsonContainter = try? contentContainter.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .applicationJson),
           let schemaContainer = try? applicationJsonContainter.nestedContainer(keyedBy: RequestBodyCodingKeys.self, forKey: .schema),
           let requestBodyName = try? schemaContainer.decode(String.self, forKey: .ref).components(separatedBy: "/").last,
           let requestBodyDescription = try? requestBodyContainter.decode(String.self, forKey: .description)
        {
            requestBody = .init(name: requestBodyName, description: requestBodyDescription)
        } else {
            requestBody = nil
        }
        let responsesContainer = try container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: .responses)
        let successCode = responsesContainer.allKeys.first { $0.stringValue.hasPrefix("2") }!.stringValue
        let successResponseType = try Self.responseType(forCode: successCode, in: responsesContainer)
        let errorCode = responsesContainer.allKeys.first { $0.stringValue.hasPrefix("4") }!.stringValue
        let errorResponseType = try Self.responseType(forCode: errorCode, in: responsesContainer)
        self.init(name: name, documentation: documentation, method: method, parameters: parameters, requestBody: requestBody, successResponseType: successResponseType, errorResponseType: errorResponseType)
    }
    
    internal static func getName(forId operationId: String) throws -> String {
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
        throw OperationError.unknownOperationIdPattern(operationId: operationId)
    }
    
    internal static func getDocumentation(forId operationId: String) throws -> Documentation {
        guard let documentation = Documentation.allDocumentation[operationId] else {
            throw OperationError.missingDocumentation(operationId: operationId)
        }
        return documentation
    }
    
    internal static func singularize(_ word: String) -> String {
        guard word.hasSuffix("s") else { return word }
        if word.hasSuffix("ies") { return word.dropLast(3).appending("y") }
        return String(word.prefix(upTo: word.index(before: word.endIndex)))
    }
    
    private static func responseType(forCode statusCode: String, in responsesContainer: KeyedDecodingContainer<DynamicCodingKeys>) throws -> String {
        let contentContainer = try? responsesContainer
            .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: statusCode)!)
            .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "content")!)
        if let jsonContainer = try? contentContainer?.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "application/json")!) {
            return try jsonContainer
                .nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "schema")!)
                .decode(String.self, forKey: DynamicCodingKeys(stringValue: "$ref")!)
                .components(separatedBy: "/")
                .last!
        } else if let _ = try? contentContainer?.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: DynamicCodingKeys(stringValue: "gzip")!) {
            return "GzipResponse"
        }
        return "EmptyResponse"
    }
}
