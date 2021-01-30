import BagbutikGenerator
@testable import BagbutikSpecDecoder
import PathKit
import XCTest

final class SchemaRenderingTests: XCTestCase {
    static var spec: Spec!
    
    override class func setUp() {
        super.setUp()
        let specUrl = Bundle.module.url(forResource: "app-store-connect-openapi-spec", withExtension: "json")!
        let specContents = try! String(contentsOf: specUrl)
        let specData = specContents.data(using: .utf8)!
        spec = try! JSONDecoder().decode(Spec.self, from: specData)
    }
    
    private func renderSchema(named name: String) throws -> String {
        let schema = Self.spec.components.schemas[name]!
        switch schema {
        case .enum(let enumSchema):
            return try EnumSchemaRenderer().render(enumSchema: enumSchema)
        case .object(let objectSchema):
            let includesFixUps = Self.spec.includesFixUps[objectSchema.name] ?? []
            return try ObjectSchemaRenderer().render(objectSchema: objectSchema, includesFixUps: includesFixUps)
        }
    }
    
    private var modelsDirPath: PathKit.Path {
        let outputPath = "./Bagbutik"
        return PathKit.Path(outputPath) + PathKit.Path("Models")
    }
    
    private func loadPrerenderedSchema(named name: String) throws -> String {
        let fileName = PathKit.Path("\(name).swift")
        let filePath = modelsDirPath + fileName
        return try filePath.read()
    }
    
    func testFilesCount() throws {
        let renderedSchemas = try modelsDirPath.children().count
        let decodedSchemas = Self.spec.components.schemas.count
        XCTAssertEqual(renderedSchemas, decodedSchemas)
    }
    
    func testAgeRatingDeclaration() throws {
        let name = "AgeRatingDeclaration"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAgeRatingDeclarationResponse() throws {
        let name = "AgeRatingDeclarationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAgeRatingDeclarationUpdateRequest() throws {
        let name = "AgeRatingDeclarationUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testApp() throws {
        let name = "App"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppBetaTestersLinkagesRequest() throws {
        let name = "AppBetaTestersLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppCategoriesResponse() throws {
        let name = "AppCategoriesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppCategory() throws {
        let name = "AppCategory"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppCategoryResponse() throws {
        let name = "AppCategoryResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppEncryptionDeclaration() throws {
        let name = "AppEncryptionDeclaration"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppEncryptionDeclarationBuildsLinkagesRequest() throws {
        let name = "AppEncryptionDeclarationBuildsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppEncryptionDeclarationResponse() throws {
        let name = "AppEncryptionDeclarationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppEncryptionDeclarationState() throws {
        let name = "AppEncryptionDeclarationState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppEncryptionDeclarationsResponse() throws {
        let name = "AppEncryptionDeclarationsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfo() throws {
        let name = "AppInfo"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoLocalization() throws {
        let name = "AppInfoLocalization"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoLocalizationCreateRequest() throws {
        let name = "AppInfoLocalizationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoLocalizationResponse() throws {
        let name = "AppInfoLocalizationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoLocalizationUpdateRequest() throws {
        let name = "AppInfoLocalizationUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoLocalizationsResponse() throws {
        let name = "AppInfoLocalizationsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoResponse() throws {
        let name = "AppInfoResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfoUpdateRequest() throws {
        let name = "AppInfoUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppInfosResponse() throws {
        let name = "AppInfosResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppMediaAssetState() throws {
        let name = "AppMediaAssetState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppMediaStateError() throws {
        let name = "AppMediaStateError"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreOrder() throws {
        let name = "AppPreOrder"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreOrderCreateRequest() throws {
        let name = "AppPreOrderCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreOrderResponse() throws {
        let name = "AppPreOrderResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreOrderUpdateRequest() throws {
        let name = "AppPreOrderUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreview() throws {
        let name = "AppPreview"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewCreateRequest() throws {
        let name = "AppPreviewCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewResponse() throws {
        let name = "AppPreviewResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewSet() throws {
        let name = "AppPreviewSet"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewSetAppPreviewsLinkagesRequest() throws {
        let name = "AppPreviewSetAppPreviewsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewSetAppPreviewsLinkagesResponse() throws {
        let name = "AppPreviewSetAppPreviewsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewSetCreateRequest() throws {
        let name = "AppPreviewSetCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewSetResponse() throws {
        let name = "AppPreviewSetResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewSetsResponse() throws {
        let name = "AppPreviewSetsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewUpdateRequest() throws {
        let name = "AppPreviewUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPreviewsResponse() throws {
        let name = "AppPreviewsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPrice() throws {
        let name = "AppPrice"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPricePoint() throws {
        let name = "AppPricePoint"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPricePointResponse() throws {
        let name = "AppPricePointResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPricePointsResponse() throws {
        let name = "AppPricePointsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPriceResponse() throws {
        let name = "AppPriceResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPriceTier() throws {
        let name = "AppPriceTier"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPriceTierResponse() throws {
        let name = "AppPriceTierResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPriceTiersResponse() throws {
        let name = "AppPriceTiersResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppPricesResponse() throws {
        let name = "AppPricesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppResponse() throws {
        let name = "AppResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshot() throws {
        let name = "AppScreenshot"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotCreateRequest() throws {
        let name = "AppScreenshotCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotResponse() throws {
        let name = "AppScreenshotResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotSet() throws {
        let name = "AppScreenshotSet"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotSetAppScreenshotsLinkagesRequest() throws {
        let name = "AppScreenshotSetAppScreenshotsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotSetAppScreenshotsLinkagesResponse() throws {
        let name = "AppScreenshotSetAppScreenshotsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotSetCreateRequest() throws {
        let name = "AppScreenshotSetCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotSetResponse() throws {
        let name = "AppScreenshotSetResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotSetsResponse() throws {
        let name = "AppScreenshotSetsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotUpdateRequest() throws {
        let name = "AppScreenshotUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppScreenshotsResponse() throws {
        let name = "AppScreenshotsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreAgeRating() throws {
        let name = "AppStoreAgeRating"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewAttachment() throws {
        let name = "AppStoreReviewAttachment"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewAttachmentCreateRequest() throws {
        let name = "AppStoreReviewAttachmentCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewAttachmentResponse() throws {
        let name = "AppStoreReviewAttachmentResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewAttachmentUpdateRequest() throws {
        let name = "AppStoreReviewAttachmentUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewAttachmentsResponse() throws {
        let name = "AppStoreReviewAttachmentsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewDetail() throws {
        let name = "AppStoreReviewDetail"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewDetailCreateRequest() throws {
        let name = "AppStoreReviewDetailCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewDetailResponse() throws {
        let name = "AppStoreReviewDetailResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreReviewDetailUpdateRequest() throws {
        let name = "AppStoreReviewDetailUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersion() throws {
        let name = "AppStoreVersion"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionBuildLinkageRequest() throws {
        let name = "AppStoreVersionBuildLinkageRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionBuildLinkageResponse() throws {
        let name = "AppStoreVersionBuildLinkageResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionCreateRequest() throws {
        let name = "AppStoreVersionCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionLocalization() throws {
        let name = "AppStoreVersionLocalization"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionLocalizationCreateRequest() throws {
        let name = "AppStoreVersionLocalizationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionLocalizationResponse() throws {
        let name = "AppStoreVersionLocalizationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionLocalizationUpdateRequest() throws {
        let name = "AppStoreVersionLocalizationUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionLocalizationsResponse() throws {
        let name = "AppStoreVersionLocalizationsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionPhasedRelease() throws {
        let name = "AppStoreVersionPhasedRelease"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionPhasedReleaseCreateRequest() throws {
        let name = "AppStoreVersionPhasedReleaseCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionPhasedReleaseResponse() throws {
        let name = "AppStoreVersionPhasedReleaseResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionPhasedReleaseUpdateRequest() throws {
        let name = "AppStoreVersionPhasedReleaseUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionResponse() throws {
        let name = "AppStoreVersionResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionState() throws {
        let name = "AppStoreVersionState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionSubmission() throws {
        let name = "AppStoreVersionSubmission"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionSubmissionCreateRequest() throws {
        let name = "AppStoreVersionSubmissionCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionSubmissionResponse() throws {
        let name = "AppStoreVersionSubmissionResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionUpdateRequest() throws {
        let name = "AppStoreVersionUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppStoreVersionsResponse() throws {
        let name = "AppStoreVersionsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppUpdateRequest() throws {
        let name = "AppUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testAppsResponse() throws {
        let name = "AppsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppLocalization() throws {
        let name = "BetaAppLocalization"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppLocalizationCreateRequest() throws {
        let name = "BetaAppLocalizationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppLocalizationResponse() throws {
        let name = "BetaAppLocalizationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppLocalizationUpdateRequest() throws {
        let name = "BetaAppLocalizationUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppLocalizationsResponse() throws {
        let name = "BetaAppLocalizationsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewDetail() throws {
        let name = "BetaAppReviewDetail"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewDetailResponse() throws {
        let name = "BetaAppReviewDetailResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewDetailUpdateRequest() throws {
        let name = "BetaAppReviewDetailUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewDetailsResponse() throws {
        let name = "BetaAppReviewDetailsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewSubmission() throws {
        let name = "BetaAppReviewSubmission"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewSubmissionCreateRequest() throws {
        let name = "BetaAppReviewSubmissionCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewSubmissionResponse() throws {
        let name = "BetaAppReviewSubmissionResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaAppReviewSubmissionsResponse() throws {
        let name = "BetaAppReviewSubmissionsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaBuildLocalization() throws {
        let name = "BetaBuildLocalization"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaBuildLocalizationCreateRequest() throws {
        let name = "BetaBuildLocalizationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaBuildLocalizationResponse() throws {
        let name = "BetaBuildLocalizationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaBuildLocalizationUpdateRequest() throws {
        let name = "BetaBuildLocalizationUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaBuildLocalizationsResponse() throws {
        let name = "BetaBuildLocalizationsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroup() throws {
        let name = "BetaGroup"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupBetaTestersLinkagesRequest() throws {
        let name = "BetaGroupBetaTestersLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupBetaTestersLinkagesResponse() throws {
        let name = "BetaGroupBetaTestersLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupBuildsLinkagesRequest() throws {
        let name = "BetaGroupBuildsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupBuildsLinkagesResponse() throws {
        let name = "BetaGroupBuildsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupCreateRequest() throws {
        let name = "BetaGroupCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupResponse() throws {
        let name = "BetaGroupResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupUpdateRequest() throws {
        let name = "BetaGroupUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaGroupsResponse() throws {
        let name = "BetaGroupsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaInviteType() throws {
        let name = "BetaInviteType"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaLicenseAgreement() throws {
        let name = "BetaLicenseAgreement"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaLicenseAgreementResponse() throws {
        let name = "BetaLicenseAgreementResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaLicenseAgreementUpdateRequest() throws {
        let name = "BetaLicenseAgreementUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaLicenseAgreementsResponse() throws {
        let name = "BetaLicenseAgreementsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaReviewState() throws {
        let name = "BetaReviewState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTester() throws {
        let name = "BetaTester"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterAppsLinkagesRequest() throws {
        let name = "BetaTesterAppsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterAppsLinkagesResponse() throws {
        let name = "BetaTesterAppsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterBetaGroupsLinkagesRequest() throws {
        let name = "BetaTesterBetaGroupsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterBetaGroupsLinkagesResponse() throws {
        let name = "BetaTesterBetaGroupsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterBuildsLinkagesRequest() throws {
        let name = "BetaTesterBuildsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterBuildsLinkagesResponse() throws {
        let name = "BetaTesterBuildsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterCreateRequest() throws {
        let name = "BetaTesterCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterInvitation() throws {
        let name = "BetaTesterInvitation"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterInvitationCreateRequest() throws {
        let name = "BetaTesterInvitationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterInvitationResponse() throws {
        let name = "BetaTesterInvitationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTesterResponse() throws {
        let name = "BetaTesterResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBetaTestersResponse() throws {
        let name = "BetaTestersResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBrazilAgeRating() throws {
        let name = "BrazilAgeRating"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuild() throws {
        let name = "Build"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildAppEncryptionDeclarationLinkageRequest() throws {
        let name = "BuildAppEncryptionDeclarationLinkageRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildAppEncryptionDeclarationLinkageResponse() throws {
        let name = "BuildAppEncryptionDeclarationLinkageResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaDetail() throws {
        let name = "BuildBetaDetail"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaDetailResponse() throws {
        let name = "BuildBetaDetailResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaDetailUpdateRequest() throws {
        let name = "BuildBetaDetailUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaDetailsResponse() throws {
        let name = "BuildBetaDetailsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaGroupsLinkagesRequest() throws {
        let name = "BuildBetaGroupsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaNotification() throws {
        let name = "BuildBetaNotification"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaNotificationCreateRequest() throws {
        let name = "BuildBetaNotificationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildBetaNotificationResponse() throws {
        let name = "BuildBetaNotificationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildIcon() throws {
        let name = "BuildIcon"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildIconsResponse() throws {
        let name = "BuildIconsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildIndividualTestersLinkagesRequest() throws {
        let name = "BuildIndividualTestersLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildIndividualTestersLinkagesResponse() throws {
        let name = "BuildIndividualTestersLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildResponse() throws {
        let name = "BuildResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildUpdateRequest() throws {
        let name = "BuildUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBuildsResponse() throws {
        let name = "BuildsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleId() throws {
        let name = "BundleId"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdCapabilitiesResponse() throws {
        let name = "BundleIdCapabilitiesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdCapability() throws {
        let name = "BundleIdCapability"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdCapabilityCreateRequest() throws {
        let name = "BundleIdCapabilityCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdCapabilityResponse() throws {
        let name = "BundleIdCapabilityResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdCapabilityUpdateRequest() throws {
        let name = "BundleIdCapabilityUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdCreateRequest() throws {
        let name = "BundleIdCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdPlatform() throws {
        let name = "BundleIdPlatform"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdResponse() throws {
        let name = "BundleIdResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdUpdateRequest() throws {
        let name = "BundleIdUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testBundleIdsResponse() throws {
        let name = "BundleIdsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCapabilityOption() throws {
        let name = "CapabilityOption"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCapabilitySetting() throws {
        let name = "CapabilitySetting"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCapabilityType() throws {
        let name = "CapabilityType"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCertificate() throws {
        let name = "Certificate"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCertificateCreateRequest() throws {
        let name = "CertificateCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCertificateResponse() throws {
        let name = "CertificateResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCertificateType() throws {
        let name = "CertificateType"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testCertificatesResponse() throws {
        let name = "CertificatesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDevice() throws {
        let name = "Device"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDeviceCreateRequest() throws {
        let name = "DeviceCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDeviceResponse() throws {
        let name = "DeviceResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDeviceUpdateRequest() throws {
        let name = "DeviceUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDevicesResponse() throws {
        let name = "DevicesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDiagnosticLog() throws {
        let name = "DiagnosticLog"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDiagnosticLogsResponse() throws {
        let name = "DiagnosticLogsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDiagnosticSignature() throws {
        let name = "DiagnosticSignature"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDiagnosticSignaturesResponse() throws {
        let name = "DiagnosticSignaturesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testDocumentLinks() throws {
        let name = "DocumentLinks"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testEndUserLicenseAgreement() throws {
        let name = "EndUserLicenseAgreement"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testEndUserLicenseAgreementCreateRequest() throws {
        let name = "EndUserLicenseAgreementCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testEndUserLicenseAgreementResponse() throws {
        let name = "EndUserLicenseAgreementResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testEndUserLicenseAgreementUpdateRequest() throws {
        let name = "EndUserLicenseAgreementUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testErrorResponse() throws {
        let name = "ErrorResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testExternalBetaState() throws {
        let name = "ExternalBetaState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testGameCenterEnabledVersion() throws {
        let name = "GameCenterEnabledVersion"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testGameCenterEnabledVersionCompatibleVersionsLinkagesRequest() throws {
        let name = "GameCenterEnabledVersionCompatibleVersionsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testGameCenterEnabledVersionCompatibleVersionsLinkagesResponse() throws {
        let name = "GameCenterEnabledVersionCompatibleVersionsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testGameCenterEnabledVersionsResponse() throws {
        let name = "GameCenterEnabledVersionsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testIconAssetType() throws {
        let name = "IconAssetType"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testIdfaDeclaration() throws {
        let name = "IdfaDeclaration"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testIdfaDeclarationCreateRequest() throws {
        let name = "IdfaDeclarationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testIdfaDeclarationResponse() throws {
        let name = "IdfaDeclarationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testIdfaDeclarationUpdateRequest() throws {
        let name = "IdfaDeclarationUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testImageAsset() throws {
        let name = "ImageAsset"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testInAppPurchase() throws {
        let name = "InAppPurchase"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testInAppPurchaseResponse() throws {
        let name = "InAppPurchaseResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testInAppPurchasesResponse() throws {
        let name = "InAppPurchasesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testInternalBetaState() throws {
        let name = "InternalBetaState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testKidsAgeBand() throws {
        let name = "KidsAgeBand"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPagedDocumentLinks() throws {
        let name = "PagedDocumentLinks"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPagingInformation() throws {
        let name = "PagingInformation"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPerfPowerMetric() throws {
        let name = "PerfPowerMetric"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPerfPowerMetricsResponse() throws {
        let name = "PerfPowerMetricsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPhasedReleaseState() throws {
        let name = "PhasedReleaseState"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPlatform() throws {
        let name = "Platform"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPreReleaseVersionsResponse() throws {
        let name = "PreReleaseVersionsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPrereleaseVersion() throws {
        let name = "PrereleaseVersion"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPrereleaseVersionResponse() throws {
        let name = "PrereleaseVersionResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testPreviewType() throws {
        let name = "PreviewType"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testProfile() throws {
        let name = "Profile"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testProfileCreateRequest() throws {
        let name = "ProfileCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testProfileResponse() throws {
        let name = "ProfileResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testProfilesResponse() throws {
        let name = "ProfilesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testResourceLinks() throws {
        let name = "ResourceLinks"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testRoutingAppCoverage() throws {
        let name = "RoutingAppCoverage"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testRoutingAppCoverageCreateRequest() throws {
        let name = "RoutingAppCoverageCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testRoutingAppCoverageResponse() throws {
        let name = "RoutingAppCoverageResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testRoutingAppCoverageUpdateRequest() throws {
        let name = "RoutingAppCoverageUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testScreenshotDisplayType() throws {
        let name = "ScreenshotDisplayType"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testTerritoriesResponse() throws {
        let name = "TerritoriesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testTerritory() throws {
        let name = "Territory"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testTerritoryResponse() throws {
        let name = "TerritoryResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUploadOperation() throws {
        let name = "UploadOperation"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUploadOperationHeader() throws {
        let name = "UploadOperationHeader"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUser() throws {
        let name = "User"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserInvitation() throws {
        let name = "UserInvitation"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserInvitationCreateRequest() throws {
        let name = "UserInvitationCreateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserInvitationResponse() throws {
        let name = "UserInvitationResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserInvitationsResponse() throws {
        let name = "UserInvitationsResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserResponse() throws {
        let name = "UserResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserRole() throws {
        let name = "UserRole"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserUpdateRequest() throws {
        let name = "UserUpdateRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserVisibleAppsLinkagesRequest() throws {
        let name = "UserVisibleAppsLinkagesRequest"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUserVisibleAppsLinkagesResponse() throws {
        let name = "UserVisibleAppsLinkagesResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    func testUsersResponse() throws {
        let name = "UsersResponse"
        let renderedSchema = try renderSchema(named: name)
        let prerenderedSchema = try loadPrerenderedSchema(named: name)
        XCTAssertEqual(prerenderedSchema, renderedSchema)
    }
    
    static var allTests = [
        ("testAgeRatingDeclaration", testAgeRatingDeclaration),
        ("testAgeRatingDeclarationResponse", testAgeRatingDeclarationResponse),
        ("testAgeRatingDeclarationUpdateRequest", testAgeRatingDeclarationUpdateRequest),
        ("testApp", testApp),
        ("testAppBetaTestersLinkagesRequest", testAppBetaTestersLinkagesRequest),
        ("testAppCategoriesResponse", testAppCategoriesResponse),
        ("testAppCategory", testAppCategory),
        ("testAppCategoryResponse", testAppCategoryResponse),
        ("testAppEncryptionDeclaration", testAppEncryptionDeclaration),
        ("testAppEncryptionDeclarationBuildsLinkagesRequest", testAppEncryptionDeclarationBuildsLinkagesRequest),
        ("testAppEncryptionDeclarationResponse", testAppEncryptionDeclarationResponse),
        ("testAppEncryptionDeclarationState", testAppEncryptionDeclarationState),
        ("testAppEncryptionDeclarationsResponse", testAppEncryptionDeclarationsResponse),
        ("testAppInfo", testAppInfo),
        ("testAppInfoLocalization", testAppInfoLocalization),
        ("testAppInfoLocalizationCreateRequest", testAppInfoLocalizationCreateRequest),
        ("testAppInfoLocalizationResponse", testAppInfoLocalizationResponse),
        ("testAppInfoLocalizationUpdateRequest", testAppInfoLocalizationUpdateRequest),
        ("testAppInfoLocalizationsResponse", testAppInfoLocalizationsResponse),
        ("testAppInfoResponse", testAppInfoResponse),
        ("testAppInfoUpdateRequest", testAppInfoUpdateRequest),
        ("testAppInfosResponse", testAppInfosResponse),
        ("testAppMediaAssetState", testAppMediaAssetState),
        ("testAppMediaStateError", testAppMediaStateError),
        ("testAppPreOrder", testAppPreOrder),
        ("testAppPreOrderCreateRequest", testAppPreOrderCreateRequest),
        ("testAppPreOrderResponse", testAppPreOrderResponse),
        ("testAppPreOrderUpdateRequest", testAppPreOrderUpdateRequest),
        ("testAppPreview", testAppPreview),
        ("testAppPreviewCreateRequest", testAppPreviewCreateRequest),
        ("testAppPreviewResponse", testAppPreviewResponse),
        ("testAppPreviewSet", testAppPreviewSet),
        ("testAppPreviewSetAppPreviewsLinkagesRequest", testAppPreviewSetAppPreviewsLinkagesRequest),
        ("testAppPreviewSetAppPreviewsLinkagesResponse", testAppPreviewSetAppPreviewsLinkagesResponse),
        ("testAppPreviewSetCreateRequest", testAppPreviewSetCreateRequest),
        ("testAppPreviewSetResponse", testAppPreviewSetResponse),
        ("testAppPreviewSetsResponse", testAppPreviewSetsResponse),
        ("testAppPreviewUpdateRequest", testAppPreviewUpdateRequest),
        ("testAppPreviewsResponse", testAppPreviewsResponse),
        ("testAppPrice", testAppPrice),
        ("testAppPricePoint", testAppPricePoint),
        ("testAppPricePointResponse", testAppPricePointResponse),
        ("testAppPricePointsResponse", testAppPricePointsResponse),
        ("testAppPriceResponse", testAppPriceResponse),
        ("testAppPriceTier", testAppPriceTier),
        ("testAppPriceTierResponse", testAppPriceTierResponse),
        ("testAppPriceTiersResponse", testAppPriceTiersResponse),
        ("testAppPricesResponse", testAppPricesResponse),
        ("testAppResponse", testAppResponse),
        ("testAppScreenshot", testAppScreenshot),
        ("testAppScreenshotCreateRequest", testAppScreenshotCreateRequest),
        ("testAppScreenshotResponse", testAppScreenshotResponse),
        ("testAppScreenshotSet", testAppScreenshotSet),
        ("testAppScreenshotSetAppScreenshotsLinkagesRequest", testAppScreenshotSetAppScreenshotsLinkagesRequest),
        ("testAppScreenshotSetAppScreenshotsLinkagesResponse", testAppScreenshotSetAppScreenshotsLinkagesResponse),
        ("testAppScreenshotSetCreateRequest", testAppScreenshotSetCreateRequest),
        ("testAppScreenshotSetResponse", testAppScreenshotSetResponse),
        ("testAppScreenshotSetsResponse", testAppScreenshotSetsResponse),
        ("testAppScreenshotUpdateRequest", testAppScreenshotUpdateRequest),
        ("testAppScreenshotsResponse", testAppScreenshotsResponse),
        ("testAppStoreAgeRating", testAppStoreAgeRating),
        ("testAppStoreReviewAttachment", testAppStoreReviewAttachment),
        ("testAppStoreReviewAttachmentCreateRequest", testAppStoreReviewAttachmentCreateRequest),
        ("testAppStoreReviewAttachmentResponse", testAppStoreReviewAttachmentResponse),
        ("testAppStoreReviewAttachmentUpdateRequest", testAppStoreReviewAttachmentUpdateRequest),
        ("testAppStoreReviewAttachmentsResponse", testAppStoreReviewAttachmentsResponse),
        ("testAppStoreReviewDetail", testAppStoreReviewDetail),
        ("testAppStoreReviewDetailCreateRequest", testAppStoreReviewDetailCreateRequest),
        ("testAppStoreReviewDetailResponse", testAppStoreReviewDetailResponse),
        ("testAppStoreReviewDetailUpdateRequest", testAppStoreReviewDetailUpdateRequest),
        ("testAppStoreVersion", testAppStoreVersion),
        ("testAppStoreVersionBuildLinkageRequest", testAppStoreVersionBuildLinkageRequest),
        ("testAppStoreVersionBuildLinkageResponse", testAppStoreVersionBuildLinkageResponse),
        ("testAppStoreVersionCreateRequest", testAppStoreVersionCreateRequest),
        ("testAppStoreVersionLocalization", testAppStoreVersionLocalization),
        ("testAppStoreVersionLocalizationCreateRequest", testAppStoreVersionLocalizationCreateRequest),
        ("testAppStoreVersionLocalizationResponse", testAppStoreVersionLocalizationResponse),
        ("testAppStoreVersionLocalizationUpdateRequest", testAppStoreVersionLocalizationUpdateRequest),
        ("testAppStoreVersionLocalizationsResponse", testAppStoreVersionLocalizationsResponse),
        ("testAppStoreVersionPhasedRelease", testAppStoreVersionPhasedRelease),
        ("testAppStoreVersionPhasedReleaseCreateRequest", testAppStoreVersionPhasedReleaseCreateRequest),
        ("testAppStoreVersionPhasedReleaseResponse", testAppStoreVersionPhasedReleaseResponse),
        ("testAppStoreVersionPhasedReleaseUpdateRequest", testAppStoreVersionPhasedReleaseUpdateRequest),
        ("testAppStoreVersionResponse", testAppStoreVersionResponse),
        ("testAppStoreVersionState", testAppStoreVersionState),
        ("testAppStoreVersionSubmission", testAppStoreVersionSubmission),
        ("testAppStoreVersionSubmissionCreateRequest", testAppStoreVersionSubmissionCreateRequest),
        ("testAppStoreVersionSubmissionResponse", testAppStoreVersionSubmissionResponse),
        ("testAppStoreVersionUpdateRequest", testAppStoreVersionUpdateRequest),
        ("testAppStoreVersionsResponse", testAppStoreVersionsResponse),
        ("testAppUpdateRequest", testAppUpdateRequest),
        ("testAppsResponse", testAppsResponse),
        ("testBetaAppLocalization", testBetaAppLocalization),
        ("testBetaAppLocalizationCreateRequest", testBetaAppLocalizationCreateRequest),
        ("testBetaAppLocalizationResponse", testBetaAppLocalizationResponse),
        ("testBetaAppLocalizationUpdateRequest", testBetaAppLocalizationUpdateRequest),
        ("testBetaAppLocalizationsResponse", testBetaAppLocalizationsResponse),
        ("testBetaAppReviewDetail", testBetaAppReviewDetail),
        ("testBetaAppReviewDetailResponse", testBetaAppReviewDetailResponse),
        ("testBetaAppReviewDetailUpdateRequest", testBetaAppReviewDetailUpdateRequest),
        ("testBetaAppReviewDetailsResponse", testBetaAppReviewDetailsResponse),
        ("testBetaAppReviewSubmission", testBetaAppReviewSubmission),
        ("testBetaAppReviewSubmissionCreateRequest", testBetaAppReviewSubmissionCreateRequest),
        ("testBetaAppReviewSubmissionResponse", testBetaAppReviewSubmissionResponse),
        ("testBetaAppReviewSubmissionsResponse", testBetaAppReviewSubmissionsResponse),
        ("testBetaBuildLocalization", testBetaBuildLocalization),
        ("testBetaBuildLocalizationCreateRequest", testBetaBuildLocalizationCreateRequest),
        ("testBetaBuildLocalizationResponse", testBetaBuildLocalizationResponse),
        ("testBetaBuildLocalizationUpdateRequest", testBetaBuildLocalizationUpdateRequest),
        ("testBetaBuildLocalizationsResponse", testBetaBuildLocalizationsResponse),
        ("testBetaGroup", testBetaGroup),
        ("testBetaGroupBetaTestersLinkagesRequest", testBetaGroupBetaTestersLinkagesRequest),
        ("testBetaGroupBetaTestersLinkagesResponse", testBetaGroupBetaTestersLinkagesResponse),
        ("testBetaGroupBuildsLinkagesRequest", testBetaGroupBuildsLinkagesRequest),
        ("testBetaGroupBuildsLinkagesResponse", testBetaGroupBuildsLinkagesResponse),
        ("testBetaGroupCreateRequest", testBetaGroupCreateRequest),
        ("testBetaGroupResponse", testBetaGroupResponse),
        ("testBetaGroupUpdateRequest", testBetaGroupUpdateRequest),
        ("testBetaGroupsResponse", testBetaGroupsResponse),
        ("testBetaInviteType", testBetaInviteType),
        ("testBetaLicenseAgreement", testBetaLicenseAgreement),
        ("testBetaLicenseAgreementResponse", testBetaLicenseAgreementResponse),
        ("testBetaLicenseAgreementUpdateRequest", testBetaLicenseAgreementUpdateRequest),
        ("testBetaLicenseAgreementsResponse", testBetaLicenseAgreementsResponse),
        ("testBetaReviewState", testBetaReviewState),
        ("testBetaTester", testBetaTester),
        ("testBetaTesterAppsLinkagesRequest", testBetaTesterAppsLinkagesRequest),
        ("testBetaTesterAppsLinkagesResponse", testBetaTesterAppsLinkagesResponse),
        ("testBetaTesterBetaGroupsLinkagesRequest", testBetaTesterBetaGroupsLinkagesRequest),
        ("testBetaTesterBetaGroupsLinkagesResponse", testBetaTesterBetaGroupsLinkagesResponse),
        ("testBetaTesterBuildsLinkagesRequest", testBetaTesterBuildsLinkagesRequest),
        ("testBetaTesterBuildsLinkagesResponse", testBetaTesterBuildsLinkagesResponse),
        ("testBetaTesterCreateRequest", testBetaTesterCreateRequest),
        ("testBetaTesterInvitation", testBetaTesterInvitation),
        ("testBetaTesterInvitationCreateRequest", testBetaTesterInvitationCreateRequest),
        ("testBetaTesterInvitationResponse", testBetaTesterInvitationResponse),
        ("testBetaTesterResponse", testBetaTesterResponse),
        ("testBetaTestersResponse", testBetaTestersResponse),
        ("testBrazilAgeRating", testBrazilAgeRating),
        ("testBuild", testBuild),
        ("testBuildAppEncryptionDeclarationLinkageRequest", testBuildAppEncryptionDeclarationLinkageRequest),
        ("testBuildAppEncryptionDeclarationLinkageResponse", testBuildAppEncryptionDeclarationLinkageResponse),
        ("testBuildBetaDetail", testBuildBetaDetail),
        ("testBuildBetaDetailResponse", testBuildBetaDetailResponse),
        ("testBuildBetaDetailUpdateRequest", testBuildBetaDetailUpdateRequest),
        ("testBuildBetaDetailsResponse", testBuildBetaDetailsResponse),
        ("testBuildBetaGroupsLinkagesRequest", testBuildBetaGroupsLinkagesRequest),
        ("testBuildBetaNotification", testBuildBetaNotification),
        ("testBuildBetaNotificationCreateRequest", testBuildBetaNotificationCreateRequest),
        ("testBuildBetaNotificationResponse", testBuildBetaNotificationResponse),
        ("testBuildIcon", testBuildIcon),
        ("testBuildIconsResponse", testBuildIconsResponse),
        ("testBuildIndividualTestersLinkagesRequest", testBuildIndividualTestersLinkagesRequest),
        ("testBuildIndividualTestersLinkagesResponse", testBuildIndividualTestersLinkagesResponse),
        ("testBuildResponse", testBuildResponse),
        ("testBuildUpdateRequest", testBuildUpdateRequest),
        ("testBuildsResponse", testBuildsResponse),
        ("testBundleId", testBundleId),
        ("testBundleIdCapabilitiesResponse", testBundleIdCapabilitiesResponse),
        ("testBundleIdCapability", testBundleIdCapability),
        ("testBundleIdCapabilityCreateRequest", testBundleIdCapabilityCreateRequest),
        ("testBundleIdCapabilityResponse", testBundleIdCapabilityResponse),
        ("testBundleIdCapabilityUpdateRequest", testBundleIdCapabilityUpdateRequest),
        ("testBundleIdCreateRequest", testBundleIdCreateRequest),
        ("testBundleIdPlatform", testBundleIdPlatform),
        ("testBundleIdResponse", testBundleIdResponse),
        ("testBundleIdUpdateRequest", testBundleIdUpdateRequest),
        ("testBundleIdsResponse", testBundleIdsResponse),
        ("testCapabilityOption", testCapabilityOption),
        ("testCapabilitySetting", testCapabilitySetting),
        ("testCapabilityType", testCapabilityType),
        ("testCertificate", testCertificate),
        ("testCertificateCreateRequest", testCertificateCreateRequest),
        ("testCertificateResponse", testCertificateResponse),
        ("testCertificateType", testCertificateType),
        ("testCertificatesResponse", testCertificatesResponse),
        ("testDevice", testDevice),
        ("testDeviceCreateRequest", testDeviceCreateRequest),
        ("testDeviceResponse", testDeviceResponse),
        ("testDeviceUpdateRequest", testDeviceUpdateRequest),
        ("testDevicesResponse", testDevicesResponse),
        ("testDiagnosticLog", testDiagnosticLog),
        ("testDiagnosticLogsResponse", testDiagnosticLogsResponse),
        ("testDiagnosticSignature", testDiagnosticSignature),
        ("testDiagnosticSignaturesResponse", testDiagnosticSignaturesResponse),
        ("testDocumentLinks", testDocumentLinks),
        ("testEndUserLicenseAgreement", testEndUserLicenseAgreement),
        ("testEndUserLicenseAgreementCreateRequest", testEndUserLicenseAgreementCreateRequest),
        ("testEndUserLicenseAgreementResponse", testEndUserLicenseAgreementResponse),
        ("testEndUserLicenseAgreementUpdateRequest", testEndUserLicenseAgreementUpdateRequest),
        ("testErrorResponse", testErrorResponse),
        ("testExternalBetaState", testExternalBetaState),
        ("testGameCenterEnabledVersion", testGameCenterEnabledVersion),
        ("testGameCenterEnabledVersionCompatibleVersionsLinkagesRequest", testGameCenterEnabledVersionCompatibleVersionsLinkagesRequest),
        ("testGameCenterEnabledVersionCompatibleVersionsLinkagesResponse", testGameCenterEnabledVersionCompatibleVersionsLinkagesResponse),
        ("testGameCenterEnabledVersionsResponse", testGameCenterEnabledVersionsResponse),
        ("testIconAssetType", testIconAssetType),
        ("testIdfaDeclaration", testIdfaDeclaration),
        ("testIdfaDeclarationCreateRequest", testIdfaDeclarationCreateRequest),
        ("testIdfaDeclarationResponse", testIdfaDeclarationResponse),
        ("testIdfaDeclarationUpdateRequest", testIdfaDeclarationUpdateRequest),
        ("testImageAsset", testImageAsset),
        ("testInAppPurchase", testInAppPurchase),
        ("testInAppPurchaseResponse", testInAppPurchaseResponse),
        ("testInAppPurchasesResponse", testInAppPurchasesResponse),
        ("testInternalBetaState", testInternalBetaState),
        ("testKidsAgeBand", testKidsAgeBand),
        ("testPagedDocumentLinks", testPagedDocumentLinks),
        ("testPagingInformation", testPagingInformation),
        ("testPerfPowerMetric", testPerfPowerMetric),
        ("testPerfPowerMetricsResponse", testPerfPowerMetricsResponse),
        ("testPhasedReleaseState", testPhasedReleaseState),
        ("testPlatform", testPlatform),
        ("testPreReleaseVersionsResponse", testPreReleaseVersionsResponse),
        ("testPrereleaseVersion", testPrereleaseVersion),
        ("testPrereleaseVersionResponse", testPrereleaseVersionResponse),
        ("testPreviewType", testPreviewType),
        ("testProfile", testProfile),
        ("testProfileCreateRequest", testProfileCreateRequest),
        ("testProfileResponse", testProfileResponse),
        ("testProfilesResponse", testProfilesResponse),
        ("testResourceLinks", testResourceLinks),
        ("testRoutingAppCoverage", testRoutingAppCoverage),
        ("testRoutingAppCoverageCreateRequest", testRoutingAppCoverageCreateRequest),
        ("testRoutingAppCoverageResponse", testRoutingAppCoverageResponse),
        ("testRoutingAppCoverageUpdateRequest", testRoutingAppCoverageUpdateRequest),
        ("testScreenshotDisplayType", testScreenshotDisplayType),
        ("testTerritoriesResponse", testTerritoriesResponse),
        ("testTerritory", testTerritory),
        ("testTerritoryResponse", testTerritoryResponse),
        ("testUploadOperation", testUploadOperation),
        ("testUploadOperationHeader", testUploadOperationHeader),
        ("testUser", testUser),
        ("testUserInvitation", testUserInvitation),
        ("testUserInvitationCreateRequest", testUserInvitationCreateRequest),
        ("testUserInvitationResponse", testUserInvitationResponse),
        ("testUserInvitationsResponse", testUserInvitationsResponse),
        ("testUserResponse", testUserResponse),
        ("testUserRole", testUserRole),
        ("testUserUpdateRequest", testUserUpdateRequest),
        ("testUserVisibleAppsLinkagesRequest", testUserVisibleAppsLinkagesRequest),
        ("testUserVisibleAppsLinkagesResponse", testUserVisibleAppsLinkagesResponse),
        ("testUsersResponse", testUsersResponse),
    ]
}
