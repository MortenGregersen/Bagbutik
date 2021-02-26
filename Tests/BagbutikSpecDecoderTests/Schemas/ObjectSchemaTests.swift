@testable import BagbutikSpecDecoder
import XCTest

final class ObjectSchemaTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testDecodingSimple() throws {
        // Given
        let json = #"""
        {
            "SomeModel": {
                "type": "object",
                "properties": {
                    "name": {
                        "type": "string"
                    }
                }
            }
        }
        """#
        // When
        let objectSchema = try decodeObjectSchema(from: json)
        // Then
        XCTAssertEqual(objectSchema.name, "SomeModel")
        XCTAssertEqual(objectSchema.properties.count, 1)
        XCTAssertEqual(objectSchema.properties["name"]?.description, PropertyType.simple(.string).description)
    }

    func testDecodingAllPropertyTypes() throws {
        // Given
        let json = #"""
        {
            "SomeModel" : {
                "type" : "object",
                "title" : "AwesomeName",
                "properties" : {
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
                    },
                    "singleSubSchema" : {
                        "type" : "object",
                        "properties" : {
                            "name" : {
                                "type" : "string"
                            }
                        }
                    },
                    "info" : {
                        "$ref" : "#/components/schemas/AppInfo"
                    },
                    "title" : {
                        "type" : "string"
                    },
                    "enumSchema" : {
                        "type" : "string",
                        "enum" : [ "VALUE_1", "VALUE_2" ]
                    },
                    "arrayOfOneOfSchemas" : {
                        "type" : "array",
                        "items" : {
                            "oneOf" : [ {
                                "$ref" : "#/components/schemas/AppInfoLocalization"
                            } ]
                        }
                    },
                    "singleOneOfSchema" : {
                        "oneOf" : [ {
                            "$ref" : "#/components/schemas/Device"
                        } ]
                    },
                    "links" : {
                        "$ref" : "#/components/schemas/DocumentLinks"
                    },
                    "attributes" : {
                        "type" : "object",
                        "properties" : {
                            "enabled" : {
                                "type" : "boolean"
                            }
                        }
                    },
                    "relationships" : {
                        "type" : "object",
                        "properties" : {
                            "app" : {
                                "type" : "object",
                                "properties" : {
                                    "data" : {
                                        "type" : "object",
                                        "properties" : {
                                            "type" : {
                                                "type" : "string",
                                                "enum" : [ "apps" ]
                                            },
                                            "id" : {
                                                "type" : "string"
                                            }
                                        },
                                        "required" : [ "id", "type" ]
                                    }
                                },
                                "required" : [ "data" ]
                            }
                        },
                        "required" : [ "app" ]
                    }
                },
                "required" : [ "info", "title" ]
            }
        }
        """#
        // When
        let objectSchema = try decodeObjectSchema(from: json)
        // Then
        XCTAssertEqual(objectSchema.name, "AwesomeName")
        XCTAssertEqual(objectSchema.properties.count, 8)
        XCTAssertEqual(objectSchema.subSchemas.count, 7)

        guard case let .oneOf(arrayOfOneOfSchemasName, _) = objectSchema.subSchemas[0],
              case let .objectSchema(arrayOfObjectSchema) = objectSchema.subSchemas[1],
              case let .attributes(attributesSchema) = objectSchema.subSchemas[2],
              case let .enumSchema(enumSchema) = objectSchema.subSchemas[3],
              case let .relationships(relationshipsSchema) = objectSchema.subSchemas[4],
              case let .oneOf(singleOfOneOfSchemaName, _) = objectSchema.subSchemas[5],
              case let .objectSchema(singleObjectSchema) = objectSchema.subSchemas[6]
        else { return XCTFail("Wrong ordering of sub schemas") }
        XCTAssertEqual(arrayOfOneOfSchemasName, "ArrayOfOneOfSchemas")
        XCTAssertEqual(arrayOfObjectSchema.name, "ArrayOfSubSchemas")
        XCTAssertEqual(attributesSchema.properties.count, 1)
        XCTAssertEqual(enumSchema.name, "EnumSchema")
        XCTAssertEqual(relationshipsSchema.name, "Relationships")
        XCTAssertEqual(singleOfOneOfSchemaName, "SingleOneOfSchema")
        XCTAssertEqual(singleObjectSchema.name, "SingleSubSchema")
    }

    func testDecodingUnknownPropertyType() throws {
        // Given
        let json = #"""
        {
            "SomeModel" : {
                "type" : "object",
                "title" : "SomeModel",
                "properties" : {
                    "data" : {
                        "unknown" : "invalid",
                    }
                }
            }
        }
        """#
        // When
        var thrownError: DecodingError?
        XCTAssertThrowsError(try decodeObjectSchema(from: json)) {
            thrownError = $0 as? DecodingError
        }
        // Then
        guard case let .dataCorrupted(context) = thrownError else { throw thrownError! }
        XCTAssertEqual(context.codingPath.last?.stringValue, "data")
        XCTAssertEqual(context.debugDescription, "Property type not known")
    }

    private func decodeObjectSchema(from json: String) throws -> ObjectSchema {
        return try jsonDecoder.decode([String: ObjectSchema].self, from: json.data(using: .utf8)!).values.first!
    }
}
