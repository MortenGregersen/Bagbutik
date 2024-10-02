@testable import BagbutikSpecDecoder
import XCTest

final class OperationTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testDecodingMostInitCases() throws {
        // Given
        let json = #"""
        {
            "get": {
                "operationId" : "territories-get_collection",
                "parameters" : [ {
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
                }, {
                    "name" : "limit",
                    "description" : "maximum resources per page",
                    "schema" : {
                        "type" : "integer",
                        "maximum" : 200
                    },
                } ],
                "responses": {
                    "400": {
                        "description": "Parameter error(s)",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "Forbidden error",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
                    "200": {
                        "description": "List of Territories",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/TerritoriesResponse"
                                }
                            }
                        }
                    }
                }
            },
            "patch": {
                "operationId" : "ageRatingDeclarations-update_instance",
                "requestBody" : {
                    "description" : "AgeRatingDeclaration representation",
                    "content" : {
                        "application/json" : {
                            "schema" : {
                                "$ref" : "#/components/schemas/AgeRatingDeclarationUpdateRequest"
                            }
                        }
                    },
                    "required" : true
                },
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
                        "description" : "Single AgeRatingDeclaration",
                        "content" : {
                            "application/json" : {
                                "schema" : {
                                    "$ref" : "#/components/schemas/AgeRatingDeclarationResponse"
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        let operations = try jsonDecoder.decode([String: BagbutikSpecDecoder.Operation].self, from: json.data(using: .utf8)!)
        // Then
        let getOperation = operations["get"]
        XCTAssertEqual(getOperation?.name, "listTerritories")
        XCTAssertEqual(getOperation?.method, .get)
        let getParameters: [BagbutikSpecDecoder.Operation.Parameter] = [
            .fields(name: "territories", type: .enum(type: "String", values: ["currency"]), deprecated: false,
                    documentation: "the fields to include for returned resources of type territories"),
            .limit(name: "limit", documentation: "maximum resources per page", maximum: 200)
        ]
        XCTAssertEqual(getOperation?.parameters, getParameters)
        XCTAssertEqual(getOperation?.requestBody, nil)
        XCTAssertEqual(getOperation?.successResponseType, "TerritoriesResponse")
        XCTAssertEqual(getOperation?.errorResponseType, "ErrorResponse")

        let patchOperation = operations["patch"]
        XCTAssertEqual(patchOperation?.name, "updateAgeRatingDeclaration")
        XCTAssertEqual(patchOperation?.method, .patch)
        XCTAssertEqual(patchOperation?.parameters, nil)
        XCTAssertEqual(patchOperation?.requestBody, .init(name: "AgeRatingDeclarationUpdateRequest", documentation: "AgeRatingDeclaration representation"))
        XCTAssertEqual(patchOperation?.successResponseType, "AgeRatingDeclarationResponse")
        XCTAssertEqual(patchOperation?.errorResponseType, "ErrorResponse")
    }

    func testDecodingGzipResponseType() throws {
        // Given
        let json = #"""
        {
            "get": {
                "operationId": "financeReports-get_collection",
                "parameters": [],
                "responses": {
                    "400": {
                        "description": "Parameter error(s)",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "Forbidden error",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
                    "200": {
                        "description" : "List of FinanceReports",
                        "content" : {
                            "application/a-gzip" : {
                                "schema" : {
                                    "$ref" : "#/components/schemas/gzip"
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        let operations = try jsonDecoder.decode([String: BagbutikSpecDecoder.Operation].self, from: json.data(using: .utf8)!)
        // Then
        let getOperation = operations["get"]
        XCTAssertEqual(getOperation?.name, "getFinanceReports")
        XCTAssertEqual(getOperation?.method, .get)
        XCTAssertEqual(getOperation?.parameters, [])
        XCTAssertEqual(getOperation?.requestBody, nil)
        XCTAssertEqual(getOperation?.successResponseType, "Gzip")
        XCTAssertEqual(getOperation?.errorResponseType, "ErrorResponse")
    }

    func testDecodingEmptyResponseType() throws {
        // Given
        let json = #"""
        {
            "delete": {
                "operationId": "profiles-delete_instance",
                "responses": {
                    "400": {
                        "description": "Parameter error(s)",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "Forbidden error",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
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
                    "409": {
                        "description": "Request entity error(s)",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorResponse"
                                }
                            }
                        }
                    },
                    "204": {
                        "description": "Success (no content)"
                    }
                }
            }
        }
        """#
        // When
        let operations = try jsonDecoder.decode([String: BagbutikSpecDecoder.Operation].self, from: json.data(using: .utf8)!)
        // Then
        let getOperation = operations["delete"]
        XCTAssertEqual(getOperation?.name, "deleteProfile")
        XCTAssertEqual(getOperation?.method, .delete)
        XCTAssertEqual(getOperation?.parameters, nil)
        XCTAssertEqual(getOperation?.requestBody, nil)
        XCTAssertEqual(getOperation?.successResponseType, "EmptyResponse")
        XCTAssertEqual(getOperation?.errorResponseType, "ErrorResponse")
    }

    func testGetMetrics() throws {
        // Given
        let json = #"""
        {
            "get" : {
                "tags" : [ "Apps", "Metrics" ],
                "operationId" : "apps-betaTesterUsages-get_metrics",
                "parameters" : [ {
                    "name" : "limit",
                    "in" : "query",
                    "description" : "maximum number of groups to return per page",
                    "schema" : {
                        "type" : "integer",
                        "maximum" : 200
                    },
                    "style" : "form"
                }, {
                    "name" : "groupBy",
                    "in" : "query",
                    "description" : "the dimension by which to group the results",
                    "schema" : {
                        "type" : "array",
                        "items" : {
                            "type" : "string",
                            "enum" : [ "betaTesters" ]
                        }
                    },
                    "style" : "form",
                    "explode" : false
                }, {
                    "name" : "filter[betaTesters]",
                    "in" : "query",
                    "description" : "filter by 'betaTesters' relationship dimension",
                    "schema" : {
                        "type" : "string"
                    },
                    "style" : "form",
                    "explode" : false
                }, {
                    "name" : "period",
                    "in" : "query",
                    "description" : "the duration of the reporting period",
                    "schema" : {
                        "type" : "string"
                    },
                    "style" : "form",
                    "explode" : false,
                    "examples" : {
                        "PTnM" : {
                            "value" : "PT10M"
                        },
                        "PnDTnHnMn.nS" : {
                            "value" : "P7DT10H10M10.5S"
                        },
                        "PnD" : {
                            "value" : "P7D"
                        },
                        "PTn.nS" : {
                            "value" : "PT10.5S"
                        },
                        "PTnH" : {
                            "value" : "PT10H"
                        }
                    }
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
                        "description" : "Metrics data response",
                        "content" : {
                            "application/json" : {
                                "schema" : {
                                    "$ref" : "#/components/schemas/AppsBetaTesterUsagesV1MetricResponse"
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        let operations = try jsonDecoder.decode([String: BagbutikSpecDecoder.Operation].self, from: json.data(using: .utf8)!)
        // Then
        let getOperation = operations["get"]
        XCTAssertEqual(getOperation?.name, "getMetricsForBetaTesterUsageInApp")
        XCTAssertEqual(getOperation?.method, .get)
        XCTAssertEqual(getOperation?.parameters?.count, 4)
        XCTAssertEqual(getOperation?.requestBody, nil)
        XCTAssertEqual(getOperation?.successResponseType, "AppsBetaTesterUsagesV1MetricResponse")
        XCTAssertEqual(getOperation?.errorResponseType, "ErrorResponse")
    }

    func testGetVersionedName() throws {
        // Given
        let json = #"""
        {
            "get" : {
                "tags" : [ "SandboxTesters" ],
                "operationId" : "sandboxTestersV2-get_collection",
                "parameters" : [ {
                    "name" : "fields[sandboxTesters]",
                    "in" : "query",
                    "description" : "the fields to include for returned resources of type sandboxTesters",
                    "schema" : {
                        "type" : "array",
                        "items" : {
                            "type" : "string",
                            "enum" : [ "acAccountName", "applePayCompatible", "firstName", "interruptPurchases", "lastName", "subscriptionRenewalRate", "territory" ]
                        }
                    },
                    "style" : "form",
                    "explode" : false,
                    "required" : false
                }, {
                    "name" : "limit",
                    "in" : "query",
                    "description" : "maximum resources per page",
                    "schema" : {
                        "type" : "integer",
                        "maximum" : 200
                    },
                    "style" : "form"
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
                    "200" : {
                        "description" : "List of SandboxTesters",
                        "content" : {
                            "application/json" : {
                                "schema" : {
                                    "$ref" : "#/components/schemas/SandboxTestersV2Response"
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        let operations = try jsonDecoder.decode([String: BagbutikSpecDecoder.Operation].self, from: json.data(using: .utf8)!)
        // Then
        let getOperation = operations["get"]
        XCTAssertEqual(getOperation?.name, "listSandboxTestersV2")
        let path = Path(path: "/v2/sandboxTesters", info: .init(mainType: "betaTesters", version: "V2", isRelationship: false), operations: [getOperation!])
        XCTAssertEqual(getOperation?.getVersionedName(path: path), "ListSandboxTestersV2")
    }

    func testGetDocumentationId() {
        let getOperation = Operation(id: "users-getInstance", name: "getUser", method: .get, successResponseType: "UserResponse", errorResponseType: "ErrorResponse")
        let postOperation = Operation(id: "users-createInstance", name: "createUser", method: .post, successResponseType: "UserResponse", errorResponseType: "ErrorResponse")
        let patchOperation = Operation(id: "users-updateInstance", name: "updateUser", method: .patch, successResponseType: "UserResponse", errorResponseType: "ErrorResponse")
        let putOperation = Operation(id: "users-replaceInstance", name: "replaceUser", method: .put, successResponseType: "UserResponse", errorResponseType: "ErrorResponse")
        let deleteOperation = Operation(id: "users-deleteInstance", name: "deleteUser", method: .delete, successResponseType: "EmptyResponse", errorResponseType: "ErrorResponse")
        let withoutIdPath = Path(path: "/v1/users", info: .init(mainType: "User", version: "1", isRelationship: false), operations: [])
        let withIdPath = Path(path: "/v1/users/{id}", info: .init(mainType: "User", version: "1", isRelationship: false), operations: [])
        let withIdAndRelationshipPath = Path(path: "/v1/users/{id}/something/{bob}", info: .init(mainType: "User", version: "1", isRelationship: true), operations: [])
        XCTAssertEqual(getOperation.getDocumentationId(path: withoutIdPath), "get-v1-users")
        XCTAssertEqual(postOperation.getDocumentationId(path: withIdPath), "post-v1-users-_id_")
        XCTAssertEqual(patchOperation.getDocumentationId(path: withIdPath), "patch-v1-users-_id_")
        XCTAssertEqual(putOperation.getDocumentationId(path: withIdAndRelationshipPath), "put-v1-users-_id_-something-_bob_")
        XCTAssertEqual(deleteOperation.getDocumentationId(path: withIdPath), "delete-v1-users-_id_")
    }

    func testGetName() throws {
        XCTAssertEqual(try Operation.getName(forId: "users_getInstance"), "getUser")
        XCTAssertEqual(try Operation.getName(forId: "users_getCollection"), "listUsers")
        XCTAssertEqual(try Operation.getName(forId: "betaGroups_betaTesterUsages_getMetrics"), "getMetricsForBetaTesterUsageInBetaGroup")
        XCTAssertEqual(try Operation.getName(forId: "appStoreVersions_build_getToOneRelationship"), "getBuildIdsForAppStoreVersion")
        XCTAssertEqual(try Operation.getName(forId: "users_visibleApps_getToManyRelationship"), "listVisibleAppIdsForUser")
        XCTAssertEqual(try Operation.getName(forId: "appStoreVersions_build_getToOneRelated"), "getBuildForAppStoreVersion")
        XCTAssertEqual(try Operation.getName(forId: "users_visibleApps_getToManyRelated"), "listVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "devices_createInstance"), "createDevice")
        XCTAssertEqual(try Operation.getName(forId: "users_visibleApps_createToManyRelationship"), "createVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "users_visibleApps_replaceToManyRelationship"), "replaceVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "devices_updateInstance"), "updateDevice")
        XCTAssertEqual(try Operation.getName(forId: "appStoreVersions_build_updateToOneRelationship"), "updateBuildForAppStoreVersion")
        XCTAssertEqual(try Operation.getName(forId: "bundleIds_deleteInstance"), "deleteBundleId")
        XCTAssertEqual(try Operation.getName(forId: "users_visibleApps_deleteToManyRelationship"), "deleteVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "salesReports_getCollection"), "getSalesReports")
        XCTAssertEqual(try Operation.getName(forId: "financeReports_getCollection"), "getFinanceReports")
        XCTAssertEqual(try Operation.getName(forId: "ciBuildRuns_createInstance"), "startCiBuildRun")
        XCTAssertThrowsError(try Operation.getName(forId: "invalid-id"))
    }
}
