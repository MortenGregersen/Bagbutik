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

    func testPlacementFiltersAcceptObservedStates() {
        let filter = ListPlacementsForAppEventLocalizationV1.Filter.state([.active, .inactive])
        XCTAssertEqual(filter.value, "ACTIVE,INACTIVE")
    }
}
