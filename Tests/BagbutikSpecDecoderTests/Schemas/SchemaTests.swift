@testable import BagbutikSpecDecoder
import XCTest

final class SchemaTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testDecodingObjectSchema() throws {
        // Given
        let json = #"""
        {
            "objectSchema" : {
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
        let schemas = try jsonDecoder.decode([String: Schema].self, from: json.data(using: .utf8)!)
        // Then
        guard let schema = schemas.values.first, case let .object(objectSchema) = schema else {
            return XCTFail("Wrong schema type")
        }
        XCTAssertEqual(schema.name, "ObjectSchema")
        XCTAssertEqual(objectSchema.name, "ObjectSchema")
        XCTAssertEqual(objectSchema.properties.count, 1)
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
        let schemas = try jsonDecoder.decode([String: Schema].self, from: json.data(using: .utf8)!)
        // Then
        guard let schema = schemas.values.first, case let .enum(enumSchema) = schema else {
            return XCTFail("Wrong schema type")
        }
        XCTAssertEqual(schema.name, "EnumSchema")
        XCTAssertEqual(enumSchema.name, "EnumSchema")
        XCTAssertEqual(enumSchema.cases.count, 2)
    }
}
