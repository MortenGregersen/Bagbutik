@testable import BagbutikSpecDecoder
import XCTest

final class PropertyTypeTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testDecodingSimple() throws {
        // Given
        let json = #"""
        {
            "title" : {
                "type" : "string"
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .simple(simplePropertyType) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, simplePropertyType.description)
        XCTAssertEqual(simplePropertyType, SimplePropertyType.string)
    }

    func testDecodingConstant() throws {
        // Given
        let json = #"""
        {
            "groupType" : {
                "type" : "string",
                "enum" : [ "users" ]
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .constant(constantValue) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "String")
        XCTAssertEqual(constantValue, "users")
    }
    
    func testDecodingSchemaRef() throws {
        // Given
        let json = #"""
        {
            "info" : {
                "$ref" : "#/components/schemas/AppInfo"
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .schemaRef(schemaName) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "AppInfo")
        XCTAssertEqual(schemaName, "AppInfo")
    }
    
    func testDecodingSchema() throws {
        // Given
        let json = #"""
        {
            "singleSubSchema" : {
                "type" : "object",
                "properties" : {
                    "name" : {
                        "type" : "string"
                    }
                }
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .schema(schema) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "SingleSubSchema")
        XCTAssertEqual(schema.name, "SingleSubSchema")
    }
    
    func testDecodingEnumSchema() throws {
        // Given
        let json = #"""
        {
            "enumSchema" : {
                "type" : "string",
                "enum" : [ "VALUE_1", "VALUE_2" ]
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .enumSchema(schema) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "EnumSchema")
        XCTAssertEqual(schema.name, "EnumSchema")
    }

    func testDecodingArrayOfSchemaRef() throws {
        // Given
        let json = #"""
        {
            "arrayOfSubSchemas" : {
                "type" : "array",
                "items" : {
                    "$ref" : "#/components/schemas/AppInfo"
                }
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .arrayOfSchemaRef(schemaName) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "[AppInfo]")
        XCTAssertEqual(schemaName, "AppInfo")
    }
    
    func testDecodingArrayOfSubSchema() throws {
        // Given
        let json = #"""
        {
            "arrayOfSubSchemas" : {
                "type" : "array",
                "items" : {
                    "type" : "object",
                    "properties" : {
                        "id" : {
                            "type" : "string"
                        }
                    }
                }
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .arrayOfSubSchema(schema) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "[ArrayOfSubSchemas]")
        XCTAssertEqual(schema.name, "ArrayOfSubSchemas")
    }
    
    func testDecodingOneOf() throws {
        // Given
        let json = #"""
        {
            "singleOneOfSchema" : {
                "oneOf" : [ {
                    "$ref" : "#/components/schemas/Device"
                } ]
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .oneOf(name, _) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "SingleOneOfSchema")
        XCTAssertEqual(name, "SingleOneOfSchema")
    }
    
    func testDecodingArrayOfOneOf() throws {
        // Given
        let json = #"""
        {
            "arrayOfOneOfSchemas" : {
                "type" : "array",
                "items" : {
                    "oneOf" : [ {
                        "$ref" : "#/components/schemas/AppInfoLocalization"
                    } ]
                }
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .arrayOfOneOf(name, _) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "[ArrayOfOneOfSchemas]")
        XCTAssertEqual(name, "ArrayOfOneOfSchemas")
    }
    
    func testDecodingDictionaryOfDictionaries() throws {
        // Given
        let json = #"""
        {
            "dictionaryOfDictionaries" : {
                "type" : "object",
                "additionalProperties" : {
                    "type" : "object",
                    "additionalProperties" : {
                        "type" : "string"
                    }
                }
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "[String: [String: String]]")
    }
    
    func testDecodingDate() throws {
        // Given
        let json = #"""
        {
            "uploadedDate" : {
                "type" : "string",
                "format" : "date-time"
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .simple(simplePropertyType) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "Date")
        XCTAssertEqual(simplePropertyType.type, "Date")
    }
    
    func testDecodingNumber() throws {
        // Given
        let json = #"""
        {
            "weight" : {
                "type" : "number",
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .simple(simplePropertyType) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(propertyType.description, "Double")
        XCTAssertEqual(simplePropertyType.type, "Double")
    }
    
    func testDecodingNoProperties() throws {
        // Given
        let json = #"""
        {
            "xcodeMetrics" : {
                "type" : "object"
            },
            "days" : {
                "type" : "array",
                "items" : {
                    "type" : "string",
                    "enum" : [ "SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" ]
                }
            }
        }
        """#
        // When
        let propertyTypes = try jsonDecoder.decode([String: PropertyType].self, from: json.data(using: .utf8)!)
        // Then
        guard let propertyType = propertyTypes.values.first, case let .schema(schema) = propertyType else {
            return XCTFail("Wrong property type")
        }
        XCTAssertEqual(schema.name, "XcodeMetrics")
        XCTAssertEqual(schema.properties.count, 0)
    }
}
