@testable import Bagbutik_Core
import Bagbutik_Models
import XCTest

final class NullCodableTests: XCTestCase {
    struct TestData: Codable, Equatable {
        @NullCodable var id: String?
        var name: String
    }

    struct DefaultTestData: Codable {
        var id: String?
    }

    func testEncodingDefault() throws {
        // Given
        let encoder = JSONEncoder()
        let testData = DefaultTestData(id: nil)
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{}"#)
    }

    func testEncodingNonNull() throws {
        // Given
        let encoder = JSONEncoder()
        let testData = TestData(id: "42", name: "Bob")
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"id":"42","name":"Bob"}"#)
    }

    func testEncodingNull() throws {
        // Given
        let encoder = JSONEncoder()
        let testData = TestData(id: nil, name: "Bob")
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"id":null,"name":"Bob"}"#)
    }

    func testDecodingNonNull() throws {
        // Given
        let decoder = JSONDecoder()
        let jsonData = #"{"id":"42","name":"Bob"}"#.data(using: .utf8)!
        // When
        let testData = try decoder.decode(TestData.self, from: jsonData)
        // Then
        XCTAssertEqual(testData, TestData(id: "42", name: "Bob"))
    }

    func testDecodingNull() throws {
        // Given
        let decoder = JSONDecoder()
        let jsonData = #"{"id":null,"name":"Bob"}"#.data(using: .utf8)!
        // When
        let testData = try decoder.decode(TestData.self, from: jsonData)
        // Then
        XCTAssertEqual(testData, TestData(id: nil, name: "Bob"))
    }

    func testDecodingNonExistant() throws {
        // Given
        let decoder = JSONDecoder()
        let jsonData = #"{"name":"Bob"}"#.data(using: .utf8)!
        // When
        let testData = try decoder.decode(TestData.self, from: jsonData)
        // Then
        XCTAssertEqual(testData, TestData(id: nil, name: "Bob"))
    }
}
