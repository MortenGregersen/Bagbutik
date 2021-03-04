import Foundation

public extension Schema {
    enum Documentation {
        case object(summary: String, properties: [String: String]? = nil, children: [Documentation]? = nil)
        case subObject(name: String, summary: String, properties: [String: String]? = nil, children: [Documentation]? = nil)
        case attributes(summary: String, properties: [String: String]? = nil)
        case relationships

        public var summary: String {
            switch self {
            case .object(let summary, _, _):
                return summary
            case .subObject(_, let summary, _, _):
                return summary
            case .attributes(let summary, _):
                return summary
            case .relationships:
                return "The relationships you included in the request and those on which you can operate."
            }
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

        static let allDocumentation: [String: Documentation] = [
            "App": .object(
                summary: "The data structure that represents an Apps resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe an Apps resource.",
                        properties: [
                            "bundleId": "The bundle ID for your app. This ID must match the one you use in Xcode. The bundle ID cannot be changed after you upload your first build.",
                            "name": "The name of your app as it will appear in the App Store. The maximum length is 30 characters.",
                            "primaryLocale": "The primary locale for your app. If localized app information isn’t available in an App Store territory, the information from your primary language is used instead.",
                            "sku": "A unique ID for your app that is not visible on the App Store.",
                            "availableInNewTerritories": "",
                            "contentRightsDeclaration": "Possible values: DOES_NOT_USE_THIRD_PARTY_CONTENT, USES_THIRD_PARTY_CONTENT",
                            "isOrEverWasMadeForKids": "",
                        ]),
                ]),
            "AppBetaTestersLinkagesRequest": .object(summary: "A request body you use to remove beta testers from an app."),
            "AppResponse": .object(summary: "A response that contains a single Apps resource."),
            "AppsResponse": .object(summary: "A response that contains a list of Apps resources."),
            "AppUpdateRequest": .object(
                summary: "The data element of the request body.",
                children: [
                    .attributes(
                        summary: "Attributes whose values you're changing as part of the update request.",
                        properties: [
                            "availableInNewTerritories": "",
                            "bundleId": "",
                            "contentRightsDeclaration": "Possible values: DOES_NOT_USE_THIRD_PARTY_CONTENT, USES_THIRD_PARTY_CONTENT",
                            "primaryLocale": "",
                        ]),
                ]),
            "InAppPurchase": .object(
                summary: "The data structure that represents the In-App Purchases resource.",
                children: [
                    .attributes(
                        summary: "",
                        properties: [
                            "inAppPurchaseType": "Possible values: AUTOMATICALLY_RENEWABLE_SUBSCRIPTION, NON_CONSUMABLE, CONSUMABLE, NON_RENEWING_SUBSCRIPTION, FREE_SUBSCRIPTION",
                            "productId": "",
                            "referenceName": "",
                            "state": "Possible values: CREATED, DEVELOPER_SIGNED_OFF, DEVELOPER_ACTION_NEEDED, DELETION_IN_PROGRESS, APPROVED, DELETED, REMOVED_FROM_SALE, DEVELOPER_REMOVED_FROM_SALE, WAITING_FOR_UPLOAD, PROCESSING_CONTENT, REPLACED, REJECTED, WAITING_FOR_SCREENSHOT, PREPARE_FOR_SUBMISSION, MISSING_METADATA, READY_TO_SUBMIT, WAITING_FOR_REVIEW, IN_REVIEW, PENDING_DEVELOPER_RELEASE",
                        ]),
                ]),
            "InAppPurchaseResponse": .object(summary: "A response that contains a single In-App Purchases resource."),
            "InAppPurchasesResponse": .object(summary: "A response that contains a list of In-App Purchase resources."),
            "Platform": .object(summary: "Strings that represent Apple operating systems."),
            "User": .object(
                summary: "The data structure that represents a Users resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe a Users resource.",
                        properties: [
                            "firstName": "The user's first name.",
                            "lastName": "The user's last name.",
                            "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                            "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                            "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                            "username": "The user's Apple ID.",
                        ]),
                ]),
        ]
    }
}
