@testable import Bagbutik_Core
import XCTest

final class ClearableCodableTests: XCTestCase {
    private struct TestData: Codable, Equatable {
        @ClearableCodable var id: Clearable<String>?
        var name: String
        
        init(id: Clearable<String>?, name: String) {
            self.id = id
            self.name = name
        }
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            _id = try container.decode(ClearableCodable<String>.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
        }
        
        func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(_id, forKey: .id)
            try container.encode(name, forKey: .name)
        }

        enum CodingKeys: CodingKey {
            case id
            case name
        }
    }
    
    func testEncodingValue() throws {
        // Given
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let testData = TestData(id: .value("42"), name: "Bob")
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"id":"42","name":"Bob"}"#)
    }

    func testEncodingClear() throws {
        // Given
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let testData = TestData(id: .clear, name: "Bob")
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"id":null,"name":"Bob"}"#)
    }
    
    func testEncodingNull() throws {
        // Given
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let testData = TestData(id: nil, name: "Bob")
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"name":"Bob"}"#)
    }
    
    func testDecoding() throws {
        // Given
        let decoder = JSONDecoder()
        let json = #"{"id":"42","name":"Bob"}"#
        // When
        let object = try decoder.decode(TestData.self, from: json.data(using: .utf8)!)
        // Then
        XCTAssertEqual(object.id, .value("42"))
        XCTAssertEqual(object.name, "Bob")
    }
}
