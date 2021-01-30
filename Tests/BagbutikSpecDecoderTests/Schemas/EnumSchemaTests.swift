import BagbutikSpecDecoder
import XCTest

class EnumSchemaTests: XCTestCase {
    func testPlainInit() {
        let type = "type"
        let values = ["IOS", "MAC_OS"]
        let name = "name"
        let enumSchema = EnumSchema(type: type, values: values, name: name)
        XCTAssertEqual(enumSchema.type, type)
        XCTAssertEqual(enumSchema.cases, [
            EnumCase(id: "iOS", value: "IOS"),
            EnumCase(id: "macOS", value: "MAC_OS")
        ])
        XCTAssertEqual(enumSchema.name, name)
    }
    
    func testDecodableInit() throws {
        let jsonString = """
        {
            "BundleIdPlatform" : {
                "type" : "string",
                "enum" : [ "IOS", "MAC_OS" ]
            }
        }
        """
        let enumSchema = try JSONDecoder().decode([String: EnumSchema].self, from: jsonString.data(using: .utf8)!).values.first!
        XCTAssertEqual(enumSchema.type, "string")
        XCTAssertEqual(enumSchema.cases, [
            EnumCase(id: "iOS", value: "IOS"),
            EnumCase(id: "macOS", value: "MAC_OS")
        ])
        XCTAssertEqual(enumSchema.name, "BundleIdPlatform")
    }
}

extension EnumCase: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id &&
            lhs.value == rhs.value
    }
}
