import BagbutikAppStore
import BagbutikAppStoreModels
import Foundation
import XCTest

final class AppAssetLibraryPlacementTests: XCTestCase {
    // FB25217452: Reduced from successful live responses that failed to decode with spec 4.5.1.
    func testDecodeExistingPlacementsWithActiveAndInactiveStates() throws {
        let json = #"""
        {
          "data": [
            {
              "type": "appAssetLibraryPlacements",
              "id": "active-placement",
              "attributes": {
                "mediaType": "IMAGE",
                "placementType": "EVENT_CARD_ASSET",
                "placementGroup": "DEFAULT_PROFILE",
                "state": "ACTIVE",
                "stateDetails": null
              }
            },
            {
              "type": "appAssetLibraryPlacements",
              "id": "inactive-placement",
              "attributes": {
                "mediaType": "IMAGE",
                "placementType": "EVENT_CARD_ASSET",
                "placementGroup": "DEFAULT_PROFILE",
                "state": "INACTIVE",
                "stateDetails": null
              }
            }
          ],
          "links": { "self": "https://example.invalid/placements" }
        }
        """#

        let response = try JSONDecoder().decode(AppAssetLibraryPlacementsResponse.self, from: Data(json.utf8))

        XCTAssertEqual(response.data.map { $0.attributes?.state }, [.active, .inactive])
        XCTAssertEqual(response.data.map(\.id), ["active-placement", "inactive-placement"])
    }

    // Image shape observed in successful API responses; video shape checks the parallel contract.
    func testDecodeMediaRelationshipsWithoutNestedDiscriminator() throws {
        for media in ["IMAGE", "VIDEO"] {
            let key = media.lowercased()
            let other = media == "IMAGE" ? "video" : "image"
            let json = """
            {"type":"appAssetLibraryPlacements","id":"placement",
             "attributes":{"mediaType":"\(media)","state":"ACTIVE"},
             "relationships":{
               "\(key)":{"data":{"type":"appAssetLibrary\(media == "IMAGE" ? "Images" : "Videos")","id":"asset"}},
               "\(other)":{"data":null},
               "appEventLocalization":{"data":{"type":"appEventLocalizations","id":"localization"}}
             }}
            """
            let placement = try JSONDecoder().decode(AppAssetLibraryPlacement.self, from: Data(json.utf8))
            let relationships = try XCTUnwrap(placement.relationships)
            XCTAssertEqual(relationships.image?.data?.id, media == "IMAGE" ? "asset" : nil)
            XCTAssertEqual(relationships.video?.data?.id, media == "VIDEO" ? "asset" : nil)
            XCTAssertNotNil(relationships.image)
            XCTAssertNotNil(relationships.video)
            XCTAssertEqual(relationships.appEventLocalization?.data?.id, "localization")
            let encoded = try JSONSerialization.jsonObject(with: JSONEncoder().encode(placement)) as! NSDictionary
            let original = try JSONSerialization.jsonObject(with: Data(json.utf8)) as! NSDictionary
            XCTAssertEqual(encoded, original)
        }
    }

    func testPlacementFiltersAcceptObservedStates() {
        let filter = ListPlacementsForAppEventLocalizationV1.Filter.state([.active, .inactive])
        XCTAssertEqual(filter.value, "ACTIVE,INACTIVE")
    }
}
