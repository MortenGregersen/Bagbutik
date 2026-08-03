@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class FeedbackCheckerTests: XCTestCase {
    let validSpecFileURL = URL(fileURLWithPath: "/Users/steve/spec.json")

    func testInvalidSpecFileURL() async {
        let checker = makeChecker()
        let invalidSpecFileURL = URL(string: "https://developer.apple.com")!
        let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")

        await XCTAssertAsyncThrowsError(try await checker.checkFeedback(specFileURL: invalidSpecFileURL, documentationDirURL: validDocumentationDirURL)) {
            XCTAssertEqual($0 as? FeedbackCheckerError, .notFileUrl(.specFileURL))
        }
    }

    func testInvalidDocumentationDirURL() async {
        let checker = makeChecker()
        let invalidDocumentationDirURL = URL(string: "https://developer.apple.com")!

        await XCTAssertAsyncThrowsError(try await checker.checkFeedback(specFileURL: validSpecFileURL, documentationDirURL: invalidDocumentationDirURL)) {
            XCTAssertEqual($0 as? FeedbackCheckerError, .notFileUrl(.documentationDirUrl))
        }
    }

    func testConvenienceInitWithEmptySpecOnDisk() async throws {
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let specFileURL = temporaryDirectoryURL.appendingPathComponent("spec.json")
        let documentationDirURL = try createDocumentationDirectory(
            in: temporaryDirectoryURL,
            operationDocumentationById: [:],
            schemaMapping: [:],
            schemaDocumentationById: [:]
        )
        try FileManager.default.createDirectory(at: temporaryDirectoryURL, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectoryURL)
        }

        try #"{"paths":{},"components":{"schemas":{}}}"#.data(using: .utf8)!.write(to: specFileURL)

        try await FeedbackChecker().checkFeedback(specFileURL: specFileURL, documentationDirURL: documentationDirURL)
    }

    func testCheckFeedbackReportsPatchStillNeeded() async throws {
        let originalSpec = try makeBundleIdPlatformSpec(includeServices: false)
        var patchedSpec = originalSpec
        try patchedSpec.applyManualPatches()
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let documentationDirURL = try createDocumentationDirectory(
            in: temporaryDirectoryURL,
            operationDocumentationById: [:],
            schemaMapping: ["BundleIdPlatform": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/bundleidplatform"],
            schemaDocumentationById: [
                "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/bundleidplatform": .enum(.init(
                    id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/bundleidplatform",
                    hierarchy: .init(paths: []),
                    title: "BundleIdPlatform",
                    cases: ["IOS": "iOS"]
                ))
            ]
        )
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectoryURL)
        }

        var printedLines = [String]()
        let checker = FeedbackChecker(
            loadOriginalSpec: { _ in originalSpec },
            loadPatchedSpec: { _ in patchedSpec },
            docsLoader: DocsLoader(),
            print: { printedLines.append($0) }
        )

        try await checker.checkFeedback(specFileURL: validSpecFileURL, documentationDirURL: documentationDirURL)

        XCTAssertTrue(printedLines.contains("😢 Patching is still needed for:"))
        XCTAssertTrue(printedLines.contains("- BundleIdPlatform"))
    }

    func testCheckFeedbackReportsPatchNoLongerNeeded() async throws {
        let originalSpec = try makeBundleIdPlatformSpec(includeServices: true)
        var patchedSpec = originalSpec
        try patchedSpec.applyManualPatches()
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let documentationDirURL = try createDocumentationDirectory(
            in: temporaryDirectoryURL,
            operationDocumentationById: [:],
            schemaMapping: [:],
            schemaDocumentationById: [:]
        )
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectoryURL)
        }

        var printedLines = [String]()
        let checker = FeedbackChecker(
            loadOriginalSpec: { _ in originalSpec },
            loadPatchedSpec: { _ in patchedSpec },
            docsLoader: DocsLoader(),
            print: { printedLines.append($0) }
        )

        try await checker.checkFeedback(specFileURL: validSpecFileURL, documentationDirURL: documentationDirURL)

        XCTAssertTrue(printedLines.contains("🎉 Patching is no longer needed for:"))
        XCTAssertTrue(printedLines.contains("- BundleIdPlatform"))
    }

    func testCheckFeedbackWarnsWhenDocumentationAndInferenceAreMissing() async throws {
        let originalSpec = try makeErrorResponseSpec(includeErrorsProperty: true)
        var patchedSpec = originalSpec
        try patchedSpec.applyManualPatches()
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let documentationDirURL = try createDocumentationDirectory(
            in: temporaryDirectoryURL,
            operationDocumentationById: [:],
            schemaMapping: [:],
            schemaDocumentationById: [:]
        )
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectoryURL)
        }

        var printedLines = [String]()
        let checker = FeedbackChecker(
            loadOriginalSpec: { _ in originalSpec },
            loadPatchedSpec: { _ in patchedSpec },
            docsLoader: DocsLoader(),
            print: { printedLines.append($0) }
        )

        try await checker.checkFeedback(specFileURL: validSpecFileURL, documentationDirURL: documentationDirURL)

        XCTAssertTrue(printedLines.contains(where: { $0.contains("No documentation found for schema 'ErrorResponse.errors'") }))
    }

    func testCheckFeedbackSkipsWhenUnpatchedSchemaCannotBeResolved() async throws {
        let originalSpec = try makeErrorResponseSpec(includeErrorsProperty: false)
        var patchedSpec = try makeErrorResponseSpec(includeErrorsProperty: true)
        try patchedSpec.applyManualPatches()
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let documentationDirURL = try createDocumentationDirectory(
            in: temporaryDirectoryURL,
            operationDocumentationById: [:],
            schemaMapping: ["ErrorResponse": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/errorresponse"],
            schemaDocumentationById: [
                "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/errorresponse": .object(.init(
                    id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/errorresponse",
                    title: "ErrorResponse"
                ))
            ]
        )
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectoryURL)
        }

        var printedLines = [String]()
        let checker = FeedbackChecker(
            loadOriginalSpec: { _ in originalSpec },
            loadPatchedSpec: { _ in patchedSpec },
            docsLoader: DocsLoader(),
            print: { printedLines.append($0) }
        )

        try await checker.checkFeedback(specFileURL: validSpecFileURL, documentationDirURL: documentationDirURL)

        XCTAssertTrue(printedLines.contains(where: { $0.contains("Could not locate unpatched schema 'ErrorResponse.errors'") }))
    }

    private func makeChecker() -> FeedbackChecker {
        FeedbackChecker(
            loadOriginalSpec: { _ in fatalError("Spec loading should not be reached in URL validation tests") },
            loadPatchedSpec: { _ in fatalError("Spec loading should not be reached in URL validation tests") },
            docsLoader: DocsLoader(),
            print: { _ in }
        )
    }

    private func createDocumentationDirectory(
        in parentDirectoryURL: URL,
        operationDocumentationById: [String: Documentation],
        schemaMapping: [String: String],
        schemaDocumentationById: [String: Documentation]
    ) throws -> URL {
        let documentationDirURL = parentDirectoryURL.appendingPathComponent("Documentation")
        try FileManager.default.createDirectory(at: documentationDirURL, withIntermediateDirectories: true)

        let jsonEncoder = JSONEncoder()
        try jsonEncoder.encode(operationDocumentationById).write(to: documentationDirURL.appendingPathComponent(DocsFilename.operationDocumentation.filename))
        try jsonEncoder.encode(schemaMapping).write(to: documentationDirURL.appendingPathComponent(DocsFilename.schemaMapping.filename))
        try jsonEncoder.encode(schemaDocumentationById).write(to: documentationDirURL.appendingPathComponent(DocsFilename.schemaDocumentation.filename))
        return documentationDirURL
    }

    private func makeBundleIdPlatformSpec(includeServices: Bool) throws -> Spec {
        let caseValues = includeServices ? ["IOS", "SERVICES"] : ["IOS"]
        return try Spec(paths: [:], components: .init(schemas: [
            "BundleIdPlatform": .enum(.init(name: "BundleIdPlatform", type: "String", caseValues: caseValues))
        ]))
    }

    private func makeErrorResponseSpec(includeErrorsProperty: Bool) throws -> Spec {
        let errorsProperty = includeErrorsProperty ? #"""
        "errors" : {
            "type" : "array",
            "items" : {
                "type" : "object",
                "properties" : {
                    "id" : {
                        "type" : "string"
                    },
                    "status" : {
                        "type" : "string"
                    },
                    "code" : {
                        "type" : "string"
                    },
                    "title" : {
                        "type" : "string"
                    },
                    "detail" : {
                        "type" : "string"
                    },
                    "source" : {
                        "oneOf" : [ {
                            "$ref" : "#/components/schemas/ErrorSourcePointer"
                        }, {
                            "$ref" : "#/components/schemas/ErrorSourceParameter"
                        } ]
                    },
                    "meta" : {
                        "type" : "object",
                        "additionalProperties" : { }
                    }
                },
                "required" : [ "code", "detail", "status", "title" ]
            }
        }
        """# : ""

        let json = """
        {
            "paths": {},
            "components": {
                "schemas": {
                    "ErrorResponse": {
                        "type": "object",
                        "properties": {
                            \(errorsProperty)
                        }
                    },
                    "ErrorSourcePointer": {
                        "type": "object",
                        "properties": {
                            "pointer": {
                                "type": "string"
                            }
                        }
                    },
                    "ErrorSourceParameter": {
                        "type": "object",
                        "properties": {
                            "parameter": {
                                "type": "string"
                            }
                        }
                    },
                    "JsonPointer": {
                        "type": "object",
                        "properties": {
                            "pointer": {
                                "type": "string"
                            }
                        }
                    },
                    "Parameter": {
                        "type": "object",
                        "properties": {
                            "parameter": {
                                "type": "string"
                            }
                        }
                    }
                }
            }
        }
        """

        return try JSONDecoder().decode(Spec.self, from: json.data(using: .utf8)!)
    }
}
