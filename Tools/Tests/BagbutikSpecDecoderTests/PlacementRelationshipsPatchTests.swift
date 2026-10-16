@testable import BagbutikSpecDecoder
import XCTest

final class PlacementRelationshipsPatchTests: XCTestCase {
    func testPatchPreservesBothMediaLinksAndIsIdempotent() throws {
        let relationships = OneOfSchema(
            options: [.schemaRef("AppAssetLibraryPlacementImageRelationships"), .schemaRef("AppAssetLibraryPlacementVideoRelationships")],
            discriminator: .init(propertyName: "mediaType", mapping: [:]))
        var spec = try Spec(paths: [:], components: .init(schemas: [
            "AppAssetLibraryPlacement": .object(.init(name: "AppAssetLibraryPlacement", url: "https://example.invalid/placement", properties: [
                "relationships": .init(type: .oneOf(name: "Relationships", schema: relationships)),
            ])),
            "AppAssetLibraryPlacementImageRelationships": .object(.init(name: "ImageRelationships", url: "", properties: [
                "image": .init(type: .simple(.string())),
                "localization": .init(type: .simple(.string())),
            ])),
            "AppAssetLibraryPlacementVideoRelationships": .object(.init(name: "VideoRelationships", url: "", properties: [
                "video": .init(type: .simple(.string())),
                "localization": .init(type: .simple(.string())),
            ])),
        ]))
        try spec.applyManualPatches()
        let locations = spec.patchedSchemasWithLocation.map(\.location)
        let patched = spec.components.schemas["AppAssetLibraryPlacement"]
        try spec.applyManualPatches()
        XCTAssertEqual(spec.components.schemas["AppAssetLibraryPlacement"], patched)
        guard case .object(let placement) = patched,
              case .schema(let schema) = placement.properties["relationships"]?.type else {
            return XCTFail("Expected relationships without a nested discriminator")
        }
        XCTAssertEqual(Set(schema.properties.keys), ["image", "video", "localization"])
        XCTAssertTrue(schema.requiredProperties.isEmpty)
        XCTAssertEqual(locations, [
            .topLevel(schemaName: "AppAssetLibraryPlacement"),
        ])
    }
}
