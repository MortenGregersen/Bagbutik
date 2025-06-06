@testable import BagbutikDocsCollector
import BagbutikSpecDecoder
import XCTest

class DocsLoaderTests: XCTestCase {
    let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")

    func testLoadDocs() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0) })
        // When
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // Then
        let operationDocumentationById = await docsLoader.operationDocumentationById
        let identifierBySchemaName = await docsLoader.identifierBySchemaName
        let schemaDocumentationById = await docsLoader.schemaDocumentationById
        XCTAssertEqual(operationDocumentationById, [Self.operationDocumentation.id: Self.operationDocumentation])
        XCTAssertEqual(identifierBySchemaName, ["User": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user"])
        XCTAssertEqual(schemaDocumentationById, [Self.schemaDocumentation.id.lowercased(): Documentation.object(Self.schemaDocumentation)])
    }

    func testLoadDocs_ErrorLoading() async throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)) {
            // Then
            let nsError = $0 as NSError
            #if (os(Linux) || os(Android) || os(Windows) || os(WASI)) && compiler(<6.0)
                XCTAssertEqual(nsError.domain, "NSPOSIXErrorDomain")
                XCTAssertEqual(nsError.code, 2)
            #else
                XCTAssertEqual(nsError.domain, "NSCocoaErrorDomain")
                XCTAssertEqual(nsError.code, 260)
            #endif
        }
    }

    func testLoadDocsMalformedOperation() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { url in
            let jsonEncoder = JSONEncoder()
            if url.lastPathComponent == DocsFilename.schemaMapping.filename {
                return try jsonEncoder.encode(["User": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user"])
            } else {
                return try jsonEncoder.encode([Self.schemaDocumentation.id: Documentation.object(Self.schemaDocumentation)])
            }
        })
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.wrongTypeOfDocumentation)
        }
    }

    func testApplyManualDocumentation_ServicesAndUniversalNonExisting() async throws {
        // Given
        let docsLoader = DocsLoader(identifierBySchemaName: [
            "BundleIdPlatform": "some-id"
        ], schemaDocumentationById: [
            "some-id": .enum(.init(id: "some-id", hierarchy: .init(paths: []), title: "BundleIdPlatform", cases: [
                "IOS": "A string that represents iOS.",
                "MACOS": "A string that represents macOS."
            ]))
        ])
        // When
        try await docsLoader.applyManualDocumentation()
        // Then
        if case .enum(let documentation) = await docsLoader.schemaDocumentationById?["some-id"] {
            XCTAssertEqual(documentation.cases.count, 4)
            XCTAssertEqual(Array(documentation.cases.keys).sorted(), ["IOS", "MACOS", "SERVICES", "UNIVERSAL"].sorted())
            XCTAssertEqual(documentation.cases["SERVICES"], "A string that represents a service.")
            XCTAssertEqual(documentation.cases["UNIVERSAL"], "A string that represents iOS and macOS.")
        }
    }

    func testApplyManualDocumentation_NotLoaded() async throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.applyManualDocumentation()) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testApplyManualDocumentation_ServicesAndUniversalEmpty() async throws {
        // Given
        let docsLoader = DocsLoader(identifierBySchemaName: [
            "BundleIdPlatform": "some-id"
        ], schemaDocumentationById: [
            "some-id": .enum(.init(id: "some-id", hierarchy: .init(paths: []), title: "BundleIdPlatform", cases: [
                "IOS": "A string that represents iOS.",
                "MACOS": "A string that represents macOS.",
                "SERVICES": "",
                "UNIVERSAL": ""
            ]))
        ])
        // When
        try await docsLoader.applyManualDocumentation()
        // Then
        if case .enum(let documentation) = await docsLoader.schemaDocumentationById?["some-id"] {
            XCTAssertEqual(documentation.cases["SERVICES"], "A string that represents a service.")
            XCTAssertEqual(documentation.cases["UNIVERSAL"], "A string that represents iOS and macOS.")
        }
    }

    func testResolvePackageName() throws {
        // Given
        let documentation = Documentation.object(.init(
            id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/AppSomething",
            title: "App"
        ))
        // When
        let packageName = try DocsLoader.resolvePackageName(for: documentation)
        // Then
        XCTAssertEqual(packageName, .appStore)
    }

    func testResolvePackageNameCoreFallback() throws {
        // Given
        let documentation = Documentation.object(.init(
            id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/errorresponse",
            title: "ErrorResponse"
        ))
        // When
        let packageName = try DocsLoader.resolvePackageName(for: documentation)
        // Then
        XCTAssertEqual(packageName, .core)
    }

    func testResolveDocumentationForSchemaNamed() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0) })
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForSchema(named: "User")
        // Then
        XCTAssertEqual(documentation, Documentation.object(Self.schemaDocumentation))
    }

    func testResolveDocumentationForSchemaNamed_NotLoaded() async throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.resolveDocumentationForSchema(named: "Bob")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForSchemaNamed_Unknown() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForSchema(named: "Bob")
        // Then
        XCTAssertNil(documentation)
    }

    func testResolveDocumentationForSchemaWithDocsUrl() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForSchema(withDocsUrl: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user".lowercased())
        // Then
        XCTAssertEqual(documentation, Documentation.object(Self.schemaDocumentation))
    }

    func testResolveDocumentationForSchemaWithDocsUrl_NotLoaded() async throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/appstoreconnectapi/bob")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForSchemaWithDocsUrl_Unknown() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/appstoreconnectapi/bob")
        // Then
        XCTAssertNil(documentation)
    }

    func testResolveDocumentationForSchemaWithId() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForSchema(withId: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user".lowercased())
        // Then
        XCTAssertEqual(documentation, Documentation.object(Self.schemaDocumentation))
    }

    func testResolveDocumentationForSchemaWithId_NotLoaded() async throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.resolveDocumentationForSchema(withId: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/bob")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForSchemaWithId_Unknown() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForSchema(withId: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/bob")
        // Then
        XCTAssertNil(documentation)
    }

    func testResolveDocumentationForOperationWithId() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForOperation(withId: "users-get_instance")
        // Then
        XCTAssertEqual(documentation, Self.operationDocumentation)
    }

    func testResolveDocumentationForOperationWithId_NotLoaded() async throws {
        // Given
        let docsLoader = DocsLoader()
        // When
        await XCTAssertAsyncThrowsError(try await docsLoader.resolveDocumentationForOperation(withId: "bobs-get_instance")) {
            // Then
            XCTAssertEqual($0 as? DocsLoaderError, DocsLoaderError.documentationNotLoaded)
        }
    }

    func testResolveDocumentationForOperationWithId_Unknown() async throws {
        // Given
        let docsLoader = DocsLoader(loadFile: { try Self.loadFile($0)} )
        try await docsLoader.loadDocs(documentationDirURL: validDocumentationDirURL)
        // When
        let documentation = try await docsLoader.resolveDocumentationForOperation(withId: "bobs-get_instance")
        // Then
        XCTAssertNil(documentation)
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
            .init(status: 200, reason: "OK", description: ""),
            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")
        ]
    )

    static let schemaDocumentation = ObjectDocumentation(
        id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user",
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

    @MainActor static let loadFile: (URL) throws -> Data = { [operationDocumentation, schemaDocumentation] url in
        let jsonEncoder = JSONEncoder()
        if url.lastPathComponent == DocsFilename.operationDocumentation.filename {
            return try jsonEncoder.encode([operationDocumentation.id: Documentation.operation(operationDocumentation)])
        } else if url.lastPathComponent == DocsFilename.schemaMapping.filename {
            return try jsonEncoder.encode(["User": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user"])
        } else { // if url.lastPathComponent == DocsFilename.schemaDocumentation.filename {
            return try jsonEncoder.encode([schemaDocumentation.id: Documentation.object(schemaDocumentation)])
        }
    }
}
