import BagbutikSpecDecoder
import XCTest

final class EnumSchemaTests: XCTestCase {
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
            "Platform" : {
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
        XCTAssertEqual(enumSchema.name, "Platform")
    }
    
    func testDecodableInitFB8977648() throws {
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
            EnumCase(id: "macOS", value: "MAC_OS"),
            EnumCase(id: "universal", value: "UNIVERSAL")
        ])
        XCTAssertEqual(enumSchema.name, "BundleIdPlatform")
    }
}
