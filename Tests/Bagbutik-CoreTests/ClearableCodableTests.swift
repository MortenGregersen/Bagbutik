@testable import Bagbutik_Core
import XCTest

final class ClearableCodableTests: XCTestCase {
    private struct TestData: Codable, Equatable {
        @ClearableCodable var id: Clearable<String>?
        var name: String
        
        func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(_id, forKey: .id)
            try container.encode(name, forKey: .name)
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
}
