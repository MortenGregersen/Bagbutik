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
}
