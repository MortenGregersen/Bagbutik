@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class ObjectSchemaRendererTests: XCTestCase {
    func testRenderPlain() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["/person": .object(
            .init(id: "/person", title: "Person", abstract: nil, discussion: nil, properties: [:], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: ["name": .init(type: .simple(.init(type: "string")))])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Person: Codable, Sendable {
            public var name: String?

            public init(name: String? = nil) {
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                name = try container.decodeIfPresent(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(name, forKey: "name")
            }
        }
        """#)
    }

    func testRenderPlainDocumented() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: "What is a person?", properties: ["name": .init(required: false, description: "The person's name")], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: ["name": .init(type: .simple(.init(type: "string")))])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         What is a person?

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable {
            /// The person's name
            public var name: String?

            public init(name: String? = nil) {
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                name = try container.decodeIfPresent(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(name, forKey: "name")
            }
        }
        """#)
    }

    func testRenderPlainDocumentedDeprecated() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: nil, properties: [
                "age": .init(required: false, description: "The person's age"),
                "name": .init(required: false, description: "The person's name")
            ], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: ["name": .init(type: .simple(.string()), deprecated: true),
                                               "age": .init(type: .simple(.integer()), deprecated: false)])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable {
            /// The person's age
            public var age: Int?
            /// The person's name
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var name: String? = nil

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(age: Int? = nil,
                        name: String? = nil)
            {
                self.age = age
                self.name = name
            }

            public init(age: Int? = nil) {
                self.age = age
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                age = try container.decodeIfPresent(Int.self, forKey: "age")
                name = try container.decodeIfPresent(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(age, forKey: "age")
                try container.encodeIfPresent(name, forKey: "name")
            }
        }
        """#)
    }

    func testRenderRequest() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/personcreaterequest", title: "PersonCreateRequest", abstract: "The data for a request to create a person.", discussion: nil, properties: [
                "name": .init(required: false, description: "The person's name")
            ], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "PersonCreateRequest",
                                  url: "some://url",
                                  properties: ["name": .init(type: .simple(.string())),
                                               "age": .init(type: .simple(.integer()), clearable: true)])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # PersonCreateRequest
         The data for a request to create a person.

         Full documentation:
         <some://url>
         */
        public struct PersonCreateRequest: Codable, Sendable, RequestBody {
            public var age: Clearable<Int>?
            /// The person's name
            public var name: String?

            public init(age: Clearable<Int>? = nil,
                        name: String? = nil)
            {
                self.age = age
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                age = try container.decodeIfPresent(Clearable<Int>.self, forKey: "age")
                name = try container.decodeIfPresent(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(age, forKey: "age")
                try container.encodeIfPresent(name, forKey: "name")
            }
        }
        """#)
    }

    func testRenderLinkagesRequest() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/personcarLinkagerequest", title: "PersonCarLinkageRequest", abstract: "The request body you use to attach a car to a Person.", discussion: nil, properties: [
                "data": .init(required: true, description: "")
            ], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "PersonCarLinkageRequest",
                                  url: "some://url",
                                  properties: ["data": .init(type: .schema(.init(
                                      name: "Data",
                                      url: "some://url",
                                      properties: ["id": .init(type: .simple(.string())),
                                                   "type": .init(type: .constant("cars"))],
                                      requiredProperties: ["id"]
                                  )))])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # PersonCarLinkageRequest
         The request body you use to attach a car to a Person.

         Full documentation:
         <some://url>
         */
        public struct PersonCarLinkageRequest: Codable, Sendable, RequestBody {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            /**
             # PersonCarLinkageRequest
             The request body you use to attach a car to a Person.

             Full documentation:
             <some://url>
             */
            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "cars" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
        """#)
    }

    func testRenderSpecialPropertyTypes() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: nil, properties: [
                "id": .init(required: true, description: "The unique id for the person"),
                "firstName": .init(required: true, description: "The firstname of the person"),
                "lastName": .init(required: false, description: ""),
                "self": .init(required: false, description: "A reference to the person")
            ], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: ["firstName": .init(type: .simple(.init(type: "string"))),
                                               "lastName": .init(type: .simple(.init(type: "string"))),
                                               "self": .init(type: .simple(.init(type: "string"))),
                                               "id": .init(type: .constant("person")),
                                               "days": .init(type: .arrayOfEnumSchema(.init(name: "Days", type: "string", caseValues: ["MONDAY", "TUESDAY"])))],
                                  requiredProperties: ["firstName"])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable, Identifiable {
            public var days: [Days]?
            /// The firstname of the person
            public let firstName: String
            /// The unique id for the person
            public var id: String { "person" }
            public var lastName: String?
            /// A reference to the person
            public var itself: String?

            public init(days: [Days]? = nil,
                        firstName: String,
                        lastName: String? = nil,
                        self itself: String? = nil)
            {
                self.days = days
                self.firstName = firstName
                self.lastName = lastName
                self.itself = itself
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                days = try container.decodeIfPresent([Days].self, forKey: "days")
                firstName = try container.decode(String.self, forKey: "firstName")
                id = try container.decodeIfPresent(String.self, forKey: "id")
                lastName = try container.decodeIfPresent(String.self, forKey: "lastName")
                itself = try container.decodeIfPresent(String.self, forKey: "self")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(days, forKey: "days")
                try container.encode(firstName, forKey: "firstName")
                try container.encodeIfPresent(id, forKey: "id")
                try container.encodeIfPresent(lastName, forKey: "lastName")
                try container.encodeIfPresent(itself, forKey: "self")
            }

            public enum Days: String, Sendable, Codable, CaseIterable {
                case monday = "MONDAY"
                case tuesday = "TUESDAY"
            }
        }
        """#)
    }

    func testRenderWithAttributes() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: nil, properties: [
                "attributes": .init(required: true, description: "The resource's attributes."),
            ], subDocumentationIds: []))]
        )
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let attributesSchema = ObjectSchema(name: "Attributes",
                                            url: "some://url/attributes",
                                            properties: ["age": .init(type: .simple(.init(type: "integer")))])
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: [
                                      "name": .init(type: .simple(.init(type: "string"))),
                                      "attributes": .init(type: .schema(attributesSchema))
                                  ])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable {
            public var name: String?
            /// The resource's attributes.
            public var attributes: Attributes?

            public init(name: String? = nil,
                        attributes: Attributes? = nil)
            {
                self.name = name
                self.attributes = attributes
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                name = try container.decodeIfPresent(String.self, forKey: "name")
                attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(attributes, forKey: "attributes")
            }

            public struct Attributes: Codable, Sendable {
                public var age: Int?

                public init(age: Int? = nil) {
                    self.age = age
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    age = try container.decodeIfPresent(Int.self, forKey: "age")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(age, forKey: "age")
                }
            }
        }
        """#)
    }

    func testRenderWithRelationships() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: nil, properties: [
                    "relationships": .init(required: true, description: "The resource's relationships."),
                ], subDocumentationIds: [])),
            "some://url/relationships": .object(
                .init(id: "/person/relationships", title: "Relationships", abstract: "The relationships you included in the request and those on which you can operate.", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let relationshipsSchema = ObjectSchema(name: "Relationships",
                                               url: "some://url/relationships",
                                               properties: ["children": .init(type: .arrayOfSchemaRef("Child"))])
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: [
                                      "name": .init(type: .simple(.init(type: "string"))),
                                      "relationships": .init(type: .schema(relationshipsSchema))
                                  ])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable {
            public var name: String?
            /// The resource's relationships.
            public var relationships: Relationships?

            public init(name: String? = nil,
                        relationships: Relationships? = nil)
            {
                self.name = name
                self.relationships = relationships
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                name = try container.decodeIfPresent(String.self, forKey: "name")
                relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(relationships, forKey: "relationships")
            }

            /**
             # Relationships
             The relationships you included in the request and those on which you can operate.

             Full documentation:
             <some://url/relationships>
             */
            public struct Relationships: Codable, Sendable {
                public var children: [Child]?

                public init(children: [Child]? = nil) {
                    self.children = children
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    children = try container.decodeIfPresent([Child].self, forKey: "children")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(children, forKey: "children")
                }
            }
        }
        """#)
    }

    func testRenderSubSchemas() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: nil, properties: [
                    "name": .init(required: false, description: "The person's name"),
                    "pet": .init(required: false, description: "The person's pet"),
                    "preference": .init(required: false, description: "The person's indentation preference"),
                    "connection": .init(required: false, description: "The person's connection")
                ], subDocumentationIds: []))
        ])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: ["name": .init(type: .simple(.init(type: "string"))),
                                               "pet": .init(type: .schema(.init(name: "Pet", url: "some://url/pet", properties: ["name": .init(type: .simple(.init(type: "string")))]))),
                                               "preference": .init(type: .enumSchema(.init(name: "Preference", type: "string", caseValues: ["TABS", "SPACES"]))),
                                               "connection": .init(type: .oneOf(name: "Connection", schema: OneOfSchema(options: [.schemaRef("Computer"), .schemaRef("Phone")])))])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable {
            /// The person's connection
            public var connection: Connection?
            /// The person's name
            public var name: String?
            /// The person's pet
            public var pet: Pet?
            /// The person's indentation preference
            public var preference: Preference?

            public init(connection: Connection? = nil,
                        name: String? = nil,
                        pet: Pet? = nil,
                        preference: Preference? = nil)
            {
                self.connection = connection
                self.name = name
                self.pet = pet
                self.preference = preference
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                connection = try container.decodeIfPresent(Connection.self, forKey: "connection")
                name = try container.decodeIfPresent(String.self, forKey: "name")
                pet = try container.decodeIfPresent(Pet.self, forKey: "pet")
                preference = try container.decodeIfPresent(Preference.self, forKey: "preference")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(connection, forKey: "connection")
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(pet, forKey: "pet")
                try container.encodeIfPresent(preference, forKey: "preference")
            }

            public enum Connection: Codable, Sendable {
                case computer(Computer)
                case phone(Phone)

                public init(from decoder: Decoder) throws {
                    if let computer = try? Computer(from: decoder) {
                        self = .computer(computer)
                    } else if let phone = try? Phone(from: decoder) {
                        self = .phone(phone)
                    } else {
                        throw DecodingError.typeMismatch(
                            Connection.self,
                            DecodingError.Context(
                                codingPath: decoder.codingPath,
                                debugDescription: "Unknown Connection"))
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    switch self {
                    case let .computer(value):
                        try value.encode(to: encoder)
                    case let .phone(value):
                        try value.encode(to: encoder)
                    }
                }
            }

            public struct Pet: Codable, Sendable {
                public var name: String?

                public init(name: String? = nil) {
                    self.name = name
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    name = try container.decodeIfPresent(String.self, forKey: "name")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(name, forKey: "name")
                }
            }

            public enum Preference: String, Sendable, Codable, CaseIterable {
                case spaces = "SPACES"
                case tabs = "TABS"
            }
        }
        """#)
    }

    func testPagedResponse() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "PersonsResponse",
                                  url: "some://url",
                                  properties: ["data": .init(type: .arrayOfSchemaRef("Person")),
                                               "links": .init(type: .schemaRef("PagedDocumentLinks"))],
                                  requiredProperties: ["data", "links"])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct PersonsResponse: Codable, Sendable, PagedResponse {
            public typealias Data = Person

            public let data: [Person]
            public let links: PagedDocumentLinks

            public init(data: [Person],
                        links: PagedDocumentLinks)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decode([Person].self, forKey: "data")
                links = try container.decode(PagedDocumentLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encode(links, forKey: "links")
            }
        }
        """#)
    }

    func testGetterForIncludedNonPagedResponse() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(
            name: "BuildResponse",
            url: "some://url",
            properties: [
                "data": .init(type: .schemaRef("Build")),
                "included": .init(type: .arrayOfOneOf(
                    name: "Included",
                    schema: .init(options: [.schemaRef("PrereleaseVersion"),
                                            .schemaRef("BetaTester"),
                                            .objectSchema(.init(name: "App", url: "some://included-url"))])
                ))
            ]
        )
        let buildSchema = ObjectSchema(
            name: "Build",
            url: "some://url",
            properties: ["relationships": .init(type: .schema(.init(
                name: "Relationships",
                url: "some://url",
                properties: [
                    "individualTesters": .init(type: .schema(.init(
                        name: "IndividualTesters",
                        url: "some://url",
                        properties: [
                            "data": .init(type: .arrayOfSubSchema(.init(
                                name: "Data",
                                url: "some://url",
                                properties: [
                                    "id": .init(type: .simple(.string())),
                                    "type": .init(type: .constant("betaTesters"))
                                ]
                            )))
                        ],
                        requiredProperties: ["id", "type"]
                    ))),
                    "preReleaseVersion": .init(type: .schema(.init(
                        name: "PreReleaseVersion",
                        url: "some://url",
                        properties: [
                            "data": .init(type: .schema(.init(
                                name: "Data",
                                url: "some://url",
                                properties: [
                                    "id": .init(type: .simple(.string())),
                                    "type": .init(type: .constant("preReleaseVersions"))
                                ]
                            )))
                        ],
                        requiredProperties: ["id", "type"]
                    )))
                ]
            )))]
        )
        let prereleaseVersionSchema = ObjectSchema(
            name: "PrereleaseVersion",
            url: "some://url",
            properties: ["type": .init(type: .constant("preReleaseVersions"))]
        )
        let betaTesterSchema = ObjectSchema(
            name: "BetaTester",
            url: "some://url",
            properties: ["type": .init(type: .constant("betaTesters"))]
        )
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [
            "Build": .object(buildSchema),
            "BetaTester": .object(betaTesterSchema),
            "PrereleaseVersion": .object(prereleaseVersionSchema)
        ])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct BuildResponse: Codable, Sendable {
            public var data: Build?
            public var included: [Included]?

            public init(data: Build? = nil,
                        included: [Included]? = nil)
            {
                self.data = data
                self.included = included
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Build.self, forKey: "data")
                included = try container.decodeIfPresent([Included].self, forKey: "included")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(data, forKey: "data")
                try container.encodeIfPresent(included, forKey: "included")
            }

            public func getIndividualTesters() -> [BetaTester] {
                guard let individualTesterIds = data.relationships?.individualTesters?.data?.map(\.id),
                      let individualTesters = included?.compactMap({ relationship -> BetaTester? in
                          guard case let .betaTester(individualTester) = relationship else { return nil }
                          return individualTesterIds.contains(individualTester.id) ? individualTester : nil
                      })
                else {
                    return []
                }
                return individualTesters
            }

            public func getPreReleaseVersion() -> PrereleaseVersion? {
                included?.compactMap { relationship -> PrereleaseVersion? in
                    guard case let .prereleaseVersion(preReleaseVersion) = relationship else { return nil }
                    return preReleaseVersion
                }.first { $0.id == data.relationships?.preReleaseVersion?.data?.id }
            }

            public enum Included: Codable, Sendable {
                case app(App)
                case betaTester(BetaTester)
                case prereleaseVersion(PrereleaseVersion)

                public init(from decoder: Decoder) throws {
                    if let app = try? App(from: decoder) {
                        self = .app(app)
                    } else if let betaTester = try? BetaTester(from: decoder) {
                        self = .betaTester(betaTester)
                    } else if let prereleaseVersion = try? PrereleaseVersion(from: decoder) {
                        self = .prereleaseVersion(prereleaseVersion)
                    } else {
                        throw DecodingError.typeMismatch(
                            Included.self,
                            DecodingError.Context(
                                codingPath: decoder.codingPath,
                                debugDescription: "Unknown Included"))
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    switch self {
                    case let .app(value):
                        try value.encode(to: encoder)
                    case let .betaTester(value):
                        try value.encode(to: encoder)
                    case let .prereleaseVersion(value):
                        try value.encode(to: encoder)
                    }
                }

                public struct App: Codable, Sendable {
                    public init() {}

                    public init(from decoder: Decoder) throws {}

                    public func encode(to encoder: Encoder) throws {}
                }
            }
        }
        """#)
    }

    func testGetterForIncludedPagedResponse() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(
            name: "BuildsResponse",
            url: "some://url",
            properties: [
                "data": .init(type: .arrayOfSchemaRef("Build")),
                "included": .init(type: .arrayOfOneOf(
                    name: "Included",
                    schema: .init(options: [.schemaRef("SomethingOld"),
                                            .schemaRef("PrereleaseVersion"),
                                            .schemaRef("BetaTester")])
                ))
            ]
        )
        let buildSchema = ObjectSchema(
            name: "Build",
            url: "some://url",
            properties: ["relationships": .init(type: .schema(.init(
                name: "Relationships",
                url: "some://url",
                properties: [
                    "somethingOld": .init(type: .schema(.init(
                        name: "SomethingOld",
                        url: "some://url",
                        properties: [
                            "data": .init(type: .arrayOfSubSchema(.init(
                                name: "Data",
                                url: "some://url",
                                properties: [
                                    "id": .init(type: .simple(.string())),
                                    "type": .init(type: .constant("somethingOlds"))
                                ]
                            )))
                        ],
                        requiredProperties: ["id", "type"]
                    )), deprecated: true),
                    "individualTesters": .init(type: .schema(.init(
                        name: "IndividualTesters",
                        url: "some://url",
                        properties: [
                            "data": .init(type: .arrayOfSubSchema(.init(
                                name: "Data",
                                url: "some://url",
                                properties: [
                                    "id": .init(type: .simple(.string())),
                                    "type": .init(type: .constant("betaTesters"))
                                ]
                            )))
                        ],
                        requiredProperties: ["id", "type"]
                    ))),
                    "preReleaseVersion": .init(type: .schema(.init(
                        name: "PreReleaseVersion",
                        url: "some://url",
                        properties: [
                            "data": .init(type: .schema(.init(
                                name: "Data",
                                url: "some://url",
                                properties: [
                                    "id": .init(type: .simple(.string())),
                                    "type": .init(type: .constant("preReleaseVersions"))
                                ]
                            )))
                        ],
                        requiredProperties: ["id", "type"]
                    )))
                ]
            )))]
        )
        let somethingOldSchema = ObjectSchema(
            name: "SomethingOld",
            url: "some://url",
            properties: ["type": .init(type: .constant("somethingOlds"))]
        )
        let prereleaseVersionSchema = ObjectSchema(
            name: "PrereleaseVersion",
            url: "some://url",
            properties: ["type": .init(type: .constant("preReleaseVersions"))]
        )
        let betaTesterSchema = ObjectSchema(
            name: "BetaTester",
            url: "some://url",
            properties: ["type": .init(type: .constant("betaTesters"))]
        )
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [
            "Build": .object(buildSchema),
            "BetaTester": .object(betaTesterSchema),
            "PrereleaseVersion": .object(prereleaseVersionSchema),
            "SomethingOld": .object(somethingOldSchema)
        ])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct BuildsResponse: Codable, Sendable {
            public typealias Data = Build

            public var data: [Build]?
            public var included: [Included]?

            public init(data: [Build]? = nil,
                        included: [Included]? = nil)
            {
                self.data = data
                self.included = included
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Build].self, forKey: "data")
                included = try container.decodeIfPresent([Included].self, forKey: "included")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(data, forKey: "data")
                try container.encodeIfPresent(included, forKey: "included")
            }

            public func getIndividualTesters(for build: Build) -> [BetaTester] {
                guard let individualTesterIds = build.relationships?.individualTesters?.data?.map(\.id),
                      let individualTesters = included?.compactMap({ relationship -> BetaTester? in
                          guard case let .betaTester(individualTester) = relationship else { return nil }
                          return individualTesterIds.contains(individualTester.id) ? individualTester : nil
                      })
                else {
                    return []
                }
                return individualTesters
            }

            public func getPreReleaseVersion(for build: Build) -> PrereleaseVersion? {
                included?.compactMap { relationship -> PrereleaseVersion? in
                    guard case let .prereleaseVersion(preReleaseVersion) = relationship else { return nil }
                    return preReleaseVersion
                }.first { $0.id == build.relationships?.preReleaseVersion?.data?.id }
            }

            public enum Included: Codable, Sendable {
                case betaTester(BetaTester)
                case prereleaseVersion(PrereleaseVersion)
                case somethingOld(SomethingOld)

                public init(from decoder: Decoder) throws {
                    if let betaTester = try? BetaTester(from: decoder) {
                        self = .betaTester(betaTester)
                    } else if let prereleaseVersion = try? PrereleaseVersion(from: decoder) {
                        self = .prereleaseVersion(prereleaseVersion)
                    } else if let somethingOld = try? SomethingOld(from: decoder) {
                        self = .somethingOld(somethingOld)
                    } else {
                        throw DecodingError.typeMismatch(
                            Included.self,
                            DecodingError.Context(
                                codingPath: decoder.codingPath,
                                debugDescription: "Unknown Included"))
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    switch self {
                    case let .betaTester(value):
                        try value.encode(to: encoder)
                    case let .prereleaseVersion(value):
                        try value.encode(to: encoder)
                    case let .somethingOld(value):
                        try value.encode(to: encoder)
                    }
                }
            }
        }
        """#)
    }

    func testGetterForMultiRelationshipSingleIncludedType() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(
            name: "AppEventsResponse",
            url: "https://developer.apple.com/documentation/appstoreconnectapi/appeventsresponse",
            properties: [
                "meta": .init(type: .schemaRef("PagingInformation")),
                "included": .init(type: .arrayOfSchemaRef("AppEventLocalization")),
                "data": .init(type: .arrayOfSchemaRef("AppEvent")),
                "links": .init(type: .schemaRef("PagedDocumentLinks"))
            ],
            requiredProperties: ["data", "links"]
        )
        let appEventSchema = ObjectSchema(
            name: "AppEvent",
            url: "some://url",
            properties: [
                "type": .init(type: .constant("appEvents")),
                "relationships": .init(type: .schema(.init(
                    name: "Relationships",
                    url: "some://url",
                    properties: [
                        "localizations": .init(type: .schema(.init(
                            name: "AppEventLocalization",
                            url: "some://url",
                            properties: [
                                "data": .init(type: .arrayOfSubSchema(.init(
                                    name: "Data",
                                    url: "some://url",
                                    properties: [
                                        "id": .init(type: .simple(.string())),
                                        "type": .init(type: .constant("appEventLocalizations"))
                                    ]
                                )))
                            ],
                            requiredProperties: ["id", "type"]
                        )))
                    ])))
            ]
        )
        let appEventLocalizationSchema = ObjectSchema(
            name: "AppEventLocalization",
            url: "some://url",
            properties: ["type": .init(type: .constant("appEventLocalizations"))]
        )
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [
            "AppEvent": .object(appEventSchema),
            "AppEventLocalization": .object(appEventLocalizationSchema)
        ])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct AppEventsResponse: Codable, Sendable, PagedResponse {
            public typealias Data = AppEvent

            public let data: [AppEvent]
            public var included: [AppEventLocalization]?
            public let links: PagedDocumentLinks
            public var meta: PagingInformation?

            public init(data: [AppEvent],
                        included: [AppEventLocalization]? = nil,
                        links: PagedDocumentLinks,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.included = included
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decode([AppEvent].self, forKey: "data")
                included = try container.decodeIfPresent([AppEventLocalization].self, forKey: "included")
                links = try container.decode(PagedDocumentLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(included, forKey: "included")
                try container.encode(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public func getLocalizations(for appEvent: AppEvent) -> [AppEventLocalization] {
                guard let localizationIds = appEvent.relationships?.localizations?.data?.map(\.id) else { return [] }
                return included?.filter { localizationIds.contains($0.id) } ?? []
            }
        }
        """#)
    }
    
    func testGetterForSingleRelationshipSingleIncludedType() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(
            name: "AppEventsResponse",
            url: "https://developer.apple.com/documentation/appstoreconnectapi/appeventsresponse",
            properties: [
                "meta": .init(type: .schemaRef("PagingInformation")),
                "included": .init(type: .arrayOfSchemaRef("AppEventLocalization")),
                "data": .init(type: .arrayOfSchemaRef("AppEvent")),
                "links": .init(type: .schemaRef("PagedDocumentLinks"))
            ],
            requiredProperties: ["data", "links"]
        )
        let appEventSchema = ObjectSchema(
            name: "AppEvent",
            url: "some://url",
            properties: [
                "type": .init(type: .constant("appEvents")),
                "relationships": .init(type: .schema(.init(
                    name: "Relationships",
                    url: "some://url",
                    properties: [
                        "localization": .init(type: .schema(.init(
                            name: "AppEventLocalization",
                            url: "some://url",
                            properties: [
                                "data": .init(type: .schema(.init(
                                    name: "Data",
                                    url: "some://url",
                                    properties: [
                                        "id": .init(type: .simple(.string())),
                                        "type": .init(type: .constant("appEventLocalizations"))
                                    ]
                                )))
                            ],
                            requiredProperties: ["id", "type"]
                        )))
                    ])))
            ]
        )
        let appEventLocalizationSchema = ObjectSchema(
            name: "AppEventLocalization",
            url: "some://url",
            properties: ["type": .init(type: .constant("appEventLocalizations"))]
        )
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [
            "AppEvent": .object(appEventSchema),
            "AppEventLocalization": .object(appEventLocalizationSchema)
        ])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct AppEventsResponse: Codable, Sendable, PagedResponse {
            public typealias Data = AppEvent

            public let data: [AppEvent]
            public var included: [AppEventLocalization]?
            public let links: PagedDocumentLinks
            public var meta: PagingInformation?

            public init(data: [AppEvent],
                        included: [AppEventLocalization]? = nil,
                        links: PagedDocumentLinks,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.included = included
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decode([AppEvent].self, forKey: "data")
                included = try container.decodeIfPresent([AppEventLocalization].self, forKey: "included")
                links = try container.decode(PagedDocumentLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(included, forKey: "included")
                try container.encode(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public func getLocalization(for appEvent: AppEvent) -> AppEventLocalization? {
                included?.first { $0.id == appEvent.relationships?.localization?.data?.id }
            }
        }
        """#)
    }

    func testRenderCustomCoding() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/person", title: "Person", abstract: "A person with a name.", discussion: nil, properties: [:], subDocumentationIds: [])),
            "some://url/attributes": .object(
                .init(id: "/person/attributes", title: "Attributes", abstract: "Attributes for a Person", discussion: nil, properties: ["age": .init(required: false, description: "The person's age")], subDocumentationIds: [])),
            "some://url/relationships": .object(
                .init(id: "/person/relationships", title: "Relationships", abstract: "The relationships you included in the request and those on which you can operate.", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let attributesSchema = ObjectSchema(name: "Attributes",
                                            url: "some://url/attributes",
                                            properties: ["age": .init(type: .simple(.init(type: "integer")))])
        let relationshipsSchema = ObjectSchema(name: "Relationships",
                                               url: "some://url/relationships",
                                               properties: ["children": .init(type: .arrayOfSchemaRef("Child"))])
        let schema = ObjectSchema(name: "Person",
                                  url: "some://url",
                                  properties: ["name": .init(type: .simple(.init(type: "string"))),
                                               "age": .init(type: .simple(.init(type: "integer"))),
                                               "type": .init(type: .constant("person")),
                                               "attributes": .init(type: .schema(attributesSchema)),
                                               "relationships": .init(type: .schema(relationshipsSchema))],
                                  requiredProperties: ["name", "attributes"])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Person
         A person with a name.

         Full documentation:
         <some://url>
         */
        public struct Person: Codable, Sendable {
            public var age: Int?
            public let name: String
            public var type: String { "person" }
            public let attributes: Attributes
            public var relationships: Relationships?

            public init(age: Int? = nil,
                        name: String,
                        attributes: Attributes,
                        relationships: Relationships? = nil)
            {
                self.age = age
                self.name = name
                self.attributes = attributes
                self.relationships = relationships
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                age = try container.decodeIfPresent(Int.self, forKey: "age")
                name = try container.decode(String.self, forKey: "name")
                attributes = try container.decode(Attributes.self, forKey: "attributes")
                relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
                if try container.decode(String.self, forKey: "type") != type {
                    throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(age, forKey: "age")
                try container.encode(name, forKey: "name")
                try container.encode(type, forKey: "type")
                try container.encode(attributes, forKey: "attributes")
                try container.encodeIfPresent(relationships, forKey: "relationships")
            }

            /**
             # Attributes
             Attributes for a Person

             Full documentation:
             <some://url/attributes>
             */
            public struct Attributes: Codable, Sendable {
                /// The person's age
                public var age: Int?

                public init(age: Int? = nil) {
                    self.age = age
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    age = try container.decodeIfPresent(Int.self, forKey: "age")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(age, forKey: "age")
                }
            }

            /**
             # Relationships
             The relationships you included in the request and those on which you can operate.

             Full documentation:
             <some://url/relationships>
             */
            public struct Relationships: Codable, Sendable {
                public var children: [Child]?

                public init(children: [Child]? = nil) {
                    self.children = children
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    children = try container.decodeIfPresent([Child].self, forKey: "children")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(children, forKey: "children")
                }
            }
        }
        """#)
    }

    func testRenderCustomCodingForNullCodableProperties() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/profile", title: "Profile", abstract: "A profile.", discussion: nil, properties: [:], subDocumentationIds: [])),
            "some://url/relationships": .object(
                .init(id: "/person/relationships", title: "Relationships", abstract: "The relationships you included in the request and those on which you can operate.", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let relationshipsSchema = ObjectSchema(name: "Relationships",
                                               url: "some://url/relationships",
                                               properties: ["bundleId": .init(type: .schema(.init(name: "BundleId", url: "some://url/relationship/bundleid", properties: [
                                                   "data": .init(type: .schema(.init(name: "Data", url: "some://url/relationship/bundleid/data", properties: [
                                                       "id": .init(type: .simple(.string())), "type": .init(type: .constant("bundleIds"), deprecated: false)
                                                   ])))
                                               ])))])
        let schema = ObjectSchema(name: "Profile",
                                  url: "some://url",
                                  properties: ["id": .init(type: .simple(.string())), "relationships": .init(type: .schema(relationshipsSchema))],
                                  requiredProperties: ["id"])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        /**
         # Profile
         A profile.

         Full documentation:
         <some://url>
         */
        public struct Profile: Codable, Sendable, Identifiable {
            public let id: String
            public var relationships: Relationships?

            public init(id: String,
                        relationships: Relationships? = nil)
            {
                self.id = id
                self.relationships = relationships
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                id = try container.decode(String.self, forKey: "id")
                relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(id, forKey: "id")
                try container.encodeIfPresent(relationships, forKey: "relationships")
            }

            /**
             # Relationships
             The relationships you included in the request and those on which you can operate.

             Full documentation:
             <some://url/relationships>
             */
            public struct Relationships: Codable, Sendable {
                public var bundleId: BundleId?

                public init(bundleId: BundleId? = nil) {
                    self.bundleId = bundleId
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    bundleId = try container.decodeIfPresent(BundleId.self, forKey: "bundleId")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(bundleId, forKey: "bundleId")
                }

                public struct BundleId: Codable, Sendable {
                    @NullCodable public var data: Data?

                    public init(data: Data? = nil) {
                        self.data = data
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        data = try container.decodeIfPresent(Data.self, forKey: "data")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(data, forKey: "data")
                    }

                    public struct Data: Codable, Sendable, Identifiable {
                        public var id: String?
                        public var type: String { "bundleIds" }

                        public init(id: String? = nil) {
                            self.id = id
                        }

                        public init(from decoder: Decoder) throws {
                            let container = try decoder.container(keyedBy: AnyCodingKey.self)
                            id = try container.decodeIfPresent(String.self, forKey: "id")
                            if try container.decode(String.self, forKey: "type") != type {
                                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                            }
                        }

                        public func encode(to encoder: Encoder) throws {
                            var container = encoder.container(keyedBy: AnyCodingKey.self)
                            try container.encodeIfPresent(id, forKey: "id")
                            try container.encode(type, forKey: "type")
                        }
                    }
                }
            }
        }
        """#)
    }

    func testRenderWithCustomTypeProperty() async throws {
        // Given
        let json = """
        {
            "PhoneNumber" : {
                "type" : "object",
                "properties" : {
                    "number" : {
                        "type" : "string"
                    },
                    "type" : {
                        "type" : "string",
                        "enum" : [ "FAX", "LANDLINE", "MOBILE", "TOLLFREE" ]
                    },
                    "intent" : {
                        "type" : "string"
                    }
                }
            }
        }
        """
        let schema = try JSONDecoder().decode([String: ObjectSchema].self, from: json.data(using: .utf8)!)["PhoneNumber"]!
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct PhoneNumber: Codable, Sendable {
            public var intent: String?
            public var number: String?
            public var type: PhoneNumberType?

            public init(intent: String? = nil,
                        number: String? = nil,
                        type: PhoneNumberType? = nil)
            {
                self.intent = intent
                self.number = number
                self.type = type
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                intent = try container.decodeIfPresent(String.self, forKey: "intent")
                number = try container.decodeIfPresent(String.self, forKey: "number")
                type = try container.decode(PhoneNumberType.self, forKey: "type")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(intent, forKey: "intent")
                try container.encodeIfPresent(number, forKey: "number")
                try container.encode(type, forKey: "type")
            }

            public enum PhoneNumberType: String, Sendable, Codable, CaseIterable {
                case fax = "FAX"
                case landline = "LANDLINE"
                case mobile = "MOBILE"
                case tollfree = "TOLLFREE"
            }
        }
        """#)
    }

    func testRenderWithAdditionalProtocol() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = ObjectSchema(name: "PhoneNumber", url: "some://url/relationships", additionalProtocols: ["Fooable"])
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct PhoneNumber: Codable, Sendable, Fooable {
            public init() {}

            public init(from decoder: Decoder) throws {}

            public func encode(to encoder: Encoder) throws {}
        }
        """#)
    }

    func testRenderWithDeprecatedRequiredProperty() async throws {
        // Given
        let json = """
        {
            "Something" : {
                "type" : "object",
                "properties" : {
                    "app" : {
                        "type" : "object",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "apps" ]
                                    },
                                    "id" : {
                                        "type" : "string"
                                    }
                                },
                                "required" : [ "id", "type" ]
                            }
                        },
                        "required" : [ "data" ],
                        "deprecated" : true
                    }

                },
                "required" : [ "app" ]
            }
        }
        """
        let schema = try JSONDecoder().decode([String: ObjectSchema].self, from: json.data(using: .utf8)!)["Something"]!
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Something: Codable, Sendable {
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public let app: App

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(app: App) {
                self.app = app
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                app = try container.decode(App.self, forKey: "app")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(app, forKey: "app")
            }

            public struct App: Codable, Sendable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
        """#)
    }

    func testRenderWithDeprecatedRequiredAndOtherProperty() async throws {
        // Given
        let json = """
        {
            "Something" : {
                "type" : "object",
                "properties" : {
                    "app" : {
                        "type" : "object",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "apps" ]
                                    },
                                    "id" : {
                                        "type" : "string"
                                    }
                                },
                                "required" : [ "id", "type" ]
                            }
                        },
                        "required" : [ "data" ],
                        "deprecated" : true
                    },
                    "user" : {
                        "type" : "object",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "users" ]
                                    },
                                    "id" : {
                                        "type" : "string"
                                    }
                                },
                                "required" : [ "id", "type" ]
                            }
                        },
                        "required" : [ "data" ],
                        "deprecated" : false
                    }

                },
                "required" : [ "app", "user" ]
            }
        }
        """
        let schema = try JSONDecoder().decode([String: ObjectSchema].self, from: json.data(using: .utf8)!)["Something"]!
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Something: Codable, Sendable {
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public let app: App
            public let user: User

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(app: App,
                        user: User)
            {
                self.app = app
                self.user = user
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                app = try container.decode(App.self, forKey: "app")
                user = try container.decode(User.self, forKey: "user")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(app, forKey: "app")
                try container.encode(user, forKey: "user")
            }

            public struct App: Codable, Sendable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            public struct User: Codable, Sendable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "users" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
        """#)
    }

    func testRenderWithDeprecatedNonRequiredAndOtherProperty() async throws {
        // Given
        let json = """
        {
            "Something" : {
                "type" : "object",
                "properties" : {
                    "app" : {
                        "type" : "object",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "apps" ]
                                    },
                                    "id" : {
                                        "type" : "string"
                                    }
                                },
                                "required" : [ "id", "type" ]
                            }
                        },
                        "required" : [ "data" ],
                        "deprecated" : true
                    },
                    "user" : {
                        "type" : "object",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "users" ]
                                    },
                                    "id" : {
                                        "type" : "string"
                                    }
                                },
                                "required" : [ "id", "type" ]
                            }
                        },
                        "required" : [ "data" ],
                        "deprecated" : false
                    }

                },
                "required" : [ "user" ]
            }
        }
        """
        let schema = try JSONDecoder().decode([String: ObjectSchema].self, from: json.data(using: .utf8)!)["Something"]!
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        // When
        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Something: Codable, Sendable {
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var app: App? = nil
            public let user: User

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(app: App? = nil,
                        user: User)
            {
                self.app = app
                self.user = user
            }

            public init(user: User) {
                self.user = user
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                app = try container.decodeIfPresent(App.self, forKey: "app")
                user = try container.decode(User.self, forKey: "user")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(app, forKey: "app")
                try container.encode(user, forKey: "user")
            }

            public struct App: Codable, Sendable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            public struct User: Codable, Sendable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "users" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
        """#)
    }
}
