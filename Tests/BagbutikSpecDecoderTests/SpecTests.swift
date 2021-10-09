@testable import BagbutikSpecDecoder
import XCTest

final class SpecTests: XCTestCase {
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
