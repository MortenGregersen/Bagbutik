@testable import BagbutikSpecDecoder
import XCTest

final class ParameterTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testFilter() throws {
        // Given
        let json = #"""
        [
            {
                "name" : "filter[platforms]",
                "description" : "filter by attribute 'platforms'",
                "schema" : {
                    "type" : "array",
                    "items" : {
                        "type" : "string",
                        "enum" : [ "IOS", "MAC_OS", "TV_OS" ]
                    }
                },
                "required" : true
            },
            {
                "name" : "filter[app]",
                "description" : "filter by id(s) of related 'app'",
                "schema" : {
                    "type" : "array",
                    "items" : {
                        "type" : "string"
                    }
                }
            }
        ]
        """#
        // When
        let paramaters = try jsonDecoder.decode([BagbutikSpecDecoder.Operation.Parameter].self, from: json.data(using: .utf8)!)
        // Then
        guard case let .filter(name1, type1, required1, description1) = paramaters[0],
              case let .filter(name2, type2, required2, description2) = paramaters[1] else { return XCTFail("Wrong parameter type") }

        XCTAssertEqual(name1, "platforms")
        XCTAssertEqual(type1, .enum(type: "String", values: ["IOS", "MAC_OS", "TV_OS"]))
        XCTAssertEqual(required1, true)
        XCTAssertEqual(description1, "filter by attribute 'platforms'")

        XCTAssertEqual(name2, "app")
        XCTAssertEqual(type2, .simple(type: .string))
        XCTAssertEqual(required2, false)
        XCTAssertEqual(description2, "filter by id(s) of related 'app'")
    }

    func testExists() throws {
        // Given
        let json = #"""
        {
            "name" : "exists[parent]",
            "description" : "filter by existence or non-existence of related 'parent'",
            "schema" : {
                "type" : "array",
                "items" : {
                    "type" : "string"
                }
            },
            "required" : false
        }
        """#
        // When
        let paramater = try jsonDecoder.decode(BagbutikSpecDecoder.Operation.Parameter.self, from: json.data(using: .utf8)!)
        // Then
        guard case let .exists(name, type, description) = paramater else { return XCTFail("Wrong parameter type") }
        XCTAssertEqual(name, "parent")
        XCTAssertEqual(type, .simple(type: .boolean))
        XCTAssertEqual(description, "filter by existence or non-existence of related 'parent'")
    }

    func testFields() throws {
        // Given
        let json = #"""
        {
            "name" : "fields[territories]",
            "description" : "the fields to include for returned resources of type territories",
            "schema" : {
                "type" : "array",
                "items" : {
                    "type" : "string",
                    "enum" : [ "currency" ]
                }
            },
            "required" : false
        }
        """#
        // When
        let paramater = try jsonDecoder.decode(BagbutikSpecDecoder.Operation.Parameter.self, from: json.data(using: .utf8)!)
        // Then
        guard case let .fields(name, type, description) = paramater else { return XCTFail("Wrong parameter type") }
        XCTAssertEqual(name, "territories")
        XCTAssertEqual(type, .enum(type: "String", values: ["currency"]))
        XCTAssertEqual(description, "the fields to include for returned resources of type territories")
    }

    func testSort() throws {
        // Given
        let json = #"""
        {
            "name" : "sort",
            "description" : "comma-separated list of sort expressions; resources will be sorted as specified",
            "schema" : {
                "type" : "array",
                "items" : {
                    "type" : "string",
                    "enum" : [ "version", "-version" ]
                }
            },
            "required" : false
        }
        """#
        // When
        let paramater = try jsonDecoder.decode(BagbutikSpecDecoder.Operation.Parameter.self, from: json.data(using: .utf8)!)
        // Then
        guard case let .sort(type, description) = paramater else { return XCTFail("Wrong parameter type") }
        XCTAssertEqual(type, .enum(type: "String", values: ["version", "-version"]))
        XCTAssertEqual(description, "comma-separated list of sort expressions; resources will be sorted as specified")
    }

    func testLimit() throws {
        // Given
        let json = #"""
        {
            "name" : "limit",
            "description" : "maximum resources per page",
            "schema" : {
                "type" : "integer",
                "maximum" : 200
            }
        }
        """#
        // When
        let paramater = try jsonDecoder.decode(BagbutikSpecDecoder.Operation.Parameter.self, from: json.data(using: .utf8)!)
        // Then
        guard case let .limit(name, description, maximum) = paramater else { return XCTFail("Wrong parameter type") }
        XCTAssertEqual(name, "limit")
        XCTAssertEqual(description, "maximum resources per page")
        XCTAssertEqual(maximum, 200)
    }
    
    func testInclude() throws {
        // Given
        let json = #"""
        {
            "name" : "include",
            "description" : "comma-separated list of relationships to include",
            "schema" : {
                "type" : "array",
                "items" : {
                    "type" : "string",
                    "enum" : [ "app", "builds" ]
                }
            },
            "required" : false
        }
        """#
        // When
        let paramater = try jsonDecoder.decode(BagbutikSpecDecoder.Operation.Parameter.self, from: json.data(using: .utf8)!)
        // Then
        guard case let .include(type) = paramater else { return XCTFail("Wrong parameter type") }
        XCTAssertEqual(type, .enum(type: "String", values: ["app", "builds"]))
    }
    
    func testSimpleParameterValueType() throws {
        // Given
        let json = #"""
        {
            "type" : "integer",
        }
        """#
        // When
        let paramaterValueType = try jsonDecoder.decode(BagbutikSpecDecoder.Operation.Parameter.ParameterValueType.self, from: json.data(using: .utf8)!)
        // Then
        guard case let .simple(type) = paramaterValueType else { return XCTFail("Wrong parameter type") }
        XCTAssertEqual(type, .integer)
    }
}
