@testable import BagbutikSpecDecoder
import XCTest

final class OneOfOptionTests: XCTestCase {
    let jsonDecoder = JSONDecoder()

    func testDecodingSimple() throws {
        // Given
        let json = #"""
        [
            {
                "type" : "object",
                "title" : "SomeModel",
                "properties" : {
                    "name" : {
                        "type" : "string"
                    }
                }
            },
            {
                "$ref" : "#/components/schemas/AnotherModel"
            }
        ]
        """#
        // When
        let oneOfOptions = try jsonDecoder.decode([OneOfOption].self, from: json.data(using: .utf8)!)
        // Then
        guard case let .objectSchema(objectSchema) = oneOfOptions[0],
              case let .schemaRef(refName) = oneOfOptions[1]
        else { return XCTFail("") }
        XCTAssertEqual(oneOfOptions[0].schemaName, "SomeModel")
        XCTAssertEqual(objectSchema.name, "SomeModel")
        XCTAssertEqual(objectSchema.properties.count, 1)
        XCTAssertEqual(objectSchema.properties["name"]?.description, PropertyType.simple(.string).description)
        XCTAssertEqual(oneOfOptions[1].schemaName, "AnotherModel")
        XCTAssertEqual(refName, "AnotherModel")
    }
    
    func testDecodingUnknownOption() throws {
        // Given
        let json = #"""
        {
            "unknown" : "invalid",
        }
        """#
        // When
        var thrownError: DecodingError?
        XCTAssertThrowsError(try jsonDecoder.decode(OneOfOption.self, from: json.data(using: .utf8)!)) {
            thrownError = $0 as? DecodingError
        }
        // Then
        guard case let .dataCorrupted(context) = thrownError else { throw thrownError! }
        XCTAssertEqual(context.codingPath.last?.stringValue, "type")
        XCTAssertEqual(context.debugDescription, "OneOf option not known")
    }
    
    func testEquatable() {
        // Given
        let refOption1 = OneOfOption.schemaRef("SomeModel")
        let refOption2 = OneOfOption.schemaRef("AnotherModel")
        let schemaOption1 = OneOfOption.objectSchema(ObjectSchema(properties: ["name": .simple(.string)],
                                                                  name: "SomeModel"))
        let schemaOption2 = OneOfOption.objectSchema(ObjectSchema(properties: ["name": .simple(.string)],
                                                                  name: "AnotherModel"))
        // Then
        XCTAssertTrue(refOption1 == refOption1)
        XCTAssertTrue(refOption2 == refOption2)
        XCTAssertTrue(schemaOption1 == schemaOption1)
        XCTAssertTrue(schemaOption2 == schemaOption2)
        
        XCTAssertFalse(refOption1 == refOption2)
        XCTAssertFalse(refOption1 == schemaOption1)
        XCTAssertFalse(refOption1 == schemaOption2)
        
        XCTAssertFalse(refOption2 == refOption1)
        XCTAssertFalse(refOption2 == schemaOption1)
        XCTAssertFalse(refOption2 == schemaOption2)
        
        XCTAssertFalse(schemaOption1 == refOption1)
        XCTAssertFalse(schemaOption1 == refOption2)
        XCTAssertFalse(schemaOption1 == schemaOption2)
        
        XCTAssertFalse(schemaOption2 == refOption1)
        XCTAssertFalse(schemaOption2 == refOption2)
        XCTAssertFalse(schemaOption2 == schemaOption1)
    }
}
