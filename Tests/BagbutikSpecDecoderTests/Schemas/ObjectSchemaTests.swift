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
                    },
                    "vehicle" : {
                        "type" : "string",
                        "deprecated" : true
                    }
                }
            }
        }
        """#
        // When
        let objectSchema = try decodeObjectSchema(from: json)
        // Then
        XCTAssertEqual(objectSchema.name, "SomeModel")
        XCTAssertEqual(objectSchema.properties.count, 2)
        XCTAssertEqual(objectSchema.properties["name"]?.type.description, PropertyType.simple(.string).description)
        XCTAssertEqual(objectSchema.properties["vehicle"]?.type.description, PropertyType.simple(.string).description)
        XCTAssertEqual(objectSchema.properties["vehicle"]?.deprecated, true)
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
                    "arrayOfStrings" : {
                        "type" : "array",
                        "items" : {
                            "type" : "string"
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
        XCTAssertEqual(objectSchema.properties.count, 11)
        XCTAssertEqual(objectSchema.subSchemas.count, 7)

        XCTAssertEqual(objectSchema.properties["arrayOfStrings"]?.type.description, "[String]")

        guard case let .oneOf(arrayOfOneOfSchemasName, _) = objectSchema.subSchemas[0] else { return XCTFail() }
        XCTAssertEqual(arrayOfOneOfSchemasName, "ArrayOfOneOfSchemas")
        guard case let .objectSchema(arrayOfObjectSchema) = objectSchema.subSchemas[1] else { return XCTFail() }
        XCTAssertEqual(arrayOfObjectSchema.name, "ArrayOfSubSchemas")
        guard case let .objectSchema(attributesSchema) = objectSchema.subSchemas[2] else { return XCTFail() }
        XCTAssertEqual(attributesSchema.properties.count, 1)
        guard case let .enumSchema(enumSchema) = objectSchema.subSchemas[3] else { return XCTFail() }
        XCTAssertEqual(enumSchema.name, "EnumSchema")
        guard case let .objectSchema(relationshipsSchema) = objectSchema.subSchemas[4] else { return XCTFail() }
        XCTAssertEqual(relationshipsSchema.name, "Relationships")
        guard case let .oneOf(singleOfOneOfSchemaName, _) = objectSchema.subSchemas[5] else { return XCTFail() }
        XCTAssertEqual(singleOfOneOfSchemaName, "SingleOneOfSchema")
        guard case let .objectSchema(singleObjectSchema) = objectSchema.subSchemas[6] else { return XCTFail() }
        XCTAssertEqual(singleObjectSchema.name, "SingleSubSchema")
    }
    
    func testDecodingOneOfWithSimpleType() throws {
        // Given
        let json = #"""
        {
            "ErrorLinks" : {
                "type" : "object",
                "properties" : {
                    "associated" : {
                        "oneOf" : [ {
                            "type" : "string",
                            "format" : "uri-reference"
                        }, {
                            "type" : "object",
                            "properties" : {
                                "href" : {
                                    "type" : "string",
                                    "format" : "uri-reference"
                                },
                                "meta" : {
                                    "type" : "object",
                                    "properties" : {
                                        "source" : {
                                            "type" : "string"
                                        }
                                    }
                                }
                            }
                        } ]
                    }
                }
            }
        }
        """#
        // When
        let objectSchema = try decodeObjectSchema(from: json)
        // Then
        XCTAssertEqual(objectSchema.name, "ErrorLinks")
        XCTAssertEqual(objectSchema.properties.count, 1)
        XCTAssertEqual(objectSchema.subSchemas.count, 1)
        
        XCTAssertEqual(objectSchema.properties["associated"]?.type.description, "Associated")
        
        guard case let .oneOf(associatedSchemaName, associatedOneOfSchema) = objectSchema.subSchemas[0] else { return XCTFail() }
        XCTAssertEqual(associatedSchemaName, "Associated")
        XCTAssertEqual(associatedOneOfSchema.options.count, 2)
        XCTAssertEqual(associatedOneOfSchema.options[0].typeName, "string")
        XCTAssertEqual(associatedOneOfSchema.options[1].typeName, "Properties")
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
        XCTAssertThrowsError(try decodeObjectSchema(from: json)) {
            // Then
            guard case let .dataCorrupted(context) = $0 as? DecodingError else { return XCTFail() }
            XCTAssertEqual(context.codingPath.last?.stringValue, "data")
            XCTAssertEqual(context.debugDescription, "Property type not known")
        }
    }

    private func decodeObjectSchema(from json: String) throws -> ObjectSchema {
        try jsonDecoder.decode([String: ObjectSchema].self, from: json.data(using: .utf8)!).values.first!
    }
}
