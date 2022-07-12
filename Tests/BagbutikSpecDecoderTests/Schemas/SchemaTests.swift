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

    func testDecodingObjectSchema_NoProperties() throws {
        // Given
        let json = #"""
        {
            "xcodeMetrics" : {
              "type" : "object"
            }
        }
        """#
        // When
        let schemas = try jsonDecoder.decode([String: Schema].self, from: json.data(using: .utf8)!)
        // Then
        guard let schema = schemas.values.first, case let .object(objectSchema) = schema else {
            return XCTFail("Wrong schema type")
        }
        XCTAssertEqual(schema.name, "XcodeMetrics")
        XCTAssertEqual(objectSchema.name, "XcodeMetrics")
        XCTAssertEqual(objectSchema.properties.count, 0)
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

    func testDecodingBinarySchema() throws {
        // Given
        let json = #"""
        {
            "gzip" : {
                "type" : "string",
                "format" : "binary"
            }
        }
        """#
        // When
        let schemas = try jsonDecoder.decode([String: Schema].self, from: json.data(using: .utf8)!)
        // Then
        guard let schema = schemas.values.first, case let .binary(binarySchema) = schema else {
            return XCTFail("Wrong schema type")
        }
        XCTAssertEqual(schema.name, "Gzip")
        XCTAssertEqual(binarySchema.name, "Gzip")
    }

    func testErrorOnDecodingInvalidFormat() throws {
        // Given
        let json = #"""
        {
            "gzip" : {
                "type" : "string",
                "format" : "invalid"
            }
        }
        """#
        // When
        XCTAssertThrowsError(try jsonDecoder.decode([String: Schema].self, from: json.data(using: .utf8)!)) {
            guard case let .dataCorrupted(context) = $0 as! DecodingError else { return XCTFail() }
            XCTAssertEqual(context.debugDescription, "Schema type not known")
        }
    }

    func testDecodingPlainTextSchema() throws {
        // Given
        let json = #"""
        {
            "csv" : {
                "type" : "string",
            }
        }
        """#
        // When
        let schemas = try jsonDecoder.decode([String: Schema].self, from: json.data(using: .utf8)!)
        // Then
        guard let schema = schemas.values.first, case let .plainText(plainTextSchema) = schema else {
            return XCTFail("Wrong schema type")
        }
        XCTAssertEqual(schema.name, "Csv")
        XCTAssertEqual(plainTextSchema.name, "Csv")
    }
}
