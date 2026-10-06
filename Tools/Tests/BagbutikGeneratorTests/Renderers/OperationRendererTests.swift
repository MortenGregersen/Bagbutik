@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class OperationRendererTests: XCTestCase {
    func testRequestWithQueryParametersAndBodyUsesInitializerArgumentOrder() async throws {
        let operation = BagbutikSpecDecoder.Operation(
            id: "placements_createInstance",
            name: "createPlacement",
            method: .post,
            parameters: [.limit(name: "limit", documentation: "Maximum results", maximum: 50)],
            requestBody: .init(name: "PlacementCreateRequest", documentation: "Placement to create"),
            successResponseType: "PlacementResponse",
            errorResponseType: "ErrorResponse")
        let path = Path(path: "/v1/placements", info: .init(mainType: "Placements", version: "V1", isRelationship: false), operations: [operation])
        let renderer = OperationRenderer(docsLoader: DocsLoader(operationDocumentationById: [:]), shouldFormat: true)

        let rendered = try await renderer.render(operation: operation, in: path)

        let lines = rendered.components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespaces) }
        XCTAssertTrue(lines.joined(separator: "\n").contains("""
        path: "/v1/placements",
        method: .post,
        parameters: .init(limit: limit),
        requestBody: requestBody)
        """), rendered)
    }
}
