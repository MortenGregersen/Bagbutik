@testable import BagbutikDocsCollector
@testable import BagbutikSpecDecoder
import XCTest

class DocumentationTests: XCTestCase {
    let enumDocumentation = EnumDocumentation(id: "enum-id", title: "MyEnum", abstract: "An awesome enum", discussion: "I rest my case", cases: ["one": "First", "two": "Second"])
    let objectDocumentation = ObjectDocumentation(id: "object-id", title: "MyObject", abstract: "An awesome object", discussion: "Objection!", properties: ["name": .init(required: true, description: "An awesome name"), "type": .init(required: false, description: nil)], subDocumentationIds: ["other-object-id"])
    let operationDocumentation = OperationDocumentation(id: "operation-id", title: "MyOperation", abstract: "An awesome operation", discussion: "Make him better or get the buzzer!", pathParameters: ["id": "An unique identifier"], queryParameters: ["fields": "The fields to fetch"], body: "The updated properties", responses: [.init(status: 200, reason: "OK"), .init(status: 400, reason: "Bad Request", description: "Something is wrong")])

    func testId() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).id, enumDocumentation.id)
        XCTAssertEqual(Documentation.object(objectDocumentation).id, objectDocumentation.id)
        XCTAssertEqual(Documentation.operation(operationDocumentation).id, operationDocumentation.id)
    }
    
    func testTitle() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).title, enumDocumentation.title)
        XCTAssertEqual(Documentation.object(objectDocumentation).title, objectDocumentation.title)
        XCTAssertEqual(Documentation.operation(operationDocumentation).title, operationDocumentation.title)
    }
    
    func testAbstract() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).abstract, enumDocumentation.abstract)
        XCTAssertEqual(Documentation.object(objectDocumentation).abstract, objectDocumentation.abstract)
        XCTAssertEqual(Documentation.operation(operationDocumentation).abstract, operationDocumentation.abstract)
    }
    
    func testDiscussion() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).discussion, enumDocumentation.discussion)
        XCTAssertEqual(Documentation.object(objectDocumentation).discussion, objectDocumentation.discussion)
        XCTAssertEqual(Documentation.operation(operationDocumentation).discussion, operationDocumentation.discussion)
    }
    
    func testSubDocumentationIds() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).subDocumentationIds, [])
        XCTAssertEqual(Documentation.object(objectDocumentation).subDocumentationIds, objectDocumentation.subDocumentationIds)
        XCTAssertEqual(Documentation.operation(operationDocumentation).subDocumentationIds, [])
    }
}
