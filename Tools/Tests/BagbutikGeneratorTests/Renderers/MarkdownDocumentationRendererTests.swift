@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class MarkdownDocumentationRendererTests: XCTestCase {
    func testObjectRendererUsesPageSummaryWithoutPropertyDocumentation() async throws {
        let loader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(.init(id: "/person", title: "Person", content: "# Person\n\nA person."))
        ])
        let renderer = ObjectSchemaRenderer(docsLoader: loader, shouldFormat: true)
        let schema = ObjectSchema(
            name: "Person",
            url: "some://url",
            properties: ["name": .init(type: .simple(.string()))]
        )

        let rendered = try await renderer.render(objectSchema: schema, otherSchemas: [:])

        XCTAssertTrue(rendered.contains("# Person"))
        XCTAssertTrue(rendered.contains("A person."))
        XCTAssertTrue(rendered.contains("public var name: String?"))
        XCTAssertFalse(rendered.contains("///"))
    }

    func testEnumRendererUsesPageSummaryWithoutCaseDocumentation() async throws {
        let loader = DocsLoader(schemaDocumentationById: [
            "some://url": .enum(.init(id: "/platform", title: "Platform", content: "# Platform\n\nA platform."))
        ])
        let renderer = EnumSchemaRenderer(docsLoader: loader, shouldFormat: true)
        let schema = EnumSchema(name: "Platform", type: "string", url: "some://url", caseValues: ["IOS"])

        let rendered = try await renderer.render(enumSchema: schema)

        XCTAssertTrue(rendered.contains("# Platform"))
        XCTAssertTrue(rendered.contains("A platform."))
        XCTAssertTrue(rendered.contains("case iOS = \"IOS\""))
        XCTAssertFalse(rendered.contains("///"))
    }
}
