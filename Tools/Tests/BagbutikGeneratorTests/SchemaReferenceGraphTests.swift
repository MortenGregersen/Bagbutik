@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class SchemaReferenceGraphTests: XCTestCase {
    func testClosureIncludesReferencesFromEverySupportedContainer() throws {
        let nested = ObjectSchema(
            name: "Nested",
            url: "",
            properties: ["value": .init(type: .schemaRef("Leaf"))]
        )
        let choice = OneOfSchema(
            options: [.schemaRef("Choice"), .objectSchema(nested)],
            discriminator: .init(propertyName: "type", mapping: ["mapped": "#/components/schemas/Mapped"])
        )
        let root = ObjectSchema(
            name: "Root",
            url: "",
            properties: [
                "array": .init(type: .arrayOfSchemaRef("ArrayItem")),
                "dictionary": .init(type: .dictionary(.schemaRef("DictionaryValue"))),
                "nested": .init(type: .schema(nested)),
                "choice": .init(type: .oneOf(name: "ChoiceValue", schema: choice)),
                "qualified": .init(type: .schemaRef("Qualified.Attributes.State")),
            ]
        )
        let names = ["Root", "ArrayItem", "DictionaryValue", "Leaf", "Choice", "Mapped", "Qualified"]
        let schemas: [String: Schema] = Dictionary(uniqueKeysWithValues: names.map { name in
            (name, name == "Root" ? Schema.object(root) : Schema.object(.init(name: name, url: "")))
        })

        let closure = SchemaReferenceGraph(schemas: schemas).closure(startingAt: ["Root"])

        XCTAssertEqual(closure, Set(names))
    }

    func testClosureIgnoresUnknownRoots() {
        let schemas: [String: Schema] = [
            "Known": .object(.init(name: "Known", url: "")),
        ]

        let closure = SchemaReferenceGraph(schemas: schemas).closure(startingAt: ["Known", "Missing"])

        XCTAssertEqual(closure, ["Known"])
    }

    func testClosureUsesGeneratedNamesWhenComponentKeysDiffer() {
        let schemas: [String: Schema] = [
            "rootSchema": .object(.init(name: "RootSchema", url: "", properties: [
                "leaf": .init(type: .schemaRef("leafSchema")),
            ])),
            "leafSchema": .object(.init(name: "LeafSchema", url: "")),
        ]

        let closure = SchemaReferenceGraph(schemas: schemas).closure(startingAt: ["RootSchema"])

        XCTAssertEqual(closure, ["RootSchema", "LeafSchema"])
    }

    func testCyclesBecomeOneComponentAndCollapsedGraphIsDependencyFirst() {
        let schemas: [String: Schema] = [
            "EndpointResponse": .object(.init(name: "EndpointResponse", url: "", properties: [
                "data": .init(type: .schemaRef("User"))
            ])),
            "User": .object(.init(name: "User", url: "", properties: [
                "relationships": .init(type: .schemaRef("VisibleApps"))
            ])),
            "VisibleApps": .object(.init(name: "VisibleApps", url: "", properties: [
                "owner": .init(type: .schemaRef("User")),
                "app": .init(type: .schemaRef("App")),
            ])),
            "App": .object(.init(name: "App", url: "")),
        ]
        let graph = SchemaReferenceGraph(schemas: schemas)

        let components = graph.stronglyConnectedComponents()
        XCTAssertTrue(components.contains(.init(schemas: ["User", "VisibleApps"])))

        let ordered = graph.topologicallySortedComponents()
        let appIndex = ordered.firstIndex(of: .init(schemas: ["App"]))!
        let cycleIndex = ordered.firstIndex(of: .init(schemas: ["User", "VisibleApps"]))!
        let responseIndex = ordered.firstIndex(of: .init(schemas: ["EndpointResponse"]))!
        XCTAssertLessThan(appIndex, cycleIndex)
        XCTAssertLessThan(cycleIndex, responseIndex)
    }
}
