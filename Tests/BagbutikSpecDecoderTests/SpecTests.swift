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
              case .include(let type) = operation.parameters?.first(where: { if case .include = $0 { true } else { false }}),
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
                        }, {
                            "name" : "filter[preReleaseVersion.platform]",
                            "in" : "query",
                            "description" : "filter by attribute 'preReleaseVersion.platform'",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "IOS", "MAC_OS", "TV_OS" ]
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
                    },
                    "Platform" : {
                        "type" : "string",
                        "enum" : [ "IOS", "MAC_OS", "TV_OS" ]
                    },
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        spec.flattenIdenticalSchemas()
        guard let operation = spec.paths["/v1/profiles"]?.operations[0],
              case .filter(_, let profileType, _, _) = operation.parameters?[0],
              case .simple(let profileTypeSimpleType) = profileType,
              case .filter(_, let platform, _, _) = operation.parameters?[1],
              case .simple(let platformSimpleType) = platform
        else {
            XCTFail(); return
        }
        XCTAssertEqual(profileTypeSimpleType.type, "Profile.Attributes.ProfileType")
        XCTAssertEqual(platformSimpleType.type, "Platform")
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
              case .objectSchema(let dataAttributesSchema) = dataSchema.subSchemas.filter({ $0.name == "Attributes" }).first,
              case .schemaRef(let typeSchemaRef) = dataAttributesSchema.properties["profileType"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(typeSchemaRef, "Profile.Attributes.ProfileType")
    }

    func testApplyManualPatches() throws {
        let specString = """
        {
            "paths": {
                "/v1/ciBuildActions/{id}/relationships/buildRun" : {
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
                },
            },
            "components": {
                "schemas": {
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
                            "links" : {
                                "$ref" : "#/components/schemas/ResourceLinks"
                            }
                        },
                        "required" : [ "links", "id", "type" ]
                    },
                    "BundleIdPlatform" : {
                        "type" : "string",
                        "enum" : [ "IOS", "MAC_OS" ]
                    },
                    "Device" : {
                        "type" : "object",
                        "title" : "Device",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "devices" ]
                            },
                            "id" : {
                                "type" : "string"
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "status" : {
                                        "type" : "string",
                                        "enum" : [ "ENABLED", "DISABLED" ]
                                    },
                                }
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/ResourceLinks"
                            }
                        },
                        "required" : [ "id", "type" ]
                    },
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
                                        },
                                        "meta" : {
                                            "type" : "object",
                                            "additionalProperties" : { }
                                        }
                                    },
                                    "required" : [ "code", "detail", "status", "title" ]
                                }
                            }
                        }
                    },
                    "UserRole" : {
                        "type" : "string",
                        "enum" : [ "ADMIN", "FINANCE", "ACCOUNT_HOLDER" ]
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        try spec.applyManualPatches()
        XCTAssertEqual(spec.paths.count, 0)

        guard case .enum(let bundleIdPlatformSchema) = spec.components.schemas["BundleIdPlatform"] else {
            XCTFail(); return
        }
        let bundleIdPlatformCaseValues = bundleIdPlatformSchema.cases.map(\.value)
        XCTAssertEqual(bundleIdPlatformCaseValues.count, 4)
        XCTAssertTrue(bundleIdPlatformCaseValues.contains("UNIVERSAL"))
        XCTAssertTrue(bundleIdPlatformCaseValues.contains("SERVICES"))

        guard case .object(let deviceSchema) = spec.components.schemas["Device"],
              let deviceAttributesSchema: ObjectSchema = deviceSchema.subSchemas.compactMap({
                  guard case .objectSchema(let subSchema) = $0,
                        subSchema.name == "Attributes" else {
                      return nil
                  }
                  return subSchema
              }).first,
              let statusProperty = deviceAttributesSchema.properties["status"],
              case .enumSchema(let deviceStatusSchema) = statusProperty.type else {
            XCTFail(); return
        }
        let deviceStatusCaseValues = deviceStatusSchema.cases.map(\.value)
        XCTAssertEqual(deviceStatusCaseValues.count, 3)
        XCTAssertTrue(deviceStatusCaseValues.contains("PROCESSING"))

        guard case .object(let errorResponse) = spec.components.schemas["ErrorResponse"],
              case .arrayOfSubSchema(let errorSchema) = errorResponse.properties["errors"]?.type,
              case .oneOf(_, let oneOfSchema) = errorSchema.properties["source"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertFalse(errorSchema.requiredProperties.contains("detail"))
        XCTAssertEqual(oneOfSchema.options, [.schemaRef("JsonPointer"), .schemaRef("Parameter")])

        guard case .schema(let metaSchemaProperty) = errorSchema.properties["meta"]?.type,
              case .dictionary(let errorsArrayProperty) = metaSchemaProperty.properties["associatedErrors"]?.type,
              case .arrayOfSchemaRef(let errorSchemaRef) = errorsArrayProperty
        else {
            XCTFail(); return
        }
        XCTAssertEqual(errorSchemaRef, "Errors")

        guard case .enum(let userRoleSchema) = spec.components.schemas["UserRole"] else {
            XCTFail(); return
        }
        let userRoleCaseValues = userRoleSchema.cases.map(\.value)
        XCTAssertEqual(userRoleCaseValues.count, 4)
        XCTAssertTrue(userRoleCaseValues.contains("GENERATE_INDIVIDUAL_KEYS"))
    }

    func testApplyManualPatches_WithoutIncludes() throws {
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
                    },
                    "AppWithoutIncludesResponse" : {
                        "type" : "object",
                        "title" : "AppWithoutIncludesResponse",
                        "properties" : {
                            "data" : {
                                "$ref" : "#/components/schemas/PrereleaseVersion"
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/DocumentLinks"
                            }
                        },
                        "required" : [ "data", "links" ]
                    },
                    "AppsWithoutIncludesResponse" : {
                        "type" : "object",
                        "title" : "AppsWithoutIncludesResponse",
                        "properties" : {
                            "data" : {
                                "type" : "array",
                                "items" : {
                                    "$ref" : "#/components/schemas/User"
                                }
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/PagedDocumentLinks"
                            },
                            "meta" : {
                                "$ref" : "#/components/schemas/PagingInformation"
                            }
                        },
                        "required" : [ "data", "links" ]
                    },
                    "AppCategoriesWithoutIncludesResponse" : {
                        "type" : "object",
                        "title" : "AppCategoriesWithoutIncludesResponse",
                        "properties" : {
                            "data" : {
                                "type" : "array",
                                "items" : {
                                    "$ref" : "#/components/schemas/AppCategory"
                                }
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/PagedDocumentLinks"
                            },
                            "meta" : {
                                "$ref" : "#/components/schemas/PagingInformation"
                            }
                        },
                        "required" : [ "data", "links" ]
                    },
                    "PreReleaseVersionsWithoutIncludesResponse" : {
                        "type" : "object",
                        "title" : "PreReleaseVersionsWithoutIncludesResponse",
                        "properties" : {
                            "data" : {
                                "type" : "array",
                                "items" : {
                                    "$ref" : "#/components/schemas/App"
                                }
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/PagedDocumentLinks"
                            },
                            "meta" : {
                                "$ref" : "#/components/schemas/PagingInformation"
                            }
                        },
                        "required" : [ "data", "links" ]
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        try spec.applyManualPatches()

        guard case .object(let responseSchema) = spec.components.schemas["AppWithoutIncludesResponse"],
              case .schemaRef(let responseSchemaDataRef) = responseSchema.properties["data"]?.type else {
            XCTFail(); return
        }
        XCTAssertEqual(responseSchemaDataRef, "App")

        guard case .object(let responseSchema) = spec.components.schemas["AppsWithoutIncludesResponse"],
              case .arrayOfSchemaRef(let responseSchemaDataRef) = responseSchema.properties["data"]?.type else {
            XCTFail(); return
        }
        XCTAssertEqual(responseSchemaDataRef, "App")
        
        guard case .object(let responseSchema) = spec.components.schemas["AppCategoriesWithoutIncludesResponse"],
              case .arrayOfSchemaRef(let responseSchemaDataRef) = responseSchema.properties["data"]?.type else {
            XCTFail(); return
        }
        XCTAssertEqual(responseSchemaDataRef, "AppCategory")
        
        guard case .object(let responseSchema) = spec.components.schemas["PreReleaseVersionsWithoutIncludesResponse"],
              case .arrayOfSchemaRef(let responseSchemaDataRef) = responseSchema.properties["data"]?.type else {
            XCTFail(); return
        }
        XCTAssertEqual(responseSchemaDataRef, "PrereleaseVersion")
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
