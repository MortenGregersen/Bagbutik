@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class OneOfSchemaRendererTests: XCTestCase {
    func testRender() throws {
        // Given
        let renderer = OneOfSchemaRenderer()
        let schema = OneOfSchema(options: [.schemaRef("BundleId"), .schemaRef("Certificate"), .schemaRef("Device")])
        // When
        let rendered = try renderer.render(name: "Included", oneOfSchema: schema, includesFixUps: ["bundleIds", "certificates", "devices"])
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable {
            case bundleIds(BundleId)
            case certificates(Certificate)
            case devices(Device)

            public init(from decoder: Decoder) throws {
                if let bundleIds = try? BundleId(from: decoder) {
                    self = .bundleIds(bundleIds)
                } else if let certificates = try? Certificate(from: decoder) {
                    self = .certificates(certificates)
                } else if let devices = try? Device(from: decoder) {
                    self = .devices(devices)
                } else {
                    throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                          debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .bundleIds(value):
                    try value.encode(to: encoder)
                case let .certificates(value):
                    try value.encode(to: encoder)
                case let .devices(value):
                    try value.encode(to: encoder)
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }

            private enum TypeKeys: String, Codable {
                case bundleIds
                case certificates
                case devices
            }
        }

        """#)
    }

    func testRenderWithOnlyMultipleAppCategories() throws {
        // Given
        let renderer = OneOfSchemaRenderer()
        let schema = OneOfSchema(options: [.schemaRef("AppCategory")])
        // When
        let rendered = try renderer.render(name: "Included", oneOfSchema: schema, includesFixUps: ["parent", "subcategories", "appCategories"])
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable {
            case parent(AppCategory)
            case subcategories(AppCategory)

            public init(from decoder: Decoder) throws {
                if let parent = try? AppCategory(from: decoder) {
                    self = .parent(parent)
                } else if let subcategories = try? AppCategory(from: decoder) {
                    self = .subcategories(subcategories)
                } else {
                    throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                          debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .parent(value):
                    try value.encode(to: encoder)
                case let .subcategories(value):
                    try value.encode(to: encoder)
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }

            private enum TypeKeys: String, Codable {
                case parent
                case subcategories
            }
        }

        """#)
    }

    func testRenderWithSomethingAndMultipleAppCategories() throws {
        // Given
        let renderer = OneOfSchemaRenderer()
        let schema = OneOfSchema(options: [.schemaRef("AppInfoLocalization"), .schemaRef("AppCategory")])
        // When
        let rendered = try renderer.render(name: "Included", oneOfSchema: schema, includesFixUps: ["appInfoLocalizations",
                                                                                                   "primaryCategory",
                                                                                                   "primarySubcategoryOne",
                                                                                                   "primarySubcategoryTwo",
                                                                                                   "secondaryCategory",
                                                                                                   "secondarySubcategoryOne",
                                                                                                   "secondarySubcategoryTwo"])
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable {
            case appInfoLocalizations(AppInfoLocalization)
            case primaryCategory(AppCategory)
            case primarySubcategoryOne(AppCategory)
            case primarySubcategoryTwo(AppCategory)
            case secondaryCategory(AppCategory)
            case secondarySubcategoryOne(AppCategory)
            case secondarySubcategoryTwo(AppCategory)

            public init(from decoder: Decoder) throws {
                if let appInfoLocalizations = try? AppInfoLocalization(from: decoder) {
                    self = .appInfoLocalizations(appInfoLocalizations)
                } else if let primaryCategory = try? AppCategory(from: decoder) {
                    self = .primaryCategory(primaryCategory)
                } else if let primarySubcategoryOne = try? AppCategory(from: decoder) {
                    self = .primarySubcategoryOne(primarySubcategoryOne)
                } else if let primarySubcategoryTwo = try? AppCategory(from: decoder) {
                    self = .primarySubcategoryTwo(primarySubcategoryTwo)
                } else if let secondaryCategory = try? AppCategory(from: decoder) {
                    self = .secondaryCategory(secondaryCategory)
                } else if let secondarySubcategoryOne = try? AppCategory(from: decoder) {
                    self = .secondarySubcategoryOne(secondarySubcategoryOne)
                } else if let secondarySubcategoryTwo = try? AppCategory(from: decoder) {
                    self = .secondarySubcategoryTwo(secondarySubcategoryTwo)
                } else {
                    throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                          debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .appInfoLocalizations(value):
                    try value.encode(to: encoder)
                case let .primaryCategory(value):
                    try value.encode(to: encoder)
                case let .primarySubcategoryOne(value):
                    try value.encode(to: encoder)
                case let .primarySubcategoryTwo(value):
                    try value.encode(to: encoder)
                case let .secondaryCategory(value):
                    try value.encode(to: encoder)
                case let .secondarySubcategoryOne(value):
                    try value.encode(to: encoder)
                case let .secondarySubcategoryTwo(value):
                    try value.encode(to: encoder)
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }

            private enum TypeKeys: String, Codable {
                case appInfoLocalizations
                case primaryCategory
                case primarySubcategoryOne
                case primarySubcategoryTwo
                case secondaryCategory
                case secondarySubcategoryOne
                case secondarySubcategoryTwo
            }
        }

        """#)
    }

    func testRenderWithoutNecessaryFixUps() throws {
        // Given
        let renderer = OneOfSchemaRenderer()
        let schema = OneOfSchema(options: [.schemaRef("AppScreenshotSet"), .schemaRef("AppPreviewSet")])
        // When
        let rendered = try renderer.render(name: "Included", oneOfSchema: schema, includesFixUps: ["appStoreVersionLocalizations"])
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable {
            case appPreviewSets(AppPreviewSet)
            case appScreenshotSets(AppScreenshotSet)

            public init(from decoder: Decoder) throws {
                if let appPreviewSets = try? AppPreviewSet(from: decoder) {
                    self = .appPreviewSets(appPreviewSets)
                } else if let appScreenshotSets = try? AppScreenshotSet(from: decoder) {
                    self = .appScreenshotSets(appScreenshotSets)
                } else {
                    throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                          debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .appPreviewSets(value):
                    try value.encode(to: encoder)
                case let .appScreenshotSets(value):
                    try value.encode(to: encoder)
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }

            private enum TypeKeys: String, Codable {
                case appPreviewSets
                case appScreenshotSets
            }
        }

        """#)
    }

    func testRenderWithSubSchemas() throws {
        // Given
        let renderer = OneOfSchemaRenderer()
        let jsonPointerSchema = ObjectSchema(name: "JsonPointer", url: "some://url", properties: ["pointer": Property(type: .simple(.init(type: "string")), deprecated: true)])
        let parameterSchema = ObjectSchema(name: "Parameter", url: "some://url", properties: ["parameter": Property(type: .simple(.init(type: "string")))])
        let schema = OneOfSchema(options: [.objectSchema(jsonPointerSchema), .objectSchema(parameterSchema)])
        // When
        let rendered = try renderer.render(name: "Source", oneOfSchema: schema, includesFixUps: ["bundleIds", "certificates", "devices"])
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Source: Codable {
            case jsonPointer(JsonPointer)
            case parameter(Parameter)

            public struct JsonPointer: Codable {
                @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
                public var pointer: String? = nil

                @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
                public init(pointer: String? = nil) {
                    self.pointer = pointer
                }

                public init() {}
            }

            public struct Parameter: Codable {
                public let parameter: String?

                public init(parameter: String? = nil) {
                    self.parameter = parameter
                }
            }

            public init(from decoder: Decoder) throws {
                if let jsonPointer = try? JsonPointer(from: decoder) {
                    self = .jsonPointer(jsonPointer)
                } else if let parameter = try? Parameter(from: decoder) {
                    self = .parameter(parameter)
                } else {
                    throw DecodingError.typeMismatch(Source.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                        debugDescription: "Unknown Source"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .jsonPointer(value):
                    try value.encode(to: encoder)
                case let .parameter(value):
                    try value.encode(to: encoder)
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }

            private enum TypeKeys: String, Codable {
                case jsonPointer
                case parameter
            }
        }

        """#)
    }

    func testUnknownTypeForOption() throws {
        // Given
        let oneOfSchema = OneOfSchema(options: [
            .objectSchema(.init(name: "AppCategory", url: "some://url")),
            .objectSchema(.init(name: "SomeUnknownSchema", url: "some://url"))
        ])
        // When
        var thrownError: Error?
        XCTAssertThrowsError(try OneOfSchemaRenderer.oneOfContext(for: oneOfSchema, named: "Something", includesFixUps: [])) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? OneOfSchemaRendererError, OneOfSchemaRendererError.unknownTypeForOption(schemaName: "SomeUnknownSchema"))
    }

    func testNoMatchingFixUp() throws {
        // Given
        let oneOfSchema = OneOfSchema(options: [
            .objectSchema(.init(name: "SomeUnknownSchema", url: "some://url"))
        ])
        // When
        var thrownError: Error?
        XCTAssertThrowsError(try OneOfSchemaRenderer.oneOfContext(for: oneOfSchema, named: "Something", includesFixUps: [])) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? OneOfSchemaRendererError, OneOfSchemaRendererError.noMatchingFixUp(optionName: "someUnknownSchemas"))
    }
}
