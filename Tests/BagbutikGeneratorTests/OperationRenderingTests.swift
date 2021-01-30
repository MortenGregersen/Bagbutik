import BagbutikGenerator
import BagbutikSpecDecoder
import PathKit
import XCTest

final class OperationRenderingTests: XCTestCase {
    static var spec: Spec!
    
    override class func setUp() {
        super.setUp()
        let specUrl = Bundle.module.url(forResource: "app-store-connect-openapi-spec", withExtension: "json")!
        let specContents = try! String(contentsOf: specUrl)
        let specData = specContents.data(using: .utf8)!
        spec = try! JSONDecoder().decode(Spec.self, from: specData)
    }
    
    private func renderOperation(named name: String, inPath path: String) throws -> String {
        let path = Self.spec.paths[path]!
        let operation = path.operations.first { $0.name == name.lowercasedFirstLetter() }!
        return try OperationRenderer().render(operation: operation, in: path)
    }
    
    private var endpointsDirPath: PathKit.Path {
        let outputPath = "./Bagbutik"
        return PathKit.Path(outputPath) + PathKit.Path("Endpoints")
    }
    
    private func loadPrerenderedOperation(named name: String, mainType: String, isRelationship: Bool) throws -> String {
        let fileName = PathKit.Path("\(name).swift")
        var dirPath = endpointsDirPath + PathKit.Path(mainType)
        if isRelationship {
            dirPath = dirPath + PathKit.Path("Relationships")
        }
        let filePath = dirPath + fileName
        print(filePath)
        return try filePath.read()
    }
    
    func testFilesCount() throws {
        let renderedOperations = try endpointsDirPath.recursiveChildren()
            .filter { $0.extension == "swift" }
            .map { $0.lastComponentWithoutExtension }
            .sorted()
        let decodedOperations = Self.spec.paths.values
            .flatMap { $0.operations }
            .map { $0.name.capitalizingFirstLetter() }
            .sorted()
        XCTAssertEqual(renderedOperations.count, decodedOperations.count)
    }
    
    func testUpdateAgeRatingDeclaration() throws {
        let name = "UpdateAgeRatingDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/ageRatingDeclarations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AgeRatingDeclarations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppCategories() throws {
        let name = "ListAppCategories"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appCategories")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppCategories", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppCategory() throws {
        let name = "GetAppCategory"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appCategories/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppCategories", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetParentForAppCategory() throws {
        let name = "GetParentForAppCategory"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appCategories/{id}/parent")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppCategories", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListSubcategoriesForAppCategory() throws {
        let name = "ListSubcategoriesForAppCategory"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appCategories/{id}/subcategories")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppCategories", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppEncryptionDeclarations() throws {
        let name = "ListAppEncryptionDeclarations"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appEncryptionDeclarations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppEncryptionDeclarations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppEncryptionDeclaration() throws {
        let name = "GetAppEncryptionDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appEncryptionDeclarations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppEncryptionDeclarations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForAppEncryptionDeclaration() throws {
        let name = "GetAppForAppEncryptionDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appEncryptionDeclarations/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppEncryptionDeclarations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBuildsForAppEncryptionDeclaration() throws {
        let name = "CreateBuildsForAppEncryptionDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appEncryptionDeclarations/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppEncryptionDeclarations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppInfoLocalization() throws {
        let name = "CreateAppInfoLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfoLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfoLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppInfoLocalization() throws {
        let name = "GetAppInfoLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfoLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfoLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppInfoLocalization() throws {
        let name = "UpdateAppInfoLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfoLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfoLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppInfoLocalization() throws {
        let name = "DeleteAppInfoLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfoLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfoLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppInfo() throws {
        let name = "GetAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppInfo() throws {
        let name = "UpdateAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppInfoLocalizationsForAppInfo() throws {
        let name = "ListAppInfoLocalizationsForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/appInfoLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetPrimaryCategoryForAppInfo() throws {
        let name = "GetPrimaryCategoryForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/primaryCategory")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetPrimarySubcategoryOneForAppInfo() throws {
        let name = "GetPrimarySubcategoryOneForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/primarySubcategoryOne")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetPrimarySubcategoryTwoForAppInfo() throws {
        let name = "GetPrimarySubcategoryTwoForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/primarySubcategoryTwo")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetSecondaryCategoryForAppInfo() throws {
        let name = "GetSecondaryCategoryForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/secondaryCategory")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetSecondarySubcategoryOneForAppInfo() throws {
        let name = "GetSecondarySubcategoryOneForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/secondarySubcategoryOne")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetSecondarySubcategoryTwoForAppInfo() throws {
        let name = "GetSecondarySubcategoryTwoForAppInfo"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appInfos/{id}/secondarySubcategoryTwo")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppInfos", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppPreOrder() throws {
        let name = "CreateAppPreOrder"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreOrders")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreOrders", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppPreOrder() throws {
        let name = "GetAppPreOrder"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreOrders/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreOrders", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppPreOrder() throws {
        let name = "UpdateAppPreOrder"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreOrders/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreOrders", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppPreOrder() throws {
        let name = "DeleteAppPreOrder"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreOrders/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreOrders", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppPreviewSet() throws {
        let name = "CreateAppPreviewSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviewSets")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviewSets", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppPreviewSet() throws {
        let name = "GetAppPreviewSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviewSets/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviewSets", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppPreviewSet() throws {
        let name = "DeleteAppPreviewSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviewSets/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviewSets", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppPreviewsForAppPreviewSet() throws {
        let name = "ListAppPreviewsForAppPreviewSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviewSets/{id}/appPreviews")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviewSets", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppPreviewIdsForAppPreviewSet() throws {
        let name = "ListAppPreviewIdsForAppPreviewSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviewSets/{id}/relationships/appPreviews")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviewSets", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testReplaceAppPreviewsForAppPreviewSet() throws {
        let name = "ReplaceAppPreviewsForAppPreviewSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviewSets/{id}/relationships/appPreviews")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviewSets", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppPreview() throws {
        let name = "CreateAppPreview"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviews")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviews", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppPreview() throws {
        let name = "GetAppPreview"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviews/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviews", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppPreview() throws {
        let name = "UpdateAppPreview"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviews/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviews", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppPreview() throws {
        let name = "DeleteAppPreview"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPreviews/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPreviews", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppPricePoints() throws {
        let name = "ListAppPricePoints"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPricePoints")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPricePoints", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppPricePoint() throws {
        let name = "GetAppPricePoint"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPricePoints/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPricePoints", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetTerritoryForAppPricePoint() throws {
        let name = "GetTerritoryForAppPricePoint"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPricePoints/{id}/territory")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPricePoints", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppPriceTiers() throws {
        let name = "ListAppPriceTiers"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPriceTiers")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPriceTiers", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppPriceTier() throws {
        let name = "GetAppPriceTier"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPriceTiers/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPriceTiers", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListPricePointsForAppPriceTier() throws {
        let name = "ListPricePointsForAppPriceTier"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPriceTiers/{id}/pricePoints")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPriceTiers", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppPrice() throws {
        let name = "GetAppPrice"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appPrices/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppPrices", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppScreenshotSet() throws {
        let name = "CreateAppScreenshotSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshotSets")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshotSets", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppScreenshotSet() throws {
        let name = "GetAppScreenshotSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshotSets/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshotSets", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppScreenshotSet() throws {
        let name = "DeleteAppScreenshotSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshotSets/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshotSets", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppScreenshotsForAppScreenshotSet() throws {
        let name = "ListAppScreenshotsForAppScreenshotSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshotSets/{id}/appScreenshots")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshotSets", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppScreenshotIdsForAppScreenshotSet() throws {
        let name = "ListAppScreenshotIdsForAppScreenshotSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshotSets/{id}/relationships/appScreenshots")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshotSets", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testReplaceAppScreenshotsForAppScreenshotSet() throws {
        let name = "ReplaceAppScreenshotsForAppScreenshotSet"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshotSets/{id}/relationships/appScreenshots")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshotSets", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppScreenshot() throws {
        let name = "CreateAppScreenshot"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshots")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshots", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppScreenshot() throws {
        let name = "GetAppScreenshot"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshots/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshots", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppScreenshot() throws {
        let name = "UpdateAppScreenshot"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshots/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshots", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppScreenshot() throws {
        let name = "DeleteAppScreenshot"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appScreenshots/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppScreenshots", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppStoreReviewAttachment() throws {
        let name = "CreateAppStoreReviewAttachment"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewAttachments")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewAttachments", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreReviewAttachment() throws {
        let name = "GetAppStoreReviewAttachment"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewAttachments/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewAttachments", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppStoreReviewAttachment() throws {
        let name = "UpdateAppStoreReviewAttachment"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewAttachments/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewAttachments", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppStoreReviewAttachment() throws {
        let name = "DeleteAppStoreReviewAttachment"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewAttachments/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewAttachments", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppStoreReviewDetail() throws {
        let name = "CreateAppStoreReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewDetails")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreReviewDetail() throws {
        let name = "GetAppStoreReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewDetails/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppStoreReviewDetail() throws {
        let name = "UpdateAppStoreReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewDetails/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppStoreReviewAttachmentsForAppStoreReviewDetail() throws {
        let name = "ListAppStoreReviewAttachmentsForAppStoreReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreReviewDetails/{id}/appStoreReviewAttachments")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreReviewDetails", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppStoreVersionLocalization() throws {
        let name = "CreateAppStoreVersionLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreVersionLocalization() throws {
        let name = "GetAppStoreVersionLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppStoreVersionLocalization() throws {
        let name = "UpdateAppStoreVersionLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppStoreVersionLocalization() throws {
        let name = "DeleteAppStoreVersionLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppPreviewSetsForAppStoreVersionLocalization() throws {
        let name = "ListAppPreviewSetsForAppStoreVersionLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionLocalizations/{id}/appPreviewSets")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionLocalizations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppScreenshotSetsForAppStoreVersionLocalization() throws {
        let name = "ListAppScreenshotSetsForAppStoreVersionLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionLocalizations/{id}/appScreenshotSets")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionLocalizations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppStoreVersionPhasedRelease() throws {
        let name = "CreateAppStoreVersionPhasedRelease"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionPhasedReleases")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionPhasedReleases", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppStoreVersionPhasedRelease() throws {
        let name = "UpdateAppStoreVersionPhasedRelease"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionPhasedReleases/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionPhasedReleases", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppStoreVersionPhasedRelease() throws {
        let name = "DeleteAppStoreVersionPhasedRelease"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionPhasedReleases/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionPhasedReleases", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppStoreVersionSubmission() throws {
        let name = "CreateAppStoreVersionSubmission"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionSubmissions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionSubmissions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppStoreVersionSubmission() throws {
        let name = "DeleteAppStoreVersionSubmission"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersionSubmissions/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersionSubmissions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateAppStoreVersion() throws {
        let name = "CreateAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreVersion() throws {
        let name = "GetAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppStoreVersion() throws {
        let name = "UpdateAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppStoreVersion() throws {
        let name = "DeleteAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAgeRatingDeclarationForAppStoreVersion() throws {
        let name = "GetAgeRatingDeclarationForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/ageRatingDeclaration")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreReviewDetailForAppStoreVersion() throws {
        let name = "GetAppStoreReviewDetailForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/appStoreReviewDetail")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppStoreVersionLocalizationsForAppStoreVersion() throws {
        let name = "ListAppStoreVersionLocalizationsForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/appStoreVersionLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreVersionPhasedReleaseForAppStoreVersion() throws {
        let name = "GetAppStoreVersionPhasedReleaseForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/appStoreVersionPhasedRelease")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreVersionSubmissionForAppStoreVersion() throws {
        let name = "GetAppStoreVersionSubmissionForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/appStoreVersionSubmission")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildForAppStoreVersion() throws {
        let name = "GetBuildForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/build")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetIdfaDeclarationForAppStoreVersion() throws {
        let name = "GetIdfaDeclarationForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/idfaDeclaration")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildIdsForAppStoreVersion() throws {
        let name = "GetBuildIdsForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/relationships/build")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBuildForAppStoreVersion() throws {
        let name = "UpdateBuildForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/relationships/build")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetRoutingAppCoverageForAppStoreVersion() throws {
        let name = "GetRoutingAppCoverageForAppStoreVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/appStoreVersions/{id}/routingAppCoverage")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "AppStoreVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListApps() throws {
        let name = "ListApps"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetApp() throws {
        let name = "GetApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateApp() throws {
        let name = "UpdateApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppInfosForApp() throws {
        let name = "ListAppInfosForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/appInfos")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppStoreVersionsForApp() throws {
        let name = "ListAppStoreVersionsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/appStoreVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAvailableTerritoriesForApp() throws {
        let name = "ListAvailableTerritoriesForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/availableTerritories")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaAppLocalizationsForApp() throws {
        let name = "ListBetaAppLocalizationsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/betaAppLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaAppReviewDetailForApp() throws {
        let name = "GetBetaAppReviewDetailForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/betaAppReviewDetail")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaGroupsForApp() throws {
        let name = "ListBetaGroupsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaLicenseAgreementForApp() throws {
        let name = "GetBetaLicenseAgreementForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/betaLicenseAgreement")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildsForApp() throws {
        let name = "ListBuildsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetEndUserLicenseAgreementForApp() throws {
        let name = "GetEndUserLicenseAgreementForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/endUserLicenseAgreement")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListGameCenterEnabledVersionsForApp() throws {
        let name = "ListGameCenterEnabledVersionsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/gameCenterEnabledVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListInAppPurchasesForApp() throws {
        let name = "ListInAppPurchasesForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/inAppPurchases")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListPerfPowerMetricsForApp() throws {
        let name = "ListPerfPowerMetricsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/perfPowerMetrics")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetPreOrderForApp() throws {
        let name = "GetPreOrderForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/preOrder")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListPreReleaseVersionsForApp() throws {
        let name = "ListPreReleaseVersionsForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/preReleaseVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListPricesForApp() throws {
        let name = "ListPricesForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/prices")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaTestersForApp() throws {
        let name = "DeleteBetaTestersForApp"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/apps/{id}/relationships/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Apps", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaAppLocalizations() throws {
        let name = "ListBetaAppLocalizations"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaAppLocalization() throws {
        let name = "CreateBetaAppLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaAppLocalization() throws {
        let name = "GetBetaAppLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBetaAppLocalization() throws {
        let name = "UpdateBetaAppLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaAppLocalization() throws {
        let name = "DeleteBetaAppLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForBetaAppLocalization() throws {
        let name = "GetAppForBetaAppLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppLocalizations/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppLocalizations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaAppReviewDetails() throws {
        let name = "ListBetaAppReviewDetails"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewDetails")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaAppReviewDetail() throws {
        let name = "GetBetaAppReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewDetails/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBetaAppReviewDetail() throws {
        let name = "UpdateBetaAppReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewDetails/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForBetaAppReviewDetail() throws {
        let name = "GetAppForBetaAppReviewDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewDetails/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewDetails", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaAppReviewSubmissions() throws {
        let name = "ListBetaAppReviewSubmissions"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewSubmissions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewSubmissions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaAppReviewSubmission() throws {
        let name = "CreateBetaAppReviewSubmission"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewSubmissions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewSubmissions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaAppReviewSubmission() throws {
        let name = "GetBetaAppReviewSubmission"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewSubmissions/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewSubmissions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildForBetaAppReviewSubmission() throws {
        let name = "GetBuildForBetaAppReviewSubmission"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaAppReviewSubmissions/{id}/build")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaAppReviewSubmissions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaBuildLocalizations() throws {
        let name = "ListBetaBuildLocalizations"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaBuildLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaBuildLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaBuildLocalization() throws {
        let name = "CreateBetaBuildLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaBuildLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaBuildLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaBuildLocalization() throws {
        let name = "GetBetaBuildLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaBuildLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaBuildLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBetaBuildLocalization() throws {
        let name = "UpdateBetaBuildLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaBuildLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaBuildLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaBuildLocalization() throws {
        let name = "DeleteBetaBuildLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaBuildLocalizations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaBuildLocalizations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildForBetaBuildLocalization() throws {
        let name = "GetBuildForBetaBuildLocalization"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaBuildLocalizations/{id}/build")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaBuildLocalizations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaGroups() throws {
        let name = "ListBetaGroups"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaGroup() throws {
        let name = "CreateBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaGroup() throws {
        let name = "GetBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBetaGroup() throws {
        let name = "UpdateBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaGroup() throws {
        let name = "DeleteBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForBetaGroup() throws {
        let name = "GetAppForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaTestersForBetaGroup() throws {
        let name = "ListBetaTestersForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildsForBetaGroup() throws {
        let name = "ListBuildsForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaTesterIdsForBetaGroup() throws {
        let name = "ListBetaTesterIdsForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/relationships/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaTestersForBetaGroup() throws {
        let name = "CreateBetaTestersForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/relationships/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaTestersForBetaGroup() throws {
        let name = "DeleteBetaTestersForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/relationships/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildIdsForBetaGroup() throws {
        let name = "ListBuildIdsForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBuildsForBetaGroup() throws {
        let name = "CreateBuildsForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBuildsForBetaGroup() throws {
        let name = "DeleteBuildsForBetaGroup"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaGroups/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaGroups", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaLicenseAgreements() throws {
        let name = "ListBetaLicenseAgreements"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaLicenseAgreements")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaLicenseAgreement() throws {
        let name = "GetBetaLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaLicenseAgreements/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBetaLicenseAgreement() throws {
        let name = "UpdateBetaLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaLicenseAgreements/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForBetaLicenseAgreement() throws {
        let name = "GetAppForBetaLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaLicenseAgreements/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaLicenseAgreements", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaTesterInvitation() throws {
        let name = "CreateBetaTesterInvitation"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesterInvitations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesterInvitations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaTesters() throws {
        let name = "ListBetaTesters"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaTester() throws {
        let name = "CreateBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaTester() throws {
        let name = "GetBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaTester() throws {
        let name = "DeleteBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppsForBetaTester() throws {
        let name = "ListAppsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/apps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaGroupsForBetaTester() throws {
        let name = "ListBetaGroupsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildsForBetaTester() throws {
        let name = "ListBuildsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListAppIdsForBetaTester() throws {
        let name = "ListAppIdsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/apps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteAppsForBetaTester() throws {
        let name = "DeleteAppsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/apps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaGroupIdsForBetaTester() throws {
        let name = "ListBetaGroupIdsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaGroupsForBetaTester() throws {
        let name = "CreateBetaGroupsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaGroupsForBetaTester() throws {
        let name = "DeleteBetaGroupsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildIdsForBetaTester() throws {
        let name = "ListBuildIdsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBuildsForBetaTester() throws {
        let name = "CreateBuildsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBuildsForBetaTester() throws {
        let name = "DeleteBuildsForBetaTester"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/betaTesters/{id}/relationships/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BetaTesters", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildBetaDetails() throws {
        let name = "ListBuildBetaDetails"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/buildBetaDetails")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BuildBetaDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildBetaDetail() throws {
        let name = "GetBuildBetaDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/buildBetaDetails/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BuildBetaDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBuildBetaDetail() throws {
        let name = "UpdateBuildBetaDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/buildBetaDetails/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BuildBetaDetails", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildForBuildBetaDetail() throws {
        let name = "GetBuildForBuildBetaDetail"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/buildBetaDetails/{id}/build")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BuildBetaDetails", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBuildBetaNotification() throws {
        let name = "CreateBuildBetaNotification"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/buildBetaNotifications")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BuildBetaNotifications", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuilds() throws {
        let name = "ListBuilds"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuild() throws {
        let name = "GetBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBuild() throws {
        let name = "UpdateBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForBuild() throws {
        let name = "GetAppForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppEncryptionDeclarationForBuild() throws {
        let name = "GetAppEncryptionDeclarationForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/appEncryptionDeclaration")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppStoreVersionForBuild() throws {
        let name = "GetAppStoreVersionForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/appStoreVersion")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBetaAppReviewSubmissionForBuild() throws {
        let name = "GetBetaAppReviewSubmissionForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/betaAppReviewSubmission")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBetaBuildLocalizationsForBuild() throws {
        let name = "ListBetaBuildLocalizationsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/betaBuildLocalizations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBuildBetaDetailForBuild() throws {
        let name = "GetBuildBetaDetailForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/buildBetaDetail")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListDiagnosticSignaturesForBuild() throws {
        let name = "ListDiagnosticSignaturesForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/diagnosticSignatures")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListIconsForBuild() throws {
        let name = "ListIconsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/icons")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListIndividualTestersForBuild() throws {
        let name = "ListIndividualTestersForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/individualTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListPerfPowerMetricsForBuild() throws {
        let name = "ListPerfPowerMetricsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/perfPowerMetrics")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetPreReleaseVersionForBuild() throws {
        let name = "GetPreReleaseVersionForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/preReleaseVersion")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppEncryptionDeclarationIdsForBuild() throws {
        let name = "GetAppEncryptionDeclarationIdsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/appEncryptionDeclaration")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateAppEncryptionDeclarationForBuild() throws {
        let name = "UpdateAppEncryptionDeclarationForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/appEncryptionDeclaration")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBetaGroupsForBuild() throws {
        let name = "CreateBetaGroupsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBetaGroupsForBuild() throws {
        let name = "DeleteBetaGroupsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/betaGroups")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListIndividualTesterIdsForBuild() throws {
        let name = "ListIndividualTesterIdsForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/individualTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateIndividualTestersForBuild() throws {
        let name = "CreateIndividualTestersForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/individualTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteIndividualTestersForBuild() throws {
        let name = "DeleteIndividualTestersForBuild"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/builds/{id}/relationships/individualTesters")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Builds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBundleIdCapability() throws {
        let name = "CreateBundleIdCapability"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIdCapabilities")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIdCapabilities", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBundleIdCapability() throws {
        let name = "UpdateBundleIdCapability"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIdCapabilities/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIdCapabilities", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBundleIdCapability() throws {
        let name = "DeleteBundleIdCapability"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIdCapabilities/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIdCapabilities", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBundleIds() throws {
        let name = "ListBundleIds"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateBundleId() throws {
        let name = "CreateBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBundleId() throws {
        let name = "GetBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateBundleId() throws {
        let name = "UpdateBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteBundleId() throws {
        let name = "DeleteBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForBundleId() throws {
        let name = "GetAppForBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBundleIdCapabilitiesForBundleId() throws {
        let name = "ListBundleIdCapabilitiesForBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds/{id}/bundleIdCapabilities")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListProfilesForBundleId() throws {
        let name = "ListProfilesForBundleId"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/bundleIds/{id}/profiles")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "BundleIds", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListCertificates() throws {
        let name = "ListCertificates"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/certificates")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Certificates", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateCertificate() throws {
        let name = "CreateCertificate"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/certificates")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Certificates", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetCertificate() throws {
        let name = "GetCertificate"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/certificates/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Certificates", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteCertificate() throws {
        let name = "DeleteCertificate"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/certificates/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Certificates", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListDevices() throws {
        let name = "ListDevices"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/devices")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Devices", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateDevice() throws {
        let name = "CreateDevice"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/devices")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Devices", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetDevice() throws {
        let name = "GetDevice"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/devices/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Devices", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateDevice() throws {
        let name = "UpdateDevice"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/devices/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Devices", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListLogsForDiagnosticSignature() throws {
        let name = "ListLogsForDiagnosticSignature"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/diagnosticSignatures/{id}/logs")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "DiagnosticSignatures", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateEndUserLicenseAgreement() throws {
        let name = "CreateEndUserLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/endUserLicenseAgreements")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "EndUserLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetEndUserLicenseAgreement() throws {
        let name = "GetEndUserLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/endUserLicenseAgreements/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "EndUserLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateEndUserLicenseAgreement() throws {
        let name = "UpdateEndUserLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/endUserLicenseAgreements/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "EndUserLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteEndUserLicenseAgreement() throws {
        let name = "DeleteEndUserLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/endUserLicenseAgreements/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "EndUserLicenseAgreements", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListTerritoriesForEndUserLicenseAgreement() throws {
        let name = "ListTerritoriesForEndUserLicenseAgreement"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/endUserLicenseAgreements/{id}/territories")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "EndUserLicenseAgreements", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListFinanceReports() throws {
        let name = "ListFinanceReports"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/financeReports")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "FinanceReports", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListCompatibleVersionsForGameCenterEnabledVersion() throws {
        let name = "ListCompatibleVersionsForGameCenterEnabledVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/gameCenterEnabledVersions/{id}/compatibleVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "GameCenterEnabledVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListCompatibleVersionIdsForGameCenterEnabledVersion() throws {
        let name = "ListCompatibleVersionIdsForGameCenterEnabledVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/gameCenterEnabledVersions/{id}/relationships/compatibleVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "GameCenterEnabledVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testReplaceCompatibleVersionsForGameCenterEnabledVersion() throws {
        let name = "ReplaceCompatibleVersionsForGameCenterEnabledVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/gameCenterEnabledVersions/{id}/relationships/compatibleVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "GameCenterEnabledVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateCompatibleVersionsForGameCenterEnabledVersion() throws {
        let name = "CreateCompatibleVersionsForGameCenterEnabledVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/gameCenterEnabledVersions/{id}/relationships/compatibleVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "GameCenterEnabledVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteCompatibleVersionsForGameCenterEnabledVersion() throws {
        let name = "DeleteCompatibleVersionsForGameCenterEnabledVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/gameCenterEnabledVersions/{id}/relationships/compatibleVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "GameCenterEnabledVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateIdfaDeclaration() throws {
        let name = "CreateIdfaDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/idfaDeclarations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "IdfaDeclarations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateIdfaDeclaration() throws {
        let name = "UpdateIdfaDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/idfaDeclarations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "IdfaDeclarations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteIdfaDeclaration() throws {
        let name = "DeleteIdfaDeclaration"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/idfaDeclarations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "IdfaDeclarations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetInAppPurchase() throws {
        let name = "GetInAppPurchase"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/inAppPurchases/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "InAppPurchases", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListPreReleaseVersions() throws {
        let name = "ListPreReleaseVersions"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/preReleaseVersions")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "PreReleaseVersions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetPreReleaseVersion() throws {
        let name = "GetPreReleaseVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/preReleaseVersions/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "PreReleaseVersions", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetAppForPreReleaseVersion() throws {
        let name = "GetAppForPreReleaseVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/preReleaseVersions/{id}/app")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "PreReleaseVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListBuildsForPreReleaseVersion() throws {
        let name = "ListBuildsForPreReleaseVersion"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/preReleaseVersions/{id}/builds")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "PreReleaseVersions", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListProfiles() throws {
        let name = "ListProfiles"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateProfile() throws {
        let name = "CreateProfile"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetProfile() throws {
        let name = "GetProfile"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteProfile() throws {
        let name = "DeleteProfile"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetBundleIdForProfile() throws {
        let name = "GetBundleIdForProfile"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles/{id}/bundleId")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListCertificatesForProfile() throws {
        let name = "ListCertificatesForProfile"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles/{id}/certificates")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListDevicesForProfile() throws {
        let name = "ListDevicesForProfile"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/profiles/{id}/devices")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Profiles", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateRoutingAppCoverage() throws {
        let name = "CreateRoutingAppCoverage"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/routingAppCoverages")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "RoutingAppCoverages", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetRoutingAppCoverage() throws {
        let name = "GetRoutingAppCoverage"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/routingAppCoverages/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "RoutingAppCoverages", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateRoutingAppCoverage() throws {
        let name = "UpdateRoutingAppCoverage"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/routingAppCoverages/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "RoutingAppCoverages", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteRoutingAppCoverage() throws {
        let name = "DeleteRoutingAppCoverage"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/routingAppCoverages/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "RoutingAppCoverages", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListSalesReports() throws {
        let name = "ListSalesReports"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/salesReports")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "SalesReports", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListTerritories() throws {
        let name = "ListTerritories"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/territories")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Territories", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListUserInvitations() throws {
        let name = "ListUserInvitations"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/userInvitations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "UserInvitations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateUserInvitation() throws {
        let name = "CreateUserInvitation"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/userInvitations")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "UserInvitations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetUserInvitation() throws {
        let name = "GetUserInvitation"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/userInvitations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "UserInvitations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteUserInvitation() throws {
        let name = "DeleteUserInvitation"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/userInvitations/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "UserInvitations", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListVisibleAppsForUserInvitation() throws {
        let name = "ListVisibleAppsForUserInvitation"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/userInvitations/{id}/visibleApps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "UserInvitations", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListUsers() throws {
        let name = "ListUsers"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testGetUser() throws {
        let name = "GetUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testUpdateUser() throws {
        let name = "UpdateUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteUser() throws {
        let name = "DeleteUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: false)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListVisibleAppIdsForUser() throws {
        let name = "ListVisibleAppIdsForUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}/relationships/visibleApps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testReplaceVisibleAppsForUser() throws {
        let name = "ReplaceVisibleAppsForUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}/relationships/visibleApps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testCreateVisibleAppsForUser() throws {
        let name = "CreateVisibleAppsForUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}/relationships/visibleApps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testDeleteVisibleAppsForUser() throws {
        let name = "DeleteVisibleAppsForUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}/relationships/visibleApps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
    
    func testListVisibleAppsForUser() throws {
        let name = "ListVisibleAppsForUser"
        let renderedOperation = try renderOperation(named: name, inPath: "/v1/users/{id}/visibleApps")
        let prerenderedOperation = try loadPrerenderedOperation(named: name, mainType: "Users", isRelationship: true)
        XCTAssertEqual(prerenderedOperation, renderedOperation)
    }
}
