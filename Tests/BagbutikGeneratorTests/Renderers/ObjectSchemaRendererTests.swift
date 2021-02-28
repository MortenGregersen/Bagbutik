@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class ObjectSchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let schema = ObjectSchema(name: "Person", properties: ["name": .simple(.init(type: "string"))])
        // When
        let rendered = try renderer.render(objectSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable {
            public let name: String?

            public init(name: String? = nil) {
                self.name = name
            }
        }

        """#)
    }

    func testRenderRequest() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let schema = ObjectSchema(name: "PersonCreateRequest", properties: ["name": .simple(.init(type: "string"))])
        // When
        let rendered = try renderer.render(objectSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct PersonCreateRequest: Codable, RequestBody {
            public let name: String?

            public init(name: String? = nil) {
                self.name = name
            }
        }

        """#)
    }

    func testRenderSpecialPropertyTypes() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let schema = ObjectSchema(name: "Person",
                                  properties: ["firstName": .simple(.init(type: "string")),
                                               "lastName": .simple(.init(type: "string")),
                                               "self": .schemaRef("string"),
                                               "id": .constant("person")],
                                  requiredProperties: ["firstName"])
        // When
        let rendered = try renderer.render(objectSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable {
            public let firstName: String
            public var id: String { "person" }
            public let lastName: String?
            public let `self`: String?

            public init(firstName: String, id: Person? = nil, lastName: String? = nil, self aSelf: String? = nil) {
                self.firstName = firstName
                self.id = id
                self.lastName = lastName
                self.`self` = aSelf
            }
        }

        """#)
    }

    func testRenderWithAttributes() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let attributesSchema = AttributesSchema(properties: ["age": .simple(.init(type: "integer"))])
        let schema = ObjectSchema(name: "Person",
                                  properties: ["name": .simple(.init(type: "string"))],
                                  subSchemas: [.attributes(attributesSchema)])
        // When
        let rendered = try renderer.render(objectSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable {
            public let name: String?
            public let attributes: Attributes?

            public init(name: String? = nil, attributes: Attributes? = nil) {
                self.name = name
                self.attributes = attributes
            }

            public struct Attributes: Codable {
                public let age: Int?

                public init(age: Int? = nil) {
                    self.age = age
                }
            }
        }

        """#)
    }

    func testRenderWithRelationships() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let relationshipsSchema = ObjectSchema(name: "Relationships", properties: ["children": .arrayOfSchemaRef("Child")])
        let schema = ObjectSchema(name: "Person",
                                  properties: ["name": .simple(.init(type: "string"))],
                                  subSchemas: [.relationships(relationshipsSchema)])
        // When
        let rendered = try renderer.render(objectSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable {
            public let name: String?
            public let relationships: Relationships?

            public init(name: String? = nil, relationships: Relationships? = nil) {
                self.name = name
                self.relationships = relationships
            }

            public struct Relationships: Codable {
                public let children: [Child]?

                public init(children: [Child]? = nil) {
                    self.children = children
                }
            }
        }

        """#)
    }

    func testRenderSubSchemas() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let schema = ObjectSchema(name: "Person",
                                  properties: ["name": .simple(.init(type: "string")),
                                               "pet": .schemaRef("Pet"),
                                               "preference": .schemaRef("Preference"),
                                               "connection": .schemaRef("Connection")],
                                  subSchemas: [
                                      .objectSchema(.init(name: "Pet", properties: ["name": .simple(.init(type: "string"))])),
                                      .enumSchema(.init(type: "string", values: ["TABS", "SPACES"], name: "Preference")),
                                      .oneOf(name: "Connection", schema: OneOfSchema(options: [.schemaRef("Computer"), .schemaRef("Phone")])),
                                  ])
        // When
        let rendered = try renderer.render(objectSchema: schema, includesFixUps: ["computers", "phones"])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable {
            public let connection: Connection?
            public let name: String?
            public let pet: Pet?
            public let preference: Preference?

            public init(connection: Connection? = nil, name: String? = nil, pet: Pet? = nil, preference: Preference? = nil) {
                self.connection = connection
                self.name = name
                self.pet = pet
                self.preference = preference
            }

            public enum Connection: Codable {
                case computers(Computer)
                case phones(Phone)

                public init(from decoder: Decoder) throws {
                    if let computers = try? Computer(from: decoder) {
                        self = .computers(computers)
                    } else if let phones = try? Phone(from: decoder) {
                        self = .phones(phones)
                    } else {
                        throw DecodingError.typeMismatch(Connection.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                                debugDescription: "Unknown Connection"))
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    switch self {
                    case let .computers(value):
                        try value.encode(to: encoder)
                    case let .phones(value):
                        try value.encode(to: encoder)
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case type
                }

                private enum TypeKeys: String, Codable {
                    case computers
                    case phones
                }
            }

            public struct Pet: Codable {
                public let name: String?

                public init(name: String? = nil) {
                    self.name = name
                }
            }

            public enum Preference: String, Codable, CaseIterable {
                case tabs = "TABS"
                case spaces = "SPACES"
            }
        }

        """#)
    }

    func testRenderCustomCoding() throws {
        // Given
        let renderer = ObjectSchemaRenderer()
        let attributesSchema = AttributesSchema(properties: ["age": .simple(.init(type: "integer"))])
        let relationshipsSchema = ObjectSchema(name: "Relationships", properties: ["children": .arrayOfSchemaRef("Child")])
        let schema = ObjectSchema(name: "Person",
                                  properties: ["name": .simple(.init(type: "string")),
                                               "age": .simple(.init(type: "integer")),
                                               "type": .constant("person")],
                                  requiredProperties: ["name", "attributes"],
                                  subSchemas: [.attributes(attributesSchema),
                                               .relationships(relationshipsSchema)])
        // When
        let rendered = try renderer.render(objectSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable {
            public let age: Int?
            public let name: String
            public var type: String { "person" }
            public let attributes: Attributes
            public let relationships: Relationships?

            public init(age: Int? = nil, name: String, attributes: Attributes, relationships: Relationships? = nil) {
                self.age = age
                self.name = name
                self.attributes = attributes
                self.relationships = relationships
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                age = try container.decodeIfPresent(Int.self, forKey: .age)
                name = try container.decode(String.self, forKey: .name)
                attributes = try container.decode(Attributes.self, forKey: .attributes)
                relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
                if try container.decode(String.self, forKey: .type) != type {
                    throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(age, forKey: .age)
                try container.encode(name, forKey: .name)
                try container.encode(attributes, forKey: .attributes)
                try container.encodeIfPresent(relationships, forKey: .relationships)
            }

            private enum CodingKeys: String, CodingKey {
                case age
                case name
                case type
                case attributes
                case relationships
            }

            public struct Attributes: Codable {
                public let age: Int?

                public init(age: Int? = nil) {
                    self.age = age
                }
            }

            public struct Relationships: Codable {
                public let children: [Child]?

                public init(children: [Child]? = nil) {
                    self.children = children
                }
            }
        }

        """#)
    }
}
