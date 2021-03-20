@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class OperationRendererTests: XCTestCase {
    typealias Parameter = BagbutikSpecDecoder.Operation.Parameter

    func testRenderSimple() throws {
        // Given
        let renderer = OperationRenderer()
        let documentation = Operation.Documentation(title: "Documentation title", summary: "Documentation summary", url: "https://developer.apple.com/documentation")
        let parameters: [Parameter] = [
            .limit(name: "limit", documentation: "maximum resources per page", maximum: 200)
        ]
        let operation = Operation(name: "listUsers", documentation: documentation, method: .get, parameters: parameters, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        let path = Path(path: "/users", info: .init(mainType: "User", isRelationship: false), operations: [operation])
        // When
        let rendered = try renderer.render(operation: operation, in: path)
        // Then
        XCTAssertEqual(rendered, #"""
        public extension Request {
            /**
              # Documentation title
              Documentation summary

              Full documentation:
              <https://developer.apple.com/documentation>

              - Parameter limit: Maximum resources per page - maximum 200
              - Returns: A `Request` with to send to an instance of `BagbutikService`
             */
            static func listUsers(limit: Int? = nil) -> Request<UsersResponse, ErrorResponse> {
                return .init(path: "/users", method: .get, parameters: .init(limit: limit))
            }
        }

        """#)
    }

    func testRenderParameters() throws {
        // Given
        let renderer = OperationRenderer()
        let documentation = Operation.Documentation(title: "Documentation title", summary: "Documentation summary", url: "https://developer.apple.com/documentation")
        let parameters: [Parameter] = [
            .fields(name: "name", type: .simple(type: .init(type: "string")), documentation: "The name of the user"),
            .fields(name: "vehicles", type: .enum(type: "string", values: ["car", "bicycle"]), documentation: "Fields for included vehicles"),
            .fields(name: "devices", type: .enum(type: "string", values: ["model", "os"]), documentation: "Fields for included devices"),
            .filter(name: "name", type: .simple(type: .init(type: "string")), required: false, documentation: "Filter by name"),
            .filter(name: "vehicles.properties", type: .enum(type: "string", values: ["car", "bicycle"]), required: false, documentation: "Filter by vehicles properties"),
            .filter(name: "devices.properties", type: .enum(type: "string", values: ["model", "os"]), required: true, documentation: "Filter by device properties"),
            .exists(name: "vehicle", type: .simple(type: .init(type: "boolean")), documentation: "Check for existance of a vehicle"),
            .exists(name: "device", type: .simple(type: .init(type: "boolean")), documentation: "Check for existance of a device"),
            .include(type: .enum(type: "string", values: ["devices", "glasses"])),
            .sort(type: .enum(type: "string", values: ["-name", "name", "-devicesCount", "devicesCount"]), documentation: "How to sort the users"),
            .limit(name: "limit", documentation: "Maximum of users", maximum: 200),
            .limit(name: "devices", documentation: "Maximum of included devices", maximum: 10)
        ]
        let operation = Operation(name: "listUsers", documentation: documentation, method: .get, parameters: parameters, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        let path = Path(path: "/users", info: .init(mainType: "User", isRelationship: false), operations: [operation])
        // When
        let rendered = try renderer.render(operation: operation, in: path)
        // Then
        XCTAssertEqual(rendered, #"""
        public extension Request {
            enum ListUsers {
                /**
                 Fields to return for included related types.
                 */
                public enum Field: FieldParameter {
                    /// Fields for included devices
                    case devices([Devices])
                    /// The name of the user
                    case name([String])
                    /// Fields for included vehicles
                    case vehicles([Vehicles])

                    public enum Devices: String, ParameterValue, CaseIterable {
                        case model
                        case os
                    }

                    public enum Vehicles: String, ParameterValue, CaseIterable {
                        case car
                        case bicycle
                    }
                }

                /**
                 Attributes, relationships, and IDs by which to filter.

                 Required: devices.properties
                 */
                public enum Filter: FilterParameter {
                    /// Filter by device properties
                    case devices_properties([DevicesProperties])
                    /// Filter by name
                    case name([String])
                    /// Filter by vehicles properties
                    case vehicles_properties([VehiclesProperties])

                    public enum DevicesProperties: String, ParameterValue, CaseIterable {
                        case model
                        case os
                    }

                    public enum VehiclesProperties: String, ParameterValue, CaseIterable {
                        case car
                        case bicycle
                    }
                }

                /**
                 Attributes, relationships, and IDs to check for existence.
                 */
                public enum Exist: ExistParameter {
                    /// Check for existance of a device
                    case device(Bool)
                    /// Check for existance of a vehicle
                    case vehicle(Bool)
                }

                /**
                 Relationship data to include in the response.
                 */
                public enum Include: String, IncludeParameter {
                    case devices, glasses
                }

                /**
                 Attributes by which to sort.
                 */
                public enum Sort: String, SortParameter {
                    case devicesCountAscending = "devicesCount"
                    case devicesCountDescending = "-devicesCount"
                    case nameAscending = "name"
                    case nameDescending = "-name"
                }

                /**
                 Number of included related resources to return.
                 */
                public enum Limit: LimitParameter {
                    /// Maximum of users - maximum 200
                    case limit(Int)
                    /// Maximum of included devices - maximum 10
                    case devices(Int)
                }
            }

            /**
              # Documentation title
              Documentation summary

              Full documentation:
              <https://developer.apple.com/documentation>

              - Parameter fields: Fields to return for included related types
              - Parameter filters: Attributes, relationships, and IDs by which to filter
              - Parameter exists: Attributes, relationships, and IDs to check for existence
              - Parameter includes: Relationship data to include in the response
              - Parameter sorts: Attributes by which to sort
              - Parameter limits: Number of resources to return
              - Returns: A `Request` with to send to an instance of `BagbutikService`
             */
            static func listUsers(fields: [ListUsers.Field]? = nil,
                                  filters: [ListUsers.Filter]? = nil,
                                  exists: [ListUsers.Exist]? = nil,
                                  includes: [ListUsers.Include]? = nil,
                                  sorts: [ListUsers.Sort]? = nil,
                                  limits: [ListUsers.Limit]? = nil) -> Request<UsersResponse, ErrorResponse>
            {
                return .init(path: "/users", method: .get, parameters: .init(fields: fields,
                                                                             filters: filters,
                                                                             exists: exists,
                                                                             includes: includes,
                                                                             sorts: sorts,
                                                                             limits: limits))
            }
        }

        """#)
    }

    func testRenderRequest() throws {
        // Given
        let renderer = OperationRenderer()
        let documentation = Operation.Documentation(title: "Documentation title", summary: "Documentation summary", url: "https://developer.apple.com/documentation")
        let requestBody = RequestBody(name: "UserUpdateRequest", description: "User representation")
        let operation = Operation(name: "updateUser", documentation: documentation, method: .patch, requestBody: requestBody, successResponseType: "UpdateUserResponse", errorResponseType: "ErrorResponse")
        let parameters: [Path.Parameter] = [.init(name: "id", description: "Id of the user to update")]
        let path = Path(path: "/users/{id}", info: .init(mainType: "User", isRelationship: false), operations: [operation], parameters: parameters)
        // When
        let rendered = try renderer.render(operation: operation, in: path)
        // Then
        XCTAssertEqual(rendered, #"""
        public extension Request {
            /**
              # Documentation title
              Documentation summary

              Full documentation:
              <https://developer.apple.com/documentation>

              - Parameter id: Id of the user to update
              - Parameter requestBody: User representation
              - Returns: A `Request` with to send to an instance of `BagbutikService`
             */
            static func updateUser(id: String,
                                   requestBody: UserUpdateRequest) -> Request<UpdateUserResponse, ErrorResponse>
            {
                return .init(path: "/users/\(id)", method: .patch, requestBody: requestBody)
            }
        }

        """#)
    }

    func testUnknownTypeOfExists() throws {
        // Given
        let documentation = Operation.Documentation(title: "Documentation title", summary: "Documentation summary", url: "https://developer.apple.com/documentation")
        let parameters: [Parameter] = [
            .exists(name: "hair", type: .enum(type: "length", values: ["SHORT", "LONG"]), documentation: "description for hair")
        ]
        let operation = Operation(name: "listUsers", documentation: documentation, method: .get, parameters: parameters, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        let path = Path(path: "/users", info: .init(mainType: "User", isRelationship: false), operations: [operation])
        // When
        var thrownError: Error?
        XCTAssertThrowsError(try OperationRenderer.operationContext(for: operation, in: path)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? OperationRendererError, OperationRendererError.unknownTypeOfExists(name: "hair"))
    }

    func testUnknownTypeOfInclude() throws {
        // Given
        let documentation = Operation.Documentation(title: "Documentation title", summary: "Documentation summary", url: "https://developer.apple.com/documentation")
        let parameters: [Parameter] = [
            .include(type: .simple(type: .string))
        ]
        let operation = Operation(name: "listUsers", documentation: documentation, method: .get, parameters: parameters, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        let path = Path(path: "/users", info: .init(mainType: "User", isRelationship: false), operations: [operation])
        // When
        var thrownError: Error?
        XCTAssertThrowsError(try OperationRenderer.operationContext(for: operation, in: path)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? OperationRendererError, OperationRendererError.unknownTypeOfInclude)
    }

    func testUnknownTypeOfSort() throws {
        // Given
        let documentation = Operation.Documentation(title: "Documentation title", summary: "Documentation summary", url: "https://developer.apple.com/documentation")
        let parameters: [Parameter] = [
            .sort(type: .simple(type: .string), documentation: "sorting")
        ]
        let operation = Operation(name: "listUsers", documentation: documentation, method: .get, parameters: parameters, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        let path = Path(path: "/users", info: .init(mainType: "User", isRelationship: false), operations: [operation])
        // When
        var thrownError: Error?
        XCTAssertThrowsError(try OperationRenderer.operationContext(for: operation, in: path)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? OperationRendererError, OperationRendererError.unknownTypeOfSort)
    }
}
