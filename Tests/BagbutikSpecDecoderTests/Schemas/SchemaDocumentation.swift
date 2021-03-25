@testable import BagbutikSpecDecoder
import XCTest

final class SchemaDocumentationTests: XCTestCase {
    static let rootSchemaProperties = ["rootProperty": "Root property"]
    static let attributesProperties = ["attributesProperty": "Attributes property"]
    static let enumCases = ["OPTION_ONE": "Option 1", "OPTION_TWO": "Option 2"]
    let documentations: [(documentation: Schema.Documentation, summary: String?, properties: [String: String]?)] = [
        (Schema.Documentation.rootSchema(summary: "Root schema summary", discussion: "Root schema discussion", properties: rootSchemaProperties), "Root schema summary", rootSchemaProperties),
        (Schema.Documentation.attributes(.init(summary: "Attributes summary", properties: attributesProperties)), "Attributes summary", attributesProperties),
        (Schema.Documentation.relationships, "The relationships you included in the request and those on which you can operate.", nil),
        (Schema.Documentation.relationship, "The data and links that describe the relationship between the resources.", Schema.Documentation.relationshipProperties),
        (Schema.Documentation.relationshipData, "The type and ID of a related resource.", nil),
        (Schema.Documentation.relationshipLinks, "The links to the related data and the relationship's self-link.", Schema.Documentation.relationshipProperties),
        (Schema.Documentation.createRequest(summary: "Create request summary"), "Create request summary", nil),
        (Schema.Documentation.createRequestData, "The data element of the request body.", Schema.Documentation.createRequestProperties),
        (Schema.Documentation.createRequestDataAttributes(.init(properties: attributesProperties)), "Attributes that you set that describe the new resource.", attributesProperties),
        (Schema.Documentation.createRequestDataRelationships, "The relationships to other resources that you can set with this request.", nil),
        (Schema.Documentation.createRequestDataRelationship, nil, Schema.Documentation.createRequestDataRelationshipProperties),
        (Schema.Documentation.createRequestDataRelationshipData, "The type and ID of the resource that you're relating with the resource you're creating.", nil),
        (Schema.Documentation.updateRequest(summary: "Update request summary"), "Update request summary", nil),
        (Schema.Documentation.updateRequestData, "The data element of the request body.", Schema.Documentation.updateRequestProperties),
        (Schema.Documentation.updateRequestDataAttributes(.init(properties: attributesProperties)), "Attributes whose values you're changing as part of the update request.", attributesProperties),
        (Schema.Documentation.updateRequestDataRelationships, "The data and links that describe the relationship between the resources.", nil),
        (Schema.Documentation.updateRequestDataRelationship, nil, Schema.Documentation.updateRequestDataRelationshipProperties),
        (Schema.Documentation.updateRequestDataRelationshipData, "The type and ID of a resource that you're relating with the resource you're updating.", nil),
        (Schema.Documentation.linkagesRequest(summary: "Linkages request summary"), "Linkages request summary", Schema.Documentation.linkagesRequestProperties),
        (Schema.Documentation.linkagesRequestData, "The data element of the request body.", nil),
        (Schema.Documentation.linkagesResponse, "A response body that contains a list of related resource IDs.", nil),
        (Schema.Documentation.linkagesResponseData, "The data element of the response body.", nil),
        (Schema.Documentation.enumObject(summary: "Enum summary", cases: enumCases), "Enum summary", enumCases),
    ]

    func testSummary() {
        documentations.forEach { documentation, expectedSummary, _ in
            XCTAssertEqual(documentation.summary, expectedSummary)
        }
    }

    func testDiscussion() {
        documentations.forEach { documentation, _, _ in
            if case .rootSchema(_, let discussion, _, _) = documentation {
                XCTAssertEqual(documentation.discussion, discussion)
            } else {
                XCTAssertNil(documentation.discussion)
            }
        }
    }

    func testProperties() {
        documentations.forEach { documentation, _, properties in
            let expectedProperties: [String: String]
            if case .enumObject(_, let cases) = documentation {
                expectedProperties = cases
            } else {
                expectedProperties = Schema.Documentation.propertiesMergedWithCommonProperties(properties)
            }
            XCTAssertEqual(documentation.properties, expectedProperties)
        }
    }
}
