import Foundation

public protocol SchemaDocumentation {
    var summary: String { get }
    var properties: [String: String]? { get }
}

public extension Schema {
    struct AttributesDocumentation: SchemaDocumentation {
        public let summary: String
        public let properties: [String: String]?
    }

    struct RelationshipDocumentation: SchemaDocumentation {
        public let summary = "The relationships you included in the request and those on which you can operate."
        public let properties: [String: String]? = nil
    }

    struct ObjectDocumentation: SchemaDocumentation {
        public let summary: String
        public let properties: [String: String]?
        public let attributes: AttributesDocumentation?

        public init(summary: String, properties: [String: String]? = nil, attributes: AttributesDocumentation? = nil) {
            self.summary = summary
            self.properties = properties
            self.attributes = attributes
        }

        public static let commonPropertyDocumentation: [String: String] = [
            "data": "The resource data.",
            "id": "The opaque resource ID that uniquely identifies the resource.",
            "links": "Navigational links that include the self-link.",
            "type": "The resource type.",
            "meta": "Paging information.",
        ]

        public static let relationshipsPropetyDocumentation: [String: String] = [
            "data": "The type and ID of a related resource.",
            "links": "The links to the related data and the relationship's self-link.",
            "meta": "Paging information for data responses.",
            "related": "The link to the related data.",
            "self": "The relationship's self-link",
        ]

        public static let requestPropertyDocumentation: [String: String] = [
            "data": "The types and IDs of related resources.",
        ]

        static let allDocumentation: [String: ObjectDocumentation] = [
            "App": .init(summary: "The data structure that represents an Apps resource.",
                         attributes: .init(summary: "Attributes that describe an Apps resource.",
                                           properties: [
                                               "bundleId": "The bundle ID for your app. This ID must match the one you use in Xcode. The bundle ID cannot be changed after you upload your first build.",
                                               "name": "The name of your app as it will appear in the App Store. The maximum length is 30 characters.",
                                               "primaryLocale": "The primary locale for your app. If localized app information isn’t available in an App Store territory, the information from your primary language is used instead.",
                                               "sku": "A unique ID for your app that is not visible on the App Store.",
                                               "availableInNewTerritories": "",
                                               "contentRightsDeclaration": "Possible values: DOES_NOT_USE_THIRD_PARTY_CONTENT, USES_THIRD_PARTY_CONTENT",
                                               "isOrEverWasMadeForKids": "",
                                           ])),
            "AppBetaTestersLinkagesRequest": .init(summary: "A request body you use to remove beta testers from an app.",
                                                   properties: ["data": "The types and IDs of related resources."]),
            "AppResponse": .init(summary: "A response that contains a single Apps resource."),
            "AppsResponse": .init(summary: "A response that contains a list of Apps resources."),
            "AppUpdateRequest": .init(summary: "The data element of the request body.",
                                      attributes: .init(summary: "Attributes whose values you're changing as part of the update request.",
                                                        properties: [
                                                            "availableInNewTerritories": "",
                                                            "bundleId": "",
                                                            "contentRightsDeclaration": "Possible values: DOES_NOT_USE_THIRD_PARTY_CONTENT, USES_THIRD_PARTY_CONTENT",
                                                            "primaryLocale": "",
                                                        ])),
            "InAppPurchase": .init(summary: "The data structure that represents the In-App Purchases resource.",
                                   attributes: .init(summary: "",
                                                     properties: [
                                                         "inAppPurchaseType": "Possible values: AUTOMATICALLY_RENEWABLE_SUBSCRIPTION, NON_CONSUMABLE, CONSUMABLE, NON_RENEWING_SUBSCRIPTION, FREE_SUBSCRIPTION",
                                                         "productId": "",
                                                         "referenceName": "",
                                                         "state": "Possible values: CREATED, DEVELOPER_SIGNED_OFF, DEVELOPER_ACTION_NEEDED, DELETION_IN_PROGRESS, APPROVED, DELETED, REMOVED_FROM_SALE, DEVELOPER_REMOVED_FROM_SALE, WAITING_FOR_UPLOAD, PROCESSING_CONTENT, REPLACED, REJECTED, WAITING_FOR_SCREENSHOT, PREPARE_FOR_SUBMISSION, MISSING_METADATA, READY_TO_SUBMIT, WAITING_FOR_REVIEW, IN_REVIEW, PENDING_DEVELOPER_RELEASE",
                                                     ])),
            "InAppPurchaseResponse": .init(summary: "A response that contains a single In-App Purchases resource."),
            "InAppPurchasesResponse": .init(summary: "A response that contains a list of In-App Purchase resources."),
            "Platform": .init(summary: "Strings that represent Apple operating systems."),
            "User": .init(summary: "The data structure that represents a Users resource.",
                          attributes: .init(summary: "Attributes that describe a Users resource.",
                                            properties: [
                                                "firstName": "The user's first name.",
                                                "lastName": "The user's last name.",
                                                "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                                                "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                                                "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                                                "username": "The user's Apple ID.",
                                            ])),
        ]
    }
}
