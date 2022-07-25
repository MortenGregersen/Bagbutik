import BagbutikSpecDecoder
import XCTest

final class EnumSchemaTests: XCTestCase {
    func testPlainInit() {
        let type = "type"
        let values = ["IOS", "MAC_OS"]
        let name = "name"
        let enumSchema = EnumSchema(name: name, type: type, caseValues: values)
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
                "enum" : [ "IOS", "MAC_OS", "TV_OS" ]
            }
        }
        """
        let enumSchema = try JSONDecoder().decode([String: EnumSchema].self, from: jsonString.data(using: .utf8)!).values.first!
        XCTAssertEqual(enumSchema.type, "string")
        XCTAssertEqual(enumSchema.cases, [
            EnumCase(id: "iOS", value: "IOS"),
            EnumCase(id: "macOS", value: "MAC_OS"),
            EnumCase(id: "tvOS", value: "TV_OS")
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
            EnumCase(id: "universal", value: "UNIVERSAL", documentation: "A string that represents iOS and macOS.")
        ])
        XCTAssertEqual(enumSchema.name, "BundleIdPlatform")
    }
    
    func testDecodableInitFB8977648_Fixed() throws {
        let jsonString = """
        {
            "BundleIdPlatform" : {
                "type" : "string",
                "enum" : [ "IOS", "MAC_OS", "UNIVERSAL" ]
            }
        }
        """
        let enumSchema = try JSONDecoder().decode([String: EnumSchema].self, from: jsonString.data(using: .utf8)!).values.first!
        XCTAssertEqual(enumSchema.type, "string")
        XCTAssertEqual(enumSchema.cases, [
            EnumCase(id: "iOS", value: "IOS"),
            EnumCase(id: "macOS", value: "MAC_OS"),
            EnumCase(id: "universal", value: "UNIVERSAL"),
        ])
        XCTAssertEqual(enumSchema.name, "BundleIdPlatform")
    }

    func testDecodablePropertyNamedType() throws {
        let jsonString = """
        {
            "phoneNumber" : {
                "type" : "object",
                "properties" : {
                    "type" : {
                        "type" : "string",
                        "enum" : [ "FAX", "LANDLINE", "MOBILE", "TOLLFREE" ]
                    }
                }
            }
        }
        """
        let objectSchema = try JSONDecoder().decode([String: ObjectSchema].self, from: jsonString.data(using: .utf8)!).values.first!
        guard case .enumSchema(let enumSchema) = objectSchema.properties["type"]!.type else { XCTFail("Wrong type"); return }
        XCTAssertEqual(enumSchema.name, "PhoneNumberType")
    }
    
    func testDecodablePropertyNamedType_Linux() throws {
        let jsonString = """
        {
            "phoneNumber" : {
                "properties" : {
                    "type" : {
                        "type" : "string",
                        "enum" : [ "FAX", "LANDLINE", "MOBILE", "TOLLFREE" ]
                    }
                }
            }
        }
        """
        let decodedDictionary = try JSONDecoder().decode([String: [String: [String: EnumSchema]]].self, from: jsonString.data(using: .utf8)!)
        let enumSchema = decodedDictionary["phoneNumber"]!["properties"]!["type"]!
        XCTAssertEqual(enumSchema.name, "PhoneNumberType")
    }
}
