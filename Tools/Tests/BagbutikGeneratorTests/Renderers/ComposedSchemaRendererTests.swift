@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class ComposedSchemaRendererTests: XCTestCase {
    func testRenderingCompositionPreservesPublicAPIAndCodingRequirements() async throws {
        let schemas = try decodeSchemas()
        let renderer = ObjectSchemaRenderer(docsLoader: DocsLoader(schemaDocumentationById: [:]), shouldFormat: true)
        guard case .object(let schema) = schemas["AwaitingUpload"] else {
            return XCTFail("Expected composed object")
        }

        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: schemas)

        for declaration in [
            "public struct AwaitingUpload: Codable, Sendable",
            "public let state: AssetState",
            "public var fileName: String?",
            "public let uploadOperations: [UploadOperation]",
            "public var image: Image?",
            "public struct Image: Codable, Sendable",
            "public let asset: ImageAsset",
        ] {
            XCTAssertTrue(rendered.contains(declaration), "Missing declaration: \(declaration)")
        }
        for statement in [
            #"state = try container.decode(AssetState.self, forKey: "state")"#,
            #"fileName = try container.decodeIfPresent(String.self, forKey: "fileName")"#,
            #"uploadOperations = try container.decode([UploadOperation].self, forKey: "uploadOperations")"#,
            #"try container.encode(state, forKey: "state")"#,
            #"try container.encode(uploadOperations, forKey: "uploadOperations")"#,
        ] {
            XCTAssertTrue(rendered.contains(statement), "Missing coding requirement: \(statement)")
        }
    }

    func testDependencyGraphIncludesInheritedAndAddedReferences() throws {
        let schemas = try decodeSchemas()
        let dependencies = SchemaReferenceGraph(schemas: schemas).closure(startingAt: ["AwaitingUpload"])

        XCTAssertEqual(dependencies, ["AwaitingUpload", "AssetState", "UploadOperation", "ImageAsset"])
    }

    private func decodeSchemas() throws -> [String: Schema] {
        let json = #"""
        {
            "schemas": {
                "Common": {
                    "type": "object",
                    "properties": {
                        "state": { "$ref": "#/components/schemas/AssetState" },
                        "fileName": { "type": "string" }
                    },
                    "required": ["state"]
                },
                "AwaitingUpload": {
                    "allOf": [
                        { "$ref": "#/components/schemas/Common" },
                        {
                            "type": "object",
                            "properties": {
                                "uploadOperations": {
                                    "type": "array",
                                    "items": { "$ref": "#/components/schemas/UploadOperation" }
                                },
                                "image": {
                                    "type": "object",
                                    "properties": { "asset": { "$ref": "#/components/schemas/ImageAsset" } },
                                    "required": ["asset"]
                                }
                            },
                            "required": ["uploadOperations"]
                        }
                    ]
                },
                "AssetState": { "type": "string", "enum": ["AWAITING_UPLOAD", "COMPLETE"] },
                "UploadOperation": { "type": "object" },
                "ImageAsset": { "type": "object" }
            }
        }
        """#
        return try JSONDecoder().decode(Spec.Components.self, from: Data(json.utf8)).schemas
    }
}
