@testable import Bagbutik_Core
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
        encoder.outputFormatting = .sortedKeys
        let testData = TestData(id: "42", name: "Bob")
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"id":"42","name":"Bob"}"#)
    }

    func testEncodingNull() throws {
        // Given
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
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

    func testCustomEncodingSome() throws {
        // Given
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let testData = SomeLinkageRequest(data: .init(id: "some-id"))
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"data":{"id":"some-id","type":"builds"}}"#)
    }

    func testCustomEncodingNone() throws {
        // Given
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let testData = SomeLinkageRequest(data: nil)
        // When
        let jsonData = try encoder.encode(testData)
        // Then
        XCTAssertEqual(String(data: jsonData, encoding: .utf8)!, #"{"data":null}"#)
    }
    
    func testCustomDecodingSome() throws {
        // Given
        let decoder = JSONDecoder()
        let jsonData = #"{"data":{"id":"some-id","type":"builds"}}"#.data(using: .utf8)!
        // When
        let linkageRequest = try decoder.decode(SomeLinkageRequest.self, from: jsonData)
        // Then
        XCTAssertEqual(linkageRequest, SomeLinkageRequest(data: .init(id: "some-id")))
    }
    
    func testCustomDecodingNone() throws {
        // Given
        let decoder = JSONDecoder()
        let jsonData = #"{"data":null}"#.data(using: .utf8)!
        // When
        let linkageRequest = try decoder.decode(SomeLinkageRequest.self, from: jsonData)
        // Then
        XCTAssertEqual(linkageRequest, SomeLinkageRequest(data: nil))
    }

    public struct SomeLinkageRequest: Codable, RequestBody, Equatable {
        @NullCodable public var data: Data?

        public init(data: Data? = nil) {
            self.data = data
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            data = try container.decodeIfPresent(Data.self, forKey: .data)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(data, forKey: .data)
        }

        private enum CodingKeys: String, CodingKey {
            case data
        }

        public struct Data: Codable, Identifiable, Equatable {
            public let id: String
            public var type: String { "builds" }

            public init(id: String) {
                self.id = id
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                id = try container.decode(String.self, forKey: .id)
                if try container.decode(String.self, forKey: .type) != type {
                    throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                try container.encode(type, forKey: .type)
            }

            private enum CodingKeys: String, CodingKey {
                case id
                case type
            }
        }
    }
}
