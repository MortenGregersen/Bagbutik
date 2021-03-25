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
}
