@testable import BagbutikSpecDecoder
import XCTest

final class SpecTests: XCTestCase {
    func testAddForgottenIncludeParameters() {
        let specString = """
        {
            "paths": {
                "/v1/appInfos/{id}": {
                    "get": {
                        "tags": ["AppInfos"],
                        "operationId": "appInfos-get_instance",
                        "parameters": [{
                            "name": "fields[appInfos]",
                            "in": "query",
                            "description": "the fields to include for returned resources of type appInfos",
                            "schema": {
                                "type": "array",
                                "items": {
                                    "type": "string",
                                    "enum": ["ageRatingDeclaration", "app", "appInfoLocalizations", "appStoreAgeRating", "appStoreState", "brazilAgeRating", "kidsAgeBand", "primaryCategory", "primarySubcategoryOne", "primarySubcategoryTwo", "secondaryCategory", "secondarySubcategoryOne", "secondarySubcategoryTwo"]
                                }
                            },
                            "style": "form",
                            "explode": false,
                            "required": false
                        }, {
                            "name": "include",
                            "in": "query",
                            "description": "comma-separated list of relationships to include",
                            "schema": {
                                "type": "array",
                                "items": {
                                    "type": "string",
                                    "enum": ["appInfoLocalizations"]
                                }
                            },
                            "style": "form",
                            "explode": false,
                            "required": false
                        }],
                        "responses": {
                            "404": {
                                "description": "Not found error",
                                "content": {
                                    "application/json": {
                                        "schema": {
                                            "$ref": "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200": {
                                "description": "Single AppInfo",
                                "content": {
                                    "application/json": {
                                        "schema": {
                                            "$ref": "#/components/schemas/AppInfoResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                "/v1/apps/{id}/appInfos" : {
                    "get" : {
                        "tags" : [ "Apps" ],
                        "operationId" : "apps-appInfos-get_to_many_related",
                        "parameters" : [ {
                            "name" : "include",
                            "in" : "query",
                            "description" : "comma-separated list of relationships to include",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "appInfoLocalizations" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false
                        } ],
                        "responses" : {
                            "404" : {
                                "description" : "Not found error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "List of related resources",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/AppInfosResponse"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "parameters" : [ {
                        "name" : "id",
                        "in" : "path",
                        "description" : "the id of the requested resource",
                        "schema" : {
                            "type" : "string"
                        },
                        "style" : "simple",
                        "required" : true
                    } ]
                }
            },
            "components": {
                "schemas": {
                    "AppInfo": {
                        "type": "object",
                        "title": "AppInfo",
                        "properties": {
                            "type": {
                                "type": "string",
                                "enum": ["appInfos"]
                            },
                            "id": {
                                "type": "string"
                            },
                            "attributes": {
                                "type": "object",
                                "properties": {
                                    "appStoreState": {
                                        "$ref": "#/components/schemas/AppStoreVersionState"
                                    },
                                    "appStoreAgeRating": {
                                        "$ref": "#/components/schemas/AppStoreAgeRating"
                                    },
                                    "brazilAgeRating": {
                                        "$ref": "#/components/schemas/BrazilAgeRating"
                                    },
                                    "kidsAgeBand": {
                                        "$ref": "#/components/schemas/KidsAgeBand"
                                    }
                                }
                            },
                            "relationships": {
                                "type": "object",
                                "properties": {
                                    "app": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["apps"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "ageRatingDeclaration": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["ageRatingDeclarations"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "appInfoLocalizations": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "meta": {
                                                "$ref": "#/components/schemas/PagingInformation"
                                            },
                                            "data": {
                                                "type": "array",
                                                "items": {
                                                    "type": "object",
                                                    "properties": {
                                                        "type": {
                                                            "type": "string",
                                                            "enum": ["appInfoLocalizations"]
                                                        },
                                                        "id": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": ["id", "type"]
                                                }
                                            }
                                        }
                                    },
                                    "primaryCategory": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["appCategories"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "primarySubcategoryOne": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["appCategories"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "primarySubcategoryTwo": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["appCategories"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "secondaryCategory": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["appCategories"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "secondarySubcategoryOne": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["appCategories"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    },
                                    "secondarySubcategoryTwo": {
                                        "type": "object",
                                        "properties": {
                                            "links": {
                                                "type": "object",
                                                "properties": {
                                                    "self": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    },
                                                    "related": {
                                                        "type": "string",
                                                        "format": "uri-reference"
                                                    }
                                                }
                                            },
                                            "data": {
                                                "type": "object",
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": ["appCategories"]
                                                    },
                                                    "id": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": ["id", "type"]
                                            }
                                        }
                                    }
                                }
                            },
                            "links": {
                                "$ref": "#/components/schemas/ResourceLinks"
                            }
                        },
                        "required": ["links", "id", "type"]
                    },
                    "AppInfoResponse": {
                        "type": "object",
                        "title": "AppInfoResponse",
                        "properties": {
                            "data": {
                                "$ref": "#/components/schemas/AppInfo"
                            },
                            "included": {
                                "type": "array",
                                "items": {
                                    "oneOf": [{
                                        "$ref": "#/components/schemas/App"
                                    }, {
                                        "$ref": "#/components/schemas/AgeRatingDeclaration"
                                    }, {
                                        "$ref": "#/components/schemas/AppInfoLocalization"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }]
                                }
                            },
                            "links": {
                                "$ref": "#/components/schemas/DocumentLinks"
                            }
                        },
                        "required": ["data", "links"]
                    },
                    "AppInfosResponse": {
                        "type": "object",
                        "title": "AppInfosResponse",
                        "properties": {
                            "data": {
                                "type": "array",
                                "items": {
                                    "$ref": "#/components/schemas/AppInfo"
                                }
                            },
                            "included": {
                                "type": "array",
                                "items": {
                                    "oneOf": [{
                                        "$ref": "#/components/schemas/App"
                                    }, {
                                        "$ref": "#/components/schemas/AgeRatingDeclaration"
                                    }, {
                                        "$ref": "#/components/schemas/AppInfoLocalization"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }, {
                                        "$ref": "#/components/schemas/AppCategory"
                                    }]
                                }
                            },
                            "links": {
                                "$ref": "#/components/schemas/PagedDocumentLinks"
                            },
                            "meta": {
                                "$ref": "#/components/schemas/PagingInformation"
                            }
                        },
                        "required": ["data", "links"]
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try! jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        spec.addForgottenIncludeParameters()
        guard let operation = spec.paths["/v1/appInfos/{id}"]?.operations[0],
              case .include(let type) = operation.parameters?.first(where: { if case .include = $0 { return true } else { return false }}),
              case .enum(_, let values) = type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(values, [
            "ageRatingDeclaration",
            "app",
            "appInfoLocalizations",
            "primaryCategory",
            "primarySubcategoryOne",
            "primarySubcategoryTwo",
            "secondaryCategory",
            "secondarySubcategoryOne",
            "secondarySubcategoryTwo",

        ])
        guard let operation = spec.paths["/v1/apps/{id}/appInfos"]?.operations[0],
              case .include(let type) = operation.parameters?[0],
              case .enum(_, let values) = type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(values, [
            "ageRatingDeclaration",
            "app",
            "appInfoLocalizations",
            "primaryCategory",
            "primarySubcategoryOne",
            "primarySubcategoryTwo",
            "secondaryCategory",
            "secondarySubcategoryOne",
            "secondarySubcategoryTwo",

        ])
    }

    func testFlattenIdenticalSchemas_InEndpoints() throws {
        let specString = """
        {
            "paths": {
                "/v1/profiles" : {
                    "get" : {
                        "tags" : [ "Profiles" ],
                        "operationId" : "profiles-get_collection",
                        "parameters" : [ {
                            "name" : "filter[profileType]",
                            "in" : "query",
                            "description" : "filter by attribute 'profileType'",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false,
                            "required" : false
                        } ],
                        "responses" : {
                            "400" : {
                                "description" : "Parameter error(s)",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "403" : {
                                "description" : "Forbidden error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "List of Profiles",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ProfilesResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "components": {
                "schemas": {
                    "Profile" : {
                        "type" : "object",
                        "title" : "Profile",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "profiles" ]
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "profileType" : {
                                        "type" : "string",
                                        "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        spec.flattenIdenticalSchemas()
        guard let operation = spec.paths["/v1/profiles"]?.operations[0],
              case .filter(_, let type, _, _) = operation.parameters?[0],
              case .simple(let simpleType) = type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(simpleType.type, "Profile.Attributes.ProfileType")
    }

    func testFlattenIdenticalSchemas_InModels() throws {
        let specString = """
        {
            "paths": {},
            "components": {
                "schemas": {
                    "ProfileCreateRequest" : {
                        "type" : "object",
                        "title" : "ProfileCreateRequest",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "profiles" ]
                                    },
                                    "attributes" : {
                                        "type" : "object",
                                        "properties" : {
                                            "profileType" : {
                                                "type" : "string",
                                                "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "Profile" : {
                        "type" : "object",
                        "title" : "Profile",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "profiles" ]
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "profileType" : {
                                        "type" : "string",
                                        "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        spec.flattenIdenticalSchemas()
        guard case .object(let profileCreateRequest) = spec.components.schemas["ProfileCreateRequest"],
              case .schema(let dataSchema) = profileCreateRequest.properties["data"]?.type,
              let dataAttributesSchema = dataSchema.subSchemas.compactMap({ $0.asAttributes }).first,
              case .schemaRef(let typeSchemaRef) = dataAttributesSchema.properties["profileType"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(typeSchemaRef, "Profile.Attributes.ProfileType")
    }

    func testApplyManualPatches() throws {
        let specString = """
        {
            "paths": {},
            "components": {
                "schemas": {
                    "ErrorResponse" : {
                        "type" : "object",
                        "properties" : {
                            "errors" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "object",
                                    "properties" : {
                                        "id" : {
                                            "type" : "string"
                                        },
                                        "status" : {
                                            "type" : "string"
                                        },
                                        "code" : {
                                            "type" : "string"
                                        },
                                        "title" : {
                                            "type" : "string"
                                        },
                                        "detail" : {
                                            "type" : "string"
                                        },
                                        "source" : {
                                            "oneOf" : [ {
                                                "$ref" : "#/components/schemas/ErrorSourcePointer"
                                            }, {
                                                "$ref" : "#/components/schemas/ErrorSourceParameter"
                                            } ]
                                        }
                                    },
                                    "required" : [ "code", "detail", "title", "status" ]
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        try spec.applyManualPatches()
        guard case .object(let errorResponse) = spec.components.schemas["ErrorResponse"],
              case .arrayOfSubSchema(let errorSchema) = errorResponse.properties["errors"]?.type,
              case .oneOf(_, let oneOfSchema) = errorSchema.properties["source"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(oneOfSchema.options, [.schemaRef("JsonPointer"), .schemaRef("Parameter")])
    }

    func testApplyManualPatches_Error() throws {
        let specString = """
        {
            "paths": {},
            "components": {
                "schemas": {
                    "ErrorResponse" : {
                        "type" : "object",
                        "properties" : {
                            "errors" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "object",
                                    "properties" : {
                                        "id" : {
                                            "type" : "string"
                                        },
                                        "status" : {
                                            "type" : "string"
                                        },
                                        "code" : {
                                            "type" : "string"
                                        },
                                        "title" : {
                                            "type" : "string"
                                        },
                                        "detail" : {
                                            "type" : "string"
                                        },
                                        "source" : {
                                            "oneOf" : [ {
                                                "$ref" : "#/components/schemas/ErrorSourcePointer"
                                            }, {
                                                "$ref" : "#/components/schemas/ErrorSourceBonanza"
                                            } ]
                                        }
                                    },
                                    "required" : [ "code", "detail", "title", "status" ]
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        XCTAssertThrowsError(try spec.applyManualPatches()) { error in
            XCTAssertEqual(error as! SpecError, .unexpectedErrorResponseSource(spec.components.schemas["ErrorResponse"]))
        }
    }
}

private extension SubSchema {
    /// Match the sub schema as an Attributes schema and return it if it is
    var asAttributes: ObjectSchema? {
        guard case .attributes(let attributesSchema) = self else { return nil }
        return attributesSchema
    }
}
