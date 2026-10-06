@testable import BagbutikSpecDecoder
import XCTest

final class ComposedSchemasTests: XCTestCase {
    func testCompositionPreservesInheritedAndAdditionalProperties() throws {
        let components = try decode(#"""
        {
            "Common": {
                "type": "object",
                "properties": { "fileName": { "type": "string" } },
                "required": ["fileName"]
            },
            "AwaitingUpload": {
                "title": "AwaitingUpload",
                "allOf": [
                    { "$ref": "#/components/schemas/Common" },
                    {
                        "type": "object",
                        "properties": {
                            "uploadOperations": {
                                "type": "array",
                                "items": { "$ref": "#/components/schemas/UploadOperation" }
                            }
                        },
                        "required": ["uploadOperations", "fileName"]
                    }
                ]
            },
            "Accepted": {
                "allOf": [
                    { "$ref": "#/components/schemas/AwaitingUpload" },
                    { "type": "object" }
                ]
            }
        }
        """#)
        for name in ["AwaitingUpload", "Accepted"] {
            guard case .object(let object) = components.schemas[name] else {
                return XCTFail("Expected composed object \(name)")
            }
            XCTAssertEqual(object.name, name)
            XCTAssertEqual(object.url, "https://developer.apple.com/documentation/appstoreconnectapi/\(name.lowercased())")
            XCTAssertEqual(object.properties["fileName"]?.type, .simple(.string()))
            XCTAssertEqual(object.properties["uploadOperations"]?.type, .arrayOfSchemaRef("UploadOperation"))
            XCTAssertEqual(object.requiredProperties, ["fileName", "uploadOperations"])
        }
    }

    func testInvalidCompositionsThrow() throws {
        let definitions = [
            ##""Broken": { "allOf": [] }"##,
            ##""Broken": { "allOf": [{ "$ref": "#/components/schemas/Missing" }] }"##,
            ##""Broken": { "allOf": [{ "$ref": "#/components/schemas/Broken" }] }"##,
            ##""Broken": { "allOf": [{ "$ref": "other.json#/Object" }] }"##,
            ##""Broken": { "allOf": [{ "type": "string" }] }"##,
            #"""
            "Broken": { "allOf": [
                { "type": "object", "properties": { "value": { "type": "string" } } },
                { "type": "object", "properties": { "value": { "type": "integer" } } }
            ] }
            """#
        ]
        for definition in definitions {
            XCTAssertThrowsError(try decode("{\(definition)}"), definition) { error in
                guard case DecodingError.dataCorrupted = error else {
                    return XCTFail("Unexpected error: \(error)")
                }
            }
        }
    }

    func testAssetLibrarySchemasDecodeComposedProperties() throws {
        let components = try decode(#"""
        {
            "AppAssetLibraryImageCommonAttributes": {
                "type": "object",
                "properties": { "fileName": { "type": "string" } }
            },
            "AppAssetLibraryImageAwaitingUploadAttributes": {
                "allOf": [
                    { "$ref": "#/components/schemas/AppAssetLibraryImageCommonAttributes" },
                    {
                        "type": "object",
                        "properties": {
                            "uploadOperations": {
                                "type": "array",
                                "items": { "$ref": "#/components/schemas/UploadOperation" }
                            }
                        }
                    }
                ]
            },
            "AppAssetLibraryPlacementImageRelationships": {
                "type": "object",
                "properties": { "image": { "$ref": "#/components/schemas/AppAssetLibraryImage" } }
            }
        }
        """#)
        guard case .object(let attributes) = components.schemas["AppAssetLibraryImageAwaitingUploadAttributes"],
              case .object(let common) = components.schemas["AppAssetLibraryImageCommonAttributes"],
              case .object(let relationships) = components.schemas["AppAssetLibraryPlacementImageRelationships"] else {
            return XCTFail("Missing asset library schemas")
        }
        for (name, property) in common.properties {
            XCTAssertEqual(attributes.properties[name], property)
        }
        XCTAssertEqual(attributes.properties["uploadOperations"]?.type, .arrayOfSchemaRef("UploadOperation"))
        XCTAssertNotNil(relationships.properties["image"])
    }

    private func decode(_ schemas: String) throws -> Spec.Components {
        try JSONDecoder().decode(Spec.Components.self, from: Data("{\"schemas\":\(schemas)}".utf8))
    }
}
