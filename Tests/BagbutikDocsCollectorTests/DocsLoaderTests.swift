@testable import BagbutikDocsCollector
import BagbutikSpecDecoder
import XCTest

class DocsLoaderTests: XCTestCase {
    let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")

    func testLoadDocs() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        // When
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // Then
        XCTAssertEqual(docsLoader.operationDocumentationById, [Self.operationDocumentation.id: Self.operationDocumentation])
        XCTAssertEqual(docsLoader.identifierBySchemaName, ["User": "doc://com.apple.documentation/documentation/appstoreconnectapi/user"])
        XCTAssertEqual(docsLoader.schemaDocumentationById, [Self.schemaDocumentation.id: Documentation.object(Self.schemaDocumentation)])
    }

    func testLoadDocs_ErrorLoading() throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        XCTAssertThrowsError(try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)) {
            // Then
            let nsError = $0 as NSError
            #if os(Linux)
                XCTAssertEqual(nsError.domain, "NSPOSIXErrorDomain")
                XCTAssertEqual(nsError.code, 2)
            #else
                XCTAssertEqual(nsError.domain, "NSCocoaErrorDomain")
                XCTAssertEqual(nsError.code, 260)
            #endif
        }
    }

    func testLoadDocsMalformedOperation() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { url in
            let jsonEncoder = JSONEncoder()
            if url.lastPathComponent == DocsFilename.schemaMapping.filename {
                return try jsonEncoder.encode(["User": "doc://com.apple.documentation/documentation/appstoreconnectapi/user"])
            } else {
                return try jsonEncoder.encode([Self.schemaDocumentation.id: Documentation.object(Self.schemaDocumentation)])
            }
        })
        // When
        XCTAssertThrowsError(try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.wrongTypeOfDocumentation)
        }
    }

    func testApplyManualDocumentation_UniversalNonExisting() throws {
        // Given
        let docsLoader = DocsLoader(identifierBySchemaName: [
            "BundleIdPlatform": "some-id"
        ], schemaDocumentationById: [
            "some-id": .enum(.init(id: "some-id", title: "BundleIdPlatform", cases: [
                "IOS": "A string that represents iOS.",
                "MACOS": "A string that represents macOS."
            ]))
        ])
        // When
        try docsLoader.applyManualDocumentation()
        // Then
        if case .enum(let documentation) = docsLoader.schemaDocumentationById?["some-id"] {
            XCTAssertEqual(documentation.cases.count, 3)
            XCTAssertEqual(Array(documentation.cases.keys).sorted(), ["IOS", "MACOS", "UNIVERSAL"].sorted())
            XCTAssertEqual(documentation.cases["UNIVERSAL"], "A string that represents iOS and macOS.")
        }
    }

    func testApplyManualDocumentation_NotLoaded() throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        XCTAssertThrowsError(try docsLoader.applyManualDocumentation()) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testApplyManualDocumentation_UniversalEmpty() throws {
        // Given
        let docsLoader = DocsLoader(identifierBySchemaName: [
            "BundleIdPlatform": "some-id"
        ], schemaDocumentationById: [
            "some-id": .enum(.init(id: "some-id", title: "BundleIdPlatform", cases: [
                "IOS": "A string that represents iOS.",
                "MACOS": "A string that represents macOS.",
                "UNIVERSAL": ""
            ]))
        ])
        // When
        try docsLoader.applyManualDocumentation()
        // Then
        if case .enum(let documentation) = docsLoader.schemaDocumentationById?["some-id"] {
            XCTAssertEqual(documentation.cases["UNIVERSAL"], "A string that represents iOS and macOS.")
        }
    }

    func testResolvePackageName() throws {
        // Given
        let documentation = Documentation.object(.init(
            id: "doc://com.apple.documentation/documentation/appstoreconnectapi/build",
            hierarchy: .init(paths: [
                [
                    "doc://com.apple.documentation/documentation/technologies",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi/app_store/builds"
                ],
                [
                    "doc://com.apple.documentation/documentation/technologies",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi/app_store",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi/app_store/builds"
                ]
            ]),
            title: "Build"
        ))
        // When
        let packageName = try DocsLoader.resolvePackageName(for: documentation)
        // Then
        XCTAssertEqual(packageName, .testFlight)
    }

    func testResolvePackageNameCoreFallback() throws {
        // Given
        let documentation = Documentation.object(.init(
            id: "doc://com.apple.documentation/documentation/appstoreconnectapi/errorresponse",
            hierarchy: .init(paths: [
                [
                    "doc://com.apple.documentation/documentation/technologies",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi"
                ]
            ]),
            title: "ErrorResponse"
        ))
        // When
        let packageName = try DocsLoader.resolvePackageName(for: documentation)
        // Then
        XCTAssertEqual(packageName, .core)
    }

    func testResolvePackageNameUnknown() throws {
        // Given
        let documentation = Documentation.object(.init(
            id: "doc://com.apple.documentation/documentation/appstoreconnectapi/bob",
            hierarchy: .init(paths: [
                [
                    "doc://com.apple.documentation/documentation/technologies",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi",
                    "doc://com.apple.documentation/documentation/appstoreconnectapi/some_unknown_section"
                ]
            ]),
            title: "Bob"
        ))
        // When
        XCTAssertThrowsError(try DocsLoader.resolvePackageName(for: documentation)) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.couldNotResolvePackageName(id: documentation.id, paths: documentation.hierarchy.paths))
        }
    }

    func testResolveDocumentationForSchemaNamed() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForSchema(named: "User")
        // Then
        XCTAssertEqual(documentation, Documentation.object(Self.schemaDocumentation))
    }

    func testResolveDocumentationForSchemaNamed_NotLoaded() throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        XCTAssertThrowsError(try docsLoader.resolveDocumentationForSchema(named: "Bob")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForSchemaNamed_Unknown() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForSchema(named: "Bob")
        // Then
        XCTAssertNil(documentation)
    }

    func testResolveDocumentationForSchemaWithDocsUrl() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/appstoreconnectapi/user")
        // Then
        XCTAssertEqual(documentation, Documentation.object(Self.schemaDocumentation))
    }

    func testResolveDocumentationForSchemaWithDocsUrl_NotLoaded() throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        XCTAssertThrowsError(try docsLoader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/appstoreconnectapi/bob")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForSchemaWithDocsUrl_Unknown() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/appstoreconnectapi/bob")
        // Then
        XCTAssertNil(documentation)
    }

    func testResolveDocumentationForSchemaWithId() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForSchema(withId: "doc://com.apple.documentation/documentation/appstoreconnectapi/user")
        // Then
        XCTAssertEqual(documentation, Documentation.object(Self.schemaDocumentation))
    }

    func testResolveDocumentationForSchemaWithId_NotLoaded() throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        XCTAssertThrowsError(try docsLoader.resolveDocumentationForSchema(withId: "doc://com.apple.documentation/documentation/appstoreconnectapi/bob")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForSchemaWithId_Unknown() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForSchema(withId: "doc://com.apple.documentation/documentation/appstoreconnectapi/bob")
        // Then
        XCTAssertNil(documentation)
    }

    func testResolveDocumentationForOperationWithId() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForOperation(withId: "users-get_instance")
        // Then
        XCTAssertEqual(documentation, Self.operationDocumentation)
    }

    func testResolveDocumentationForOperationWithId_NotLoaded() throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        XCTAssertThrowsError(try docsLoader.resolveDocumentationForOperation(withId: "bobs-get_instance")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForOperationWithId_Unknown() throws {
        // Given
        let docsLoader = DocsLoader(loadFile: loadFile)
        try docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try docsLoader.resolveDocumentationForOperation(withId: "bobs-get_instance")
        // Then
        XCTAssertNil(documentation)
    }

    func testCreateUrlForOperation() {
        // Given
        let docsLoader = DocsLoader()
        // When
        let urlForOperation = docsLoader.createUrlForOperation(withId: "users-get_instance")
        // Then
        XCTAssertEqual(urlForOperation, "https://developer.apple.com/documentation/appstoreconnectapi/read_user_information")
    }

    static let operationDocumentation = OperationDocumentation(
        id: "users-get_instance",
        title: "Read User Information",
        abstract: "Get information about a user on your team, such as name, roles, and app visibility.",
        pathParameters: ["id": "An opaque resource ID that uniquely identifies the resource."],
        queryParameters: [
            "fields[apps]": "Fields to return for included related types.",
            "fields[users]": "Fields to return for included related types.",
            "include": "Relationship data to include in the response.",
            "limit[visibleApps]": "Number of included related resources to return.",
        ],
        responses: [
            .init(status: 200, reason: "OK"),
            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")
        ]
    )

    static let schemaDocumentation = ObjectDocumentation(
        id: "doc://com.apple.documentation/documentation/appstoreconnectapi/user",
        title: "User",
        abstract: "The data structure that represents a Users resource.",
        properties: [
            "attributes": .init(required: false, description: "The resource's attributes."),
            "id": .init(required: true, description: "The opaque resource ID that uniquely identifies the resource."),
            "links": .init(required: true, description: "Navigational links that include the self-link."),
            "relationships": .init(required: false, description: "Navigational links to related data and included resource types and IDs."),
            "type": .init(required: true, description: "The resource type.")
        ]
    )

    let loadFile: (URL) throws -> Data = { url in
        let jsonEncoder = JSONEncoder()
        if url.lastPathComponent == DocsFilename.operationDocumentation.filename {
            return try jsonEncoder.encode([operationDocumentation.id: Documentation.operation(operationDocumentation)])
        } else if url.lastPathComponent == DocsFilename.schemaMapping.filename {
            return try jsonEncoder.encode(["User": "doc://com.apple.documentation/documentation/appstoreconnectapi/user"])
        } else { // if url.lastPathComponent == DocsFilename.schemaDocumentation.filename {
            return try jsonEncoder.encode([schemaDocumentation.id: Documentation.object(schemaDocumentation)])
        }
    }
}
