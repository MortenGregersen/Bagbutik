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

    func testGetName() throws {
        XCTAssertEqual(try Operation.getName(forId: "users-get_instance"), "getUser")
        XCTAssertEqual(try Operation.getName(forId: "users-get_collection"), "listUsers")
        XCTAssertEqual(try Operation.getName(forId: "betaGroups-betaTesterUsages-get_metrics"), "getMetricsForBetaTesterUsageInBetaGroup")
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
}
