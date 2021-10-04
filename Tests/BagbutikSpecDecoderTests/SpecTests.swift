@testable import BagbutikSpecDecoder
import XCTest

final class SpecTests: XCTestCase {
    func testIncludesFixUps() {
        // Given
        let spec = Spec(paths: [
            "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", isRelationship: false), operations: [
                .init(name: "listUsers",
                      documentation: .init(title: "List users", summary: "Get a list of users", url: "https://developer.apple.com"),
                      method: .get,
                      parameters: [
                          .fields(name: "name", type: .simple(type: .string), deprecated: false, documentation: "name of the user"),
                          .include(type: .enum(type: "string", values: ["DOG", "CAT"])),
                          .limit(name: "limit", documentation: "maximum number of users", maximum: 200),
                      ],
                      successResponseType: "UsersResponse",
                      errorResponseType: "ErrorResponse"),
            ]),
            "/v1/users/{id}/relationships/visibleApps": Path(path: "/v1/users/{id}/relationships/visibleApps", info: .init(mainType: "Users", isRelationship: true), operations: [
                .init(name: "listVisibleAppIdsForUser",
                      documentation: .init(title: "List ids for visible apps for user", summary: "Get a list ids for visible apps for user", url: "https://developer.apple.com"),
                      method: .get,
                      successResponseType: "UserVisibleAppsLinkagesResponse",
                      errorResponseType: "ErrorResponse"),
            ]),
            "/v1/ciProducts/{id}/buildRuns": Path(path: "/v1/ciProducts/{id}/buildRuns", info: .init(mainType: "CiProducts", isRelationship: true), operations: [
                .init(name: "listBuildRunsForCiProduct",
                      documentation: .init(title: "List All Xcode Cloud Builds for an Xcode Cloud Product", summary: "List all builds Xcode Cloud performed for a specific product.", url: "https://developer.apple.com"),
                      method: .get,
                      parameters: [
                          .fields(name: "ciBuildRuns", type: .enum(type: "string", values: ["actions", "cancelReason", "completionStatus"]), deprecated: false, documentation: "The fields to include for returned resources of type ciBuildRuns"),
                      ],
                      successResponseType: "CiBuildRunsResponse",
                      errorResponseType: "ErrorResponse"),
            ]),
        ],
        components: .init(schemas: [:]))
        // Then
        XCTAssertEqual(spec.includesFixUps, [
            "UsersResponse": ["name", "DOG", "CAT"],
            "CiBuildRunsResponse": ["actions", "cancelReason", "completionStatus"],
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
}

private extension SubSchema {
    /// Match the sub schema as an Attributes schema and return it if it is
    var asAttributes: ObjectSchema? {
        guard case .attributes(let attributesSchema) = self else { return nil }
        return attributesSchema
    }
}
