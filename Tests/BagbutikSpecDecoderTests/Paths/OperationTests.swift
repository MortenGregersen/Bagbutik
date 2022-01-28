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
        XCTAssertEqual(getOperation?.documentation?.title, "List Territories")
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
        XCTAssertEqual(patchOperation?.documentation?.title, "Modify an Age Rating Declaration")
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
                        "description": "List of FinanceReports",
                        "content": {
                            "gzip": {
                                "schema": {
                                    "type": "string",
                                    "format": "binary"
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
        XCTAssertEqual(getOperation?.documentation?.title, "Download Finance Reports")
        XCTAssertEqual(getOperation?.method, .get)
        XCTAssertEqual(getOperation?.parameters, [])
        XCTAssertEqual(getOperation?.requestBody, nil)
        XCTAssertEqual(getOperation?.successResponseType, "GzipResponse")
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
        XCTAssertEqual(getOperation?.documentation?.title, "Delete a Profile")
        XCTAssertEqual(getOperation?.method, .delete)
        XCTAssertEqual(getOperation?.parameters, nil)
        XCTAssertEqual(getOperation?.requestBody, nil)
        XCTAssertEqual(getOperation?.successResponseType, "EmptyResponse")
        XCTAssertEqual(getOperation?.errorResponseType, "ErrorResponse")
    }

    func testGetName() throws {
        XCTAssertEqual(try Operation.getName(forId: "users-get_instance"), "getUser")
        XCTAssertEqual(try Operation.getName(forId: "users-get_collection"), "listUsers")
        XCTAssertEqual(try Operation.getName(forId: "appStoreVersions-build-get_to_one_relationship"), "getBuildIdsForAppStoreVersion")
        XCTAssertEqual(try Operation.getName(forId: "users-visibleApps-get_to_many_relationship"), "listVisibleAppIdsForUser")
        XCTAssertEqual(try Operation.getName(forId: "appStoreVersions-build-get_to_one_related"), "getBuildForAppStoreVersion")
        XCTAssertEqual(try Operation.getName(forId: "users-visibleApps-get_to_many_related"), "listVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "devices-create_instance"), "createDevice")
        XCTAssertEqual(try Operation.getName(forId: "users-visibleApps-create_to_many_relationship"), "createVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "users-visibleApps-replace_to_many_relationship"), "replaceVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "devices-update_instance"), "updateDevice")
        XCTAssertEqual(try Operation.getName(forId: "appStoreVersions-build-update_to_one_relationship"), "updateBuildForAppStoreVersion")
        XCTAssertEqual(try Operation.getName(forId: "bundleIds-delete_instance"), "deleteBundleId")
        XCTAssertEqual(try Operation.getName(forId: "users-visibleApps-delete_to_many_relationship"), "deleteVisibleAppsForUser")
        XCTAssertEqual(try Operation.getName(forId: "salesReports-get_collection"), "getSalesReports")
        XCTAssertEqual(try Operation.getName(forId: "financeReports-get_collection"), "getFinanceReports")
        XCTAssertEqual(try Operation.getName(forId: "ciBuildRuns-create_instance"), "startCiBuildRun")
        XCTAssertThrowsError(try Operation.getName(forId: "invalid-id"))
    }

    func testGetDocumentation() {
        XCTAssertNil(try Operation.getDocumentation(forId: "invalid-id"))
    }
}
