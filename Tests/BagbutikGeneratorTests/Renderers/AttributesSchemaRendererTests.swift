@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class AttributesSchemaRendererTests: XCTestCase {
    func testRender() throws {
        // Given
        let renderer = AttributesSchemaRenderer()
        let schema = AttributesSchema(properties: ["name": .simple(.init(type: "string")),
                                                   "age": .simple(.init(type: "integer")),
                                                   "indentation": .enumSchema(.init(name: "Indentation",
                                                                                    type: "String",
                                                                                    values: ["TABS", "SPACES"])),
                                                   "darkMode": .enumSchema(.init(name: "DarkMode",
                                                                                 type: "String",
                                                                                 values: ["ON", "OFF"]))])
        // When
        let rendered = try renderer.render(attributesSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Attributes: Codable {
            public let age: Int?
            public let darkMode: DarkMode?
            public let indentation: Indentation?
            public let name: String?

            public init(age: Int? = nil, darkMode: DarkMode? = nil, indentation: Indentation? = nil, name: String? = nil) {
                self.age = age
                self.darkMode = darkMode
                self.indentation = indentation
                self.name = name
            }

            public enum DarkMode: String, Codable, CaseIterable {
                case on = "ON"
                case off = "OFF"
            }

            public enum Indentation: String, Codable, CaseIterable {
                case tabs = "TABS"
                case spaces = "SPACES"
            }
        }

        """#)
    }
}
