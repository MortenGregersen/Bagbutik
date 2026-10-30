@testable import BagbutikSpecDecoder
import XCTest

final class PlacementStatePatchTests: XCTestCase {
    func testPlacementFiltersStillUseSharedEnumAfterPatching() throws {
        let pathKey = "/v1/appEventLocalizations/{id}/placements"
        let values = ["ASSET_PROCESSING", "FAILED", "PARENT_APPROVED"]
        let operation = Operation(
            id: "appEventLocalizations_placements_getToManyRelated",
            name: "listPlacementsForAppEventLocalizationV1",
            method: .get,
            parameters: [.filter(name: "state", type: .enum(type: "String", values: values), required: false, documentation: "Filter by state")],
            successResponseType: "AppAssetLibraryPlacementsResponse",
            errorResponseType: "ErrorResponse")
        var spec = try Spec(paths: [pathKey: .init(
            path: pathKey,
            info: .init(mainType: "AppEventLocalization", version: "V1", isRelationship: true),
            operations: [operation])], components: .init(schemas: [
                "AppAssetLibraryPlacementState": .enum(.init(name: "AppAssetLibraryPlacementState", type: "String", caseValues: values)),
            ]))

        try spec.applyManualPatches()
        spec.flattenIdenticalSchemas()

        guard case .filter(_, .simple(let type), _, _) = spec.paths[pathKey]?.operations.first?.parameters?.first else {
            return XCTFail("The filter should reuse the placement state enum instead of generating a separate enum")
        }
        XCTAssertEqual(type.type, "AppAssetLibraryPlacementState")
    }

    func testPatchDoesNotDuplicateStatesWhenUpstreamAlreadyContainsThem() throws {
        for existingStates in [[], ["ACTIVE"], ["INACTIVE"], ["PENDING"], ["ACTIVE", "INACTIVE"], ["ACTIVE", "PENDING"], ["INACTIVE", "PENDING"], ["ACTIVE", "INACTIVE", "PENDING"]] {
            var spec = try Spec(paths: [:], components: .init(schemas: [
                "AppAssetLibraryPlacementState": .enum(.init(
                    name: "AppAssetLibraryPlacementState",
                    type: "String",
                    caseValues: ["PARENT_APPROVED"] + existingStates)),
            ]))

            try spec.applyManualPatches()
            try spec.applyManualPatches()

            guard case .enum(let schema) = spec.components.schemas["AppAssetLibraryPlacementState"] else {
                return XCTFail("Missing placement state schema")
            }
            XCTAssertEqual(Set(schema.cases.map(\.value)), ["PARENT_APPROVED", "ACTIVE", "INACTIVE", "PENDING"])
            XCTAssertEqual(schema.cases.count, 4)
            XCTAssertEqual(spec.patchedSchemasWithLocation.map(\.location), [.topLevel(schemaName: "AppAssetLibraryPlacementState")])
        }
    }
}
