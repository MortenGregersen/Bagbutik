@testable import BagbutikDocsCollector
@testable import BagbutikSpecDecoder
import XCTest

class DocumentationTests: XCTestCase {
    let enumDocumentation = EnumDocumentation(id: "enum-id", hierarchy: .init(paths: []), title: "MyEnum", abstract: "An awesome enum", discussion: "I rest my case", cases: ["one": "First", "two": "Second"])
    let typealiasDocumentation = TypealiasDocumentation(id: "typealias-id", hierarchy: .init(paths: []), title: "MyTypealias", abstract: "An awesome typealias", discussion: "You are my type", values: ["one": "", "two": ""])
    let objectDocumentation = ObjectDocumentation(id: "object-id", title: "MyObject", abstract: "An awesome object", discussion: "Objection!", properties: ["name": .init(required: true, description: "An awesome name"), "type": .init(required: false, description: nil)], subDocumentationIds: ["other-object-id"])
    let operationDocumentation = OperationDocumentation(id: "operation-id", title: "MyOperation", abstract: "An awesome operation", discussion: "Make him better or get the buzzer!", pathParameters: ["id": "An unique identifier"], queryParameters: ["fields": "The fields to fetch"], body: "The updated properties", responses: [.init(status: 200, reason: "OK"), .init(status: 400, reason: "Bad Request", description: "Something is wrong")])

    func testId() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).id, enumDocumentation.id)
        XCTAssertEqual(Documentation.typealias(typealiasDocumentation).id, typealiasDocumentation.id)
        XCTAssertEqual(Documentation.object(objectDocumentation).id, objectDocumentation.id)
        XCTAssertEqual(Documentation.operation(operationDocumentation).id, operationDocumentation.id)
    }
    
    func testTitle() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).title, enumDocumentation.title)
        XCTAssertEqual(Documentation.typealias(typealiasDocumentation).title, typealiasDocumentation.title)
        XCTAssertEqual(Documentation.object(objectDocumentation).title, objectDocumentation.title)
        XCTAssertEqual(Documentation.operation(operationDocumentation).title, operationDocumentation.title)
    }
    
    func testAbstract() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).abstract, enumDocumentation.abstract)
        XCTAssertEqual(Documentation.typealias(typealiasDocumentation).abstract, typealiasDocumentation.abstract)
        XCTAssertEqual(Documentation.object(objectDocumentation).abstract, objectDocumentation.abstract)
        XCTAssertEqual(Documentation.operation(operationDocumentation).abstract, operationDocumentation.abstract)
    }
    
    func testDiscussion() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).discussion, enumDocumentation.discussion)
        XCTAssertEqual(Documentation.typealias(typealiasDocumentation).discussion, typealiasDocumentation.discussion)
        XCTAssertEqual(Documentation.object(objectDocumentation).discussion, objectDocumentation.discussion)
        XCTAssertEqual(Documentation.operation(operationDocumentation).discussion, operationDocumentation.discussion)
    }
    
    func testSubDocumentationIds() {
        XCTAssertEqual(Documentation.enum(enumDocumentation).subDocumentationIds, [])
        XCTAssertEqual(Documentation.typealias(typealiasDocumentation).subDocumentationIds, [])
        XCTAssertEqual(Documentation.object(objectDocumentation).subDocumentationIds, objectDocumentation.subDocumentationIds)
        XCTAssertEqual(Documentation.operation(operationDocumentation).subDocumentationIds, [])
    }

    func testDecodeStrongInlineContent() throws {
        let data = """
        {
            "type": "strong",
            "inlineContent": [
                {
                    "type": "text",
                    "text": "Important"
                }
            ]
        }
        """.data(using: .utf8)!

        let inlineContent = try JSONDecoder().decode(Documentation.Content.InlineContent.self, from: data)

        guard case .text(let text) = inlineContent else {
            return XCTFail("Expected text")
        }

        XCTAssertEqual(text, "**Important**")
    }

    func testDecodeEnumDocumentationFormatsReferences() throws {
        let data = """
        {
            "identifier": {
                "url": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/platform"
            },
            "hierarchy": {
                "paths": [[]]
            },
            "metadata": {
                "title": "Platform",
                "symbolKind": "tdef"
            },
            "abstract": [
                {
                    "type": "text",
                    "text": "An enum."
                }
            ],
            "references": {
                "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/related-article": {
                    "title": "Related Article",
                    "role": "article",
                    "url": "/documentation/appstoreconnectapi/related-article"
                },
                "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user": {
                    "title": "User.profile",
                    "role": "dictionarySymbol",
                    "url": "/documentation/appstoreconnectapi/user"
                }
            },
            "primaryContentSections": [
                {
                    "kind": "possibleValues",
                    "values": [
                        {
                            "name": "IOS",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "reference",
                                            "identifier": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user"
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "name": "MAC_OS",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "reference",
                                            "identifier": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/related-article"
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "kind": "content",
                    "content": [
                        {
                            "type": "heading",
                            "inlineContent": [
                                {
                                    "type": "text",
                                    "text": "Ignored"
                                }
                            ]
                        },
                        {
                            "type": "paragraph",
                            "inlineContent": [
                                {
                                    "type": "text",
                                    "text": "Discussion"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)!

        let documentation = try JSONDecoder().decode(Documentation.self, from: data)

        guard case .enum(let enumDocumentation) = documentation else {
            return XCTFail("Expected enum documentation")
        }

        XCTAssertEqual(enumDocumentation.abstract, "An enum.")
        XCTAssertEqual(enumDocumentation.discussion, "Discussion")
        XCTAssertEqual(enumDocumentation.cases["IOS"], "``User/profile``")
        XCTAssertEqual(enumDocumentation.cases["MAC_OS"], "[Related Article](https://developer.apple.com/documentation/appstoreconnectapi/related-article)")
    }

    func testDecodeObjectDocumentationCollectsSubDocumentationIds() throws {
        let data = """
        {
            "identifier": {
                "url": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user"
            },
            "hierarchy": {
                "paths": [[]]
            },
            "metadata": {
                "title": "User",
                "symbolKind": "dictionary"
            },
            "primaryContentSections": [
                {
                    "kind": "properties",
                    "items": [
                        {
                            "name": "name",
                            "type": [
                                {
                                    "kind": "text",
                                    "text": "String"
                                }
                            ],
                            "required": true,
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "text",
                                            "text": "The name."
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "name": "profile",
                            "type": [
                                {
                                    "kind": "typeIdentifier",
                                    "identifier": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/userprofile",
                                    "text": "UserProfile"
                                }
                            ],
                            "required": false,
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "text",
                                            "text": "The profile."
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)!

        let documentation = try JSONDecoder().decode(Documentation.self, from: data)

        guard case .object(let objectDocumentation) = documentation else {
            return XCTFail("Expected object documentation")
        }

        XCTAssertEqual(objectDocumentation.properties["name"], .init(required: true, description: "The name."))
        XCTAssertEqual(objectDocumentation.properties["profile"], .init(required: false, description: "The profile."))
        XCTAssertEqual(objectDocumentation.subDocumentationIds, ["doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/userprofile"])
    }

    func testDecodeOperationDocumentation() throws {
        let data = """
        {
            "identifier": {
                "url": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/get-v1-users"
            },
            "hierarchy": {
                "paths": [[]]
            },
            "metadata": {
                "title": "List Users",
                "symbolKind": "operation"
            },
            "primaryContentSections": [
                {
                    "kind": "restParameters",
                    "source": "path",
                    "items": [
                        {
                            "name": "id",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "text",
                                            "text": "The id."
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "kind": "restParameters",
                    "source": "query",
                    "items": [
                        {
                            "name": "limit",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "text",
                                            "text": "The limit."
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "kind": "restBody",
                    "content": [
                        {
                            "type": "paragraph",
                            "inlineContent": [
                                {
                                    "type": "text",
                                    "text": "The body."
                                }
                            ]
                        }
                    ]
                },
                {
                    "kind": "restResponses",
                    "items": [
                        {
                            "status": 200,
                            "reason": "OK",
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "text",
                                            "text": "Success."
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)!

        let documentation = try JSONDecoder().decode(Documentation.self, from: data)

        guard case .operation(let operationDocumentation) = documentation else {
            return XCTFail("Expected operation documentation")
        }

        XCTAssertEqual(operationDocumentation.pathParameters["id"], "The id.")
        XCTAssertEqual(operationDocumentation.queryParameters["limit"], "The limit.")
        XCTAssertEqual(operationDocumentation.body, "The body.")
        XCTAssertEqual(operationDocumentation.responses, [.init(status: 200, reason: "OK", description: "Success.")])
    }

    func testEncodeAndDecodeRoundTrip() throws {
        let documentation = Documentation.operation(operationDocumentation)

        let data = try JSONEncoder().encode(documentation)
        let decodedDocumentation = try JSONDecoder().decode(Documentation.self, from: data)

        guard case .operation(let decodedOperationDocumentation) = decodedDocumentation else {
            return XCTFail("Expected operation documentation")
        }

        XCTAssertEqual(decodedOperationDocumentation.id, operationDocumentation.id)
        XCTAssertEqual(decodedOperationDocumentation.title, operationDocumentation.title)
        XCTAssertEqual(decodedOperationDocumentation.abstract, operationDocumentation.abstract)
        XCTAssertEqual(decodedOperationDocumentation.discussion, operationDocumentation.discussion)
        XCTAssertEqual(decodedOperationDocumentation.pathParameters, operationDocumentation.pathParameters)
        XCTAssertEqual(decodedOperationDocumentation.queryParameters, operationDocumentation.queryParameters)
        XCTAssertEqual(decodedOperationDocumentation.body, operationDocumentation.body)
        XCTAssertEqual(decodedOperationDocumentation.responses, [
            .init(status: 200, reason: "OK", description: ""),
            .init(status: 400, reason: "Bad Request", description: "Something is wrong")
        ])
    }
}
