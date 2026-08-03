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
    
    func testDecodableCasesWithDash() throws {
        let jsonString = """
        {
            "Locale" : {
                "type" : "string",
                "enum" : [ "CS-CZ", "DA-DK" ]
            }
        }
        """
        let enumSchema = try JSONDecoder().decode([String: EnumSchema].self, from: jsonString.data(using: .utf8)!).values.first!
        XCTAssertEqual(enumSchema.cases, [
            EnumCase(id: "CS_CZ", value: "CS-CZ"),
            EnumCase(id: "DA_DK", value: "DA-DK")
        ])
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
