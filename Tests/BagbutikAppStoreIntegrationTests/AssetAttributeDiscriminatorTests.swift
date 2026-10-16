import BagbutikAppStoreModels
import Foundation
import XCTest

final class AssetAttributeDiscriminatorTests: XCTestCase {
    // The specification maps both states to CommonAttributes for images and videos.
    func testProcessingCompletionAliasesDecodeWithoutLosingAttributes() throws {
        for state in ["COMPLETE", "PREPARE_FOR_SUBMISSION"] {
            let image = try JSONDecoder().decode(AppAssetLibraryImage.self, from: Data("""
            {"id":"image","type":"appAssetLibraryImages","attributes":{"state":"\(state)","fileName":"image.png","imageAsset":{"width":1179,"height":2556}}}
            """.utf8))
            guard case .appAssetLibraryImageCommonAttributes(let attributes) = image.attributes else {
                return XCTFail("Expected the shared image attributes schema")
            }
            XCTAssertEqual(attributes.state.rawValue, state)
            XCTAssertEqual(attributes.imageAsset?.width, 1179)
            let video = try JSONDecoder().decode(AppAssetLibraryVideo.self, from: Data("""
            {"id":"video","type":"appAssetLibraryVideos","attributes":{"state":"\(state)","fileName":"video.mov","videoAsset":"https://example.invalid/video.mov"}}
            """.utf8))
            guard case .appAssetLibraryVideoCommonAttributes(let attributes) = video.attributes else {
                return XCTFail("Expected the shared video attributes schema")
            }
            XCTAssertEqual(attributes.state.rawValue, state)
            XCTAssertEqual(attributes.videoAsset, "https://example.invalid/video.mov")
        }
    }
}
