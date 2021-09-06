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
        let rendered = try renderer.render(name: "Included",
                                           oneOfSchema: schema,
                                           includesFixUps: ["appInfoLocalization",
                                                            "primaryCategory",
                                                            "primarySubcategoryOne",
                                                            "primarySubcategoryTwo",
                                                            "secondaryCategory",
                                                            "secondarySubcategoryOne",
                                                            "secondarySubcategoryTwo"])
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable {
            case appInfoLocalization(AppInfoLocalization)
            case primaryCategory(AppCategory)
            case primarySubcategoryOne(AppCategory)
            case primarySubcategoryTwo(AppCategory)
            case secondaryCategory(AppCategory)
            case secondarySubcategoryOne(AppCategory)
            case secondarySubcategoryTwo(AppCategory)

            public init(from decoder: Decoder) throws {
                if let appInfoLocalization = try? AppInfoLocalization(from: decoder) {
                    self = .appInfoLocalization(appInfoLocalization)
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
                case let .appInfoLocalization(value):
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
                case appInfoLocalization
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
            case appPreviewSet(AppPreviewSet)
            case appScreenshotSet(AppScreenshotSet)

            public init(from decoder: Decoder) throws {
                if let appPreviewSet = try? AppPreviewSet(from: decoder) {
                    self = .appPreviewSet(appPreviewSet)
                } else if let appScreenshotSet = try? AppScreenshotSet(from: decoder) {
                    self = .appScreenshotSet(appScreenshotSet)
                } else {
                    throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                          debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .appPreviewSet(value):
                    try value.encode(to: encoder)
                case let .appScreenshotSet(value):
                    try value.encode(to: encoder)
                }
            }

            private enum CodingKeys: String, CodingKey {
                case type
            }

            private enum TypeKeys: String, Codable {
                case appPreviewSet
                case appScreenshotSet
            }
        }

        """#)
    }

    func testContextMultipleScmGitReference() throws {
        // Given
        let schema = OneOfSchema(options: [
            .schemaRef("User")
        ])
        let includesFixUps = ["destinationBranch", "sourceBranchOrTag", "user"]
        // When
        let context = try OneOfSchemaRenderer.oneOfContext(for: schema, named: "BlameGame", includesFixUps: includesFixUps)
        // Then
        XCTAssertEqual(context["name"] as! String, "BlameGame")
        XCTAssertEqual(context["options"] as! [EnumCase], [
            EnumCase(id: "destinationBranch", value: "ScmGitReference"),
            EnumCase(id: "sourceBranchOrTag", value: "ScmGitReference"),
            EnumCase(id: "user", value: "User")
        ])
    }

    func testContextPrimaryRepositories() throws {
        // Given
        let schema = OneOfSchema(options: [
            .schemaRef("ScmRepository"),
            .schemaRef("User")
        ])
        let includesFixUps = ["primaryRepositories", "user"]
        // When
        let context = try OneOfSchemaRenderer.oneOfContext(for: schema, named: "PrivateRepositories", includesFixUps: includesFixUps)
        // Then
        XCTAssertEqual(context["name"] as! String, "PrivateRepositories")
        XCTAssertEqual(context["options"] as! [EnumCase], [
            EnumCase(id: "primaryRepositories", value: "ScmRepository"),
            EnumCase(id: "user", value: "User")
        ])
    }
    
    func testContextErrorSubTypes() throws {
        // Given
        let schema = OneOfSchema(options: [
            .schemaRef("ErrorSourcePointer"),
            .schemaRef("ErrorSourceParameter")
        ])
        // When
        let context = try OneOfSchemaRenderer.oneOfContext(for: schema, named: "ErrorResponse")
        // Then
        XCTAssertEqual(context["name"] as! String, "ErrorResponse")
        XCTAssertEqual(context["options"] as! [EnumCase], [
            EnumCase(id: "errorSourceParameter", value: "Parameter"),
            EnumCase(id: "errorSourcePointer", value: "JsonPointer")
        ])
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
