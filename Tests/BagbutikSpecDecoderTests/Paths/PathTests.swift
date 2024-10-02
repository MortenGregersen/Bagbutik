@testable import BagbutikSpecDecoder
import XCTest

final class PathTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testNonRelationshipZeroParameters() throws {
        // Given
        let json = #"""
        {
            "/v1/users" : {
                "get": {
                    "tags": ["Users"],
                    "operationId": "users_getCollection",
                    "parameters": [{
                        "name": "include",
                        "in": "query",
                        "description": "comma-separated list of relationships to include",
                        "schema": {
                            "type": "array",
                            "items": {
                                "type": "string",
                                "enum": ["visibleApps"]
                            }
                        },
                        "style": "form",
                        "explode": false,
                        "required": false
                    }, {
                        "name": "limit",
                        "in": "query",
                        "description": "maximum resources per page",
                        "schema": {
                            "type": "integer",
                            "maximum": 200
                        },
                        "style": "form"
                    }],
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
                        "200": {
                            "description": "List of Users",
                            "content": {
                                "application/json": {
                                    "schema": {
                                        "$ref": "#/components/schemas/UsersResponse"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        let paths = try jsonDecoder.decode([String: Path].self, from: json.data(using: .utf8)!)
        // Then
        let path = paths["/v1/users"]
        XCTAssertEqual(path?.path, "/v1/users")
        XCTAssertEqual(path?.info, Path.Info(mainType: "User", version: "V1", isRelationship: false))
        XCTAssertEqual(path?.operations.count, 1)
        XCTAssertEqual(path?.operations[0].method, .get)
        XCTAssertEqual(path?.parameters, nil)
    }

    func testRelationshipOneParameter() throws {
        // Given
        let json = #"""
        {
            "/v1/users/{id}/relationships/visibleApps": {
                "post": {
                    "tags": ["Users"],
                    "operationId": "users_visibleApps_createToManyRelationship",
                    "requestBody": {
                        "description": "List of related linkages",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/UserVisibleAppsLinkagesRequest"
                                }
                            }
                        },
                        "required": true
                    },
                    "responses": {
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
                },
                "parameters": [{
                    "name": "id",
                    "in": "path",
                    "description": "the id of the requested resource",
                    "schema": {
                        "type": "string"
                    },
                    "style": "simple",
                    "required": true
                }]
            }
        }
        """#
        // When
        let paths = try jsonDecoder.decode([String: Path].self, from: json.data(using: .utf8)!)
        // Then
        let path = paths["/v1/users/{id}/relationships/visibleApps"]
        XCTAssertEqual(path?.path, "/v1/users/{id}/relationships/visibleApps")
        XCTAssertEqual(path?.info, Path.Info(mainType: "User", version: "V1", isRelationship: true))
        XCTAssertEqual(path?.operations.count, 1)
        XCTAssertEqual(path?.operations[0].method, .post)
        XCTAssertEqual(path?.parameters?.count, 1)
        XCTAssertEqual(path?.parameters?[0], Path.Parameter(name: "id", description: "the id of the requested resource"))
    }
    
    func testOtherVersion() throws {
        // Given
        let json = #"""
        {
            "/v2/users" : {
                "get": {
                    "tags": ["Users"],
                    "operationId": "users_getCollection",
                    "parameters": [{
                        "name": "include",
                        "in": "query",
                        "description": "comma-separated list of relationships to include",
                        "schema": {
                            "type": "array",
                            "items": {
                                "type": "string",
                                "enum": ["visibleApps"]
                            }
                        },
                        "style": "form",
                        "explode": false,
                        "required": false
                    }, {
                        "name": "limit",
                        "in": "query",
                        "description": "maximum resources per page",
                        "schema": {
                            "type": "integer",
                            "maximum": 200
                        },
                        "style": "form"
                    }],
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
                        "200": {
                            "description": "List of Users",
                            "content": {
                                "application/json": {
                                    "schema": {
                                        "$ref": "#/components/schemas/UsersResponse"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        let paths = try jsonDecoder.decode([String: Path].self, from: json.data(using: .utf8)!)
        // Then
        let path = paths["/v2/users"]
        XCTAssertEqual(path?.path, "/v2/users")
        XCTAssertEqual(path?.info, Path.Info(mainType: "User", version: "V2", isRelationship: false))
        XCTAssertEqual(path?.operations.count, 1)
        XCTAssertEqual(path?.operations[0].method, .get)
        XCTAssertEqual(path?.parameters, nil)
    }
    
    func testNoVersion() throws {
        // Given
        let json = #"""
        {
            "/users" : {
                "get": {
                    "tags": ["Users"],
                    "operationId": "users_getCollection",
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
                        "200": {
                            "description": "List of Users",
                            "content": {
                                "application/json": {
                                    "schema": {
                                        "$ref": "#/components/schemas/UsersResponse"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        """#
        // When
        XCTAssertThrowsError(try jsonDecoder.decode([String: Path].self, from: json.data(using: .utf8)!)) {
            // Then
            guard case let .dataCorrupted(context) = $0 as? DecodingError else { return XCTFail() }
            XCTAssertEqual(context.codingPath.last?.stringValue, "/users")
            XCTAssertEqual(context.debugDescription, "Version not found in path '/users'")
        }
    }
}
