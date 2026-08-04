@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class RuntimeModulePlanTests: XCTestCase {
    func testUsersClosureIsPlacedWithoutPullingInUnrelatedModels() {
        let schemas: [String: Schema] = [
            "CoreLinks": .object(.init(name: "CoreLinks", url: "")),
            "App": .object(.init(name: "App", url: "", properties: [
                "links": .init(type: .schemaRef("CoreLinks")),
                "version": .init(type: .schemaRef("SubscriptionStatusUrlVersion")),
            ])),
            "SubscriptionStatusUrlVersion": .enum(.init(name: "SubscriptionStatusUrlVersion", type: "String", caseValues: ["V1"])),
            "User": .object(.init(name: "User", url: "", properties: [
                "app": .init(type: .schemaRef("App"))
            ])),
            "UsersResponse": .object(.init(name: "UsersResponse", url: "", properties: [
                "data": .init(type: .arrayOfSchemaRef("User"))
            ])),
            "Build": .object(.init(name: "Build", url: "")),
        ]
        let packages: [String: PackageName] = [
            "CoreLinks": .core,
            "App": .appStore,
            "SubscriptionStatusUrlVersion": .appStore,
            "User": .users,
            "UsersResponse": .users,
            "Build": .appStore,
        ]

        let plan = RuntimeModulePlan(
            graph: .init(schemas: schemas),
            packageBySchema: packages,
            migratedPackages: [.users]
        )

        XCTAssertEqual(plan["CoreLinks"], .core)
        XCTAssertEqual(plan["App"], .modelsShared)
        XCTAssertEqual(plan["SubscriptionStatusUrlVersion"], .modelsShared)
        XCTAssertEqual(plan["User"], .domainModels(.users))
        XCTAssertEqual(plan["UsersResponse"], .domainModels(.users))
        XCTAssertEqual(plan["Build"], .legacyModels)
    }

    func testCrossDomainCycleIsKeptInOneSharedModule() {
        let schemas: [String: Schema] = [
            "User": .object(.init(name: "User", url: "", properties: [
                "app": .init(type: .schemaRef("App"))
            ])),
            "App": .object(.init(name: "App", url: "", properties: [
                "user": .init(type: .schemaRef("User"))
            ])),
        ]
        let packages: [String: PackageName] = ["User": .users, "App": .appStore]

        let plan = RuntimeModulePlan(
            graph: .init(schemas: schemas),
            packageBySchema: packages,
            migratedPackages: [.users]
        )

        XCTAssertEqual(plan["User"], .modelsShared)
        XCTAssertEqual(plan["App"], .modelsShared)
    }

    func testLinkageSchemaUsedByOneMigratedDomainStaysWithThatDomain() {
        let schemas: [String: Schema] = [
            "Webhook": .object(.init(name: "Webhook", url: "")),
            "WebhookDeliveriesLinkagesResponse": .object(.init(name: "WebhookDeliveriesLinkagesResponse", url: "")),
            "WebhookResponse": .object(.init(name: "WebhookResponse", url: "", properties: [
                "data": .init(type: .schemaRef("Webhook")),
            ])),
        ]
        let packages: [String: PackageName] = [
            "Webhook": .webhooks,
            "WebhookDeliveriesLinkagesResponse": .core,
            "WebhookResponse": .webhooks,
        ]

        let plan = RuntimeModulePlan(
            graph: .init(schemas: schemas),
            packageBySchema: packages,
            migratedPackages: [.users, .webhooks],
            additionalRootsByPackage: [.webhooks: ["WebhookDeliveriesLinkagesResponse"]]
        )

        XCTAssertEqual(plan["Webhook"], .domainModels(.webhooks))
        XCTAssertEqual(plan["WebhookResponse"], .domainModels(.webhooks))
        XCTAssertEqual(plan["WebhookDeliveriesLinkagesResponse"], .domainModels(.webhooks))
        XCTAssertEqual(plan.dependencies(for: .domainModels(.webhooks)), [.core, .modelsShared])
    }
}
