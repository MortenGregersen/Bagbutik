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
        XCTAssertEqual(objectSchema.properties.count, 9)
        XCTAssertEqual(objectSchema.subSchemas.count, 7)
        
        XCTAssertEqual(objectSchema.properties["arrayOfStrings"]?.type.description, "[String]")

        guard case let .oneOf(arrayOfOneOfSchemasName, _) = objectSchema.subSchemas[0] else { return XCTFail() }
        XCTAssertEqual(arrayOfOneOfSchemasName, "ArrayOfOneOfSchemas")
        guard case let .objectSchema(arrayOfObjectSchema) = objectSchema.subSchemas[1] else { return XCTFail() }
        XCTAssertEqual(arrayOfObjectSchema.name, "ArrayOfSubSchemas")
        guard case let .attributes(attributesSchema) = objectSchema.subSchemas[2] else { return XCTFail() }
        XCTAssertEqual(attributesSchema.properties.count, 1)
        guard case let .enumSchema(enumSchema) = objectSchema.subSchemas[3] else { return XCTFail() }
        XCTAssertEqual(enumSchema.name, "EnumSchema")
        guard case let .relationships(relationshipsSchema) = objectSchema.subSchemas[4] else { return XCTFail() }
        XCTAssertEqual(relationshipsSchema.name, "Relationships")
        guard case let .oneOf(singleOfOneOfSchemaName, _) = objectSchema.subSchemas[5] else { return XCTFail() }
        XCTAssertEqual(singleOfOneOfSchemaName, "SingleOneOfSchema")
        guard case let .objectSchema(singleObjectSchema) = objectSchema.subSchemas[6] else { return XCTFail() }
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
        XCTAssertThrowsError(try decodeObjectSchema(from: json)) {
            // Then
            guard case let .dataCorrupted(context) = $0 as? DecodingError else { return XCTFail() }
            XCTAssertEqual(context.codingPath.last?.stringValue, "data")
            XCTAssertEqual(context.debugDescription, "Property type not known")
        }
    }
    
    func testMissingRequiredLinksPropertyOnBuildBundle_FB10029609() throws {
        // Even though `links` property of the BuildBundle is marked as `required` in the Open API Spec
        // for the App Store Connect API, the `links` property is missing, when performing a request
        // to https://api.appstoreconnect.apple.com/v1/builds/<build-id>.
        // Feedback has been reported to Apple 27/5/22 as FB10029609.
        
        // Given
        let json = #"""
        {
            "BuildBundle" : {
                "type" : "object",
                "title" : "BuildBundle",
                "properties" : {
                    "type" : {
                        "type" : "string",
                        "enum" : [ "buildBundles" ]
                    },
                    "id" : {
                        "type" : "string"
                    },
                    "attributes" : {
                        "type" : "object",
                        "properties" : {
                            "bundleId" : {
                                "type" : "string"
                            }
                        }
                    },
                    "relationships" : {
                        "type" : "object",
                        "properties" : {
                            "buildBundleFileSizes" : {
                                "type" : "object",
                                "properties" : {
                                    "links" : {
                                        "type" : "object",
                                        "properties" : {
                                            "self" : {
                                                "type" : "string",
                                                "format" : "uri-reference"
                                            },
                                            "related" : {
                                                "type" : "string",
                                                "format" : "uri-reference"
                                            }
                                        }
                                    },
                                    "meta" : {
                                        "$ref" : "#/components/schemas/PagingInformation"
                                    },
                                    "data" : {
                                        "type" : "array",
                                        "items" : {
                                            "type" : "object",
                                            "properties" : {
                                                "type" : {
                                                    "type" : "string",
                                                    "enum" : [ "buildBundleFileSizes" ]
                                                },
                                                "id" : {
                                                    "type" : "string"
                                                }
                                            },
                                            "required" : [ "id", "type" ]
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "links" : {
                        "$ref" : "#/components/schemas/ResourceLinks"
                    }
                },
                "required" : [ "links", "id", "type" ]
            }
        }
        """#
        // When
        let objectSchema = try decodeObjectSchema(from: json)
        // Then
        XCTAssertEqual(objectSchema.name, "BuildBundle")
        XCTAssertEqual(objectSchema.requiredProperties, ["id", "type"])
    }

    func testGetDocumentationRoot() {
        let documentation = Schema.Documentation.rootSchema(summary: "Some model")
        XCTAssertEqual(ObjectSchema.getDocumentation(forSchemaNamed: "SomeModel",
                                                     codingPathComponents: ["SomeModel"],
                                                     lookupDocumentation: { _ in documentation }), documentation)
    }

    func testGetDocumentationAttributes() {
        // When
        let attributes = Schema.AttributesDocumentation(summary: "Some attributes")
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Attributes",
                                                          codingPathComponents: ["SomeModel", "Attributes"],
                                                          lookupDocumentation: { _ in
                                                              .rootSchema(summary: "Some model", attributes: attributes)
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.attributes(attributes))
    }
    
    func testGetDocumentationRelationships() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Relationships",
                                                          codingPathComponents: ["SomeModel", "Relationships"],
                                                          lookupDocumentation: { _ in
                                                              .rootSchema(summary: "Some model")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.relationships)
    }
    
    func testGetDocumentationRelationship() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "AnotherModel",
                                                          codingPathComponents: ["SomeModel", "Relationships", "AnotherModel"],
                                                          lookupDocumentation: { _ in
                                                              .rootSchema(summary: "Some model")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.relationship)
    }
    
    func testGetDocumentationRelationshipData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeModel", "Relationships", "AnotherModel", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .rootSchema(summary: "Some model")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.relationshipData)
    }
    
    func testGetDocumentationRelationshipLinks() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Links",
                                                          codingPathComponents: ["SomeModel", "Relationships", "AnotherModel", "Links"],
                                                          lookupDocumentation: { _ in
                                                              .rootSchema(summary: "Some model")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.relationshipLinks)
    }
    
    func testGetDocumentationLinkagesRequestData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeLinkagesRequest", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .linkagesRequest(summary: "Some linkages request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.linkagesRequestData)
    }
    
    func testGetDocumentationLinkagesResponseData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeLinkagesResponse", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .linkagesResponse
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.linkagesResponseData)
    }
    
    func testGetDocumentationCreateRequestData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeCreateRequest", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .createRequest(summary: "Some create request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.createRequestData)
    }
    
    func testGetDocumentationUpdateRequestData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeUpdateRequest", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .updateRequest(summary: "Some update request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.updateRequestData)
    }
    
    func testGetDocumentationCreateRequestDataAttributes() {
        // When
        let attributes = Schema.RequestDataAttributesDocumentaion(properties: ["something": "A thing"])
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Attributes",
                                                          codingPathComponents: ["SomeCreateRequest", "Data", "Attributes"],
                                                          lookupDocumentation: { _ in
                                                              .createRequest(summary: "Some create request", attributes: attributes)
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.createRequestDataAttributes(attributes))
    }
    
    func testGetDocumentationUpdateRequestDataAttributes() {
        // When
        let attributes = Schema.RequestDataAttributesDocumentaion(properties: ["something": "A thing"])
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Attributes",
                                                          codingPathComponents: ["SomeUpdateRequest", "Data", "Attributes"],
                                                          lookupDocumentation: { _ in
                                                              .updateRequest(summary: "Some update request", attributes: attributes)
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.updateRequestDataAttributes(attributes))
    }
    
    func testGetDocumentationCreateRequestRelationships() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Relationships",
                                                          codingPathComponents: ["SomeCreateRequest", "Data", "Relationships"],
                                                          lookupDocumentation: { _ in
                                                              .createRequest(summary: "Some create request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.createRequestDataRelationships)
    }
    
    func testGetDocumentationUpdateRequestRelationships() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Relationships",
                                                          codingPathComponents: ["SomeUpdateRequest", "Data", "Relationships"],
                                                          lookupDocumentation: { _ in
                                                              .updateRequest(summary: "Some update request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.updateRequestDataRelationships)
    }
    
    func testGetDocumentationCreateRequestRelationship() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "AnotherModel",
                                                          codingPathComponents: ["SomeCreateRequest", "Data", "Relationships", "AnotherModel"],
                                                          lookupDocumentation: { _ in
                                                              .createRequest(summary: "Some create request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.createRequestDataRelationship)
    }
    
    func testGetDocumentationUpdateRequestRelationship() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "AnotherModel",
                                                          codingPathComponents: ["SomeUpdateRequest", "Data", "Relationships", "AnotherModel"],
                                                          lookupDocumentation: { _ in
                                                              .updateRequest(summary: "Some update request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.updateRequestDataRelationship)
    }
    
    func testGetDocumentationCreateRequestRelationshipData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeCreateRequest", "Data", "Relationships", "AnotherModel", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .createRequest(summary: "Some create request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.createRequestDataRelationshipData)
    }
    
    func testGetDocumentationUpdateRequestRelationshipData() {
        // When
        let documentation = ObjectSchema.getDocumentation(forSchemaNamed: "Data",
                                                          codingPathComponents: ["SomeUpdateRequest", "Data", "Relationships", "AnotherModel", "Data"],
                                                          lookupDocumentation: { _ in
                                                              .updateRequest(summary: "Some update request")
                                                          })
        // Then
        XCTAssertEqual(documentation, Schema.Documentation.updateRequestDataRelationshipData)
    }
    
    func testGetDocumentationErrorResponseSub() {
        let testException = XCTestExpectation()
        _ = ObjectSchema.getDocumentation(forSchemaNamed: "AnotherModel",
                                          codingPathComponents: ["ErrorResponse", "Items", "Source", "OneOf", "Index 0", "SomeModel"],
                                          lookupDocumentation: { name in
                                              if name == "ErrorResponse.SomeModel.AnotherModel" {
                                                  testException.fulfill()
                                              }
                                              return .none
                                          })
        wait(for: [testException], timeout: 5)
    }
    
    func testGetDocumentationPagingInformationSub() {
        let testException = XCTestExpectation()
        _ = ObjectSchema.getDocumentation(forSchemaNamed: "Paging",
                                          codingPathComponents: ["PagingInformation", "Paging"],
                                          lookupDocumentation: { name in
                                              if name == "PagingInformation.Paging" {
                                                  testException.fulfill()
                                              }
                                              return .none
                                          })
        wait(for: [testException], timeout: 5)
    }
    
    func testGetDocumentationNil() {
        XCTAssertNil(ObjectSchema.getDocumentation(forSchemaNamed: "Nothing",
                                                   codingPathComponents: ["SomeModel", "Nothing"]))
        XCTAssertNil(ObjectSchema.getDocumentation(forSchemaNamed: "Nothing",
                                                   codingPathComponents: ["SomeModel", "Relationships", "AnotherModel", "Nothing"]))
        XCTAssertNil(ObjectSchema.getDocumentation(forSchemaNamed: "Nothing",
                                                   codingPathComponents: ["SomeRequest", "Nothing"]))
    }
    
    private func decodeObjectSchema(from json: String) throws -> ObjectSchema {
        try jsonDecoder.decode([String: ObjectSchema].self, from: json.data(using: .utf8)!).values.first!
    }
}
