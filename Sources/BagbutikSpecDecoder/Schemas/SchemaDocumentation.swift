import Foundation

public extension Schema {
    enum Documentation: Equatable {
        case rootSchema(summary: String, properties: [String: String]? = nil, children: [Documentation]? = nil)
        case attributes(summary: String, properties: [String: String]? = nil)
        case relationships
        case relationship
        case relationshipData
        case relationshipLinks
        case createRequestDataAttributes(properties: [String: String]? = nil)
        case createRequestDataRelationships
        case createRequestDataRelationship
        case createRequestDataRelationshipData
        case updateRequestData
        case updateRequestDataAttributes(properties: [String: String]? = nil)
        case updateRequestDataRelationships
        case updateRequestDataRelationship
        case updateRequestDataRelationshipData
        case linkagesRequest(summary: String)
        case linkagesRequestData
        case linkagesResponse
        case linkagesResponseData
        case enumObject(summary: String, cases: [String: String])

        public var summary: String? {
            switch self {
            case .rootSchema(let summary, _, _):
                return summary
            case .attributes(let summary, _):
                return summary
            case .relationships:
                return "The relationships you included in the request and those on which you can operate."
            case .relationship:
                return "The data and links that describe the relationship between the resources."
            case .relationshipData:
                return "The type and ID of a related resource."
            case .relationshipLinks:
                return "The links to the related data and the relationship's self-link."
            case .createRequestDataAttributes:
                return "Attributes that you set that describe the new resource."
            case .createRequestDataRelationships:
                return "The relationships to other resources that you can set with this request."
            case .createRequestDataRelationship:
                return nil
            case .createRequestDataRelationshipData:
                return "The type and ID of the resource that you're relating with the resource you're creating."
            case .updateRequestData:
                return "The data element of the request body."
            case .updateRequestDataAttributes:
                return "Attributes whose values you're changing as part of the update request."
            case .updateRequestDataRelationships:
                return "The data and links that describe the relationship between the resources."
            case .updateRequestDataRelationship:
                return nil
            case .updateRequestDataRelationshipData:
                return "The type and ID of a resource that you're relating with the resource you're updating."
            case .linkagesRequest(let summary):
                return summary
            case .linkagesRequestData:
                return "The data element of the request body."
            case .linkagesResponse:
                return "A response body that contains a list of related resource IDs."
            case .linkagesResponseData:
                return "The data element of the response body."
            case .enumObject(let summary, _):
                return summary
            }
        }

        public var properties: [String: String] {
            let propertiesMergedWithCommonProperties = { (properties: [String: String]?) -> [String: String] in
                Self.commonProperties.merging(properties ?? [:], uniquingKeysWith: { $1 })
            }
            switch self {
            case .rootSchema(_, let properties, _):
                return propertiesMergedWithCommonProperties(properties)
            case .attributes(_, let properties):
                return propertiesMergedWithCommonProperties(properties)
            case .relationships,
                 .relationshipData:
                return Self.commonProperties
            case .relationship, .relationshipLinks:
                return propertiesMergedWithCommonProperties(Self.relationshipProperties)
            case .createRequestDataAttributes(let properties):
                return propertiesMergedWithCommonProperties(properties)
            case .createRequestDataRelationships,
                 .createRequestDataRelationshipData:
                return Self.commonProperties
            case .createRequestDataRelationship:
                return propertiesMergedWithCommonProperties(Self.updateRequestDataRelationshipProperties)
            case .updateRequestData:
                return propertiesMergedWithCommonProperties(Self.updateRequestProperties)
            case .updateRequestDataAttributes(let properties):
                return propertiesMergedWithCommonProperties(properties)
            case .updateRequestDataRelationships,
                 .updateRequestDataRelationshipData:
                return Self.commonProperties
            case .updateRequestDataRelationship:
                return propertiesMergedWithCommonProperties(Self.updateRequestDataRelationshipProperties)
            case .linkagesRequest:
                return propertiesMergedWithCommonProperties(Self.linkagesRequestProperties)
            case .linkagesRequestData, .linkagesResponse, .linkagesResponseData:
                return Self.commonProperties
            case .enumObject(_, let cases):
                return cases
            }
        }

        private static let commonProperties: [String: String] = [
            "attributes": "The resource's attributes.",
            "relationships": "Navigational links to related data and included resource types and IDs.",
            "data": "The resource data.",
            "id": "The opaque resource ID that uniquely identifies the resource.",
            "links": "Navigational links that include the self-link.",
            "type": "The resource type.",
            "meta": "Paging information.",
        ]

        private static let relationshipProperties: [String: String] = [
            "data": "The type and ID of a related resource.",
            "links": "The links to the related data and the relationship's self-link.",
            "meta": "Paging information for data responses.",
            "related": "The link to the related data.",
            "self": "The relationship's self-link",
        ]

        private static let updateRequestProperties: [String: String] = [
            "relationships": "The types and IDs of the related data to update.",
        ]

        private static let createRequestDataRelationshipProperties: [String: String] = [
            "data": "The type and ID of the resource that you're relating with the resource you're creating.",
        ]

        private static let updateRequestDataRelationshipProperties: [String: String] = [
            "data": "The type and ID of a resource that you're relating with the resource you're updating.",
        ]

        private static let linkagesRequestProperties: [String: String] = [
            "data": "The object types and IDs of the related resources.",
        ]

        private static let responseProperties: [String: String] = [
            "links": "Navigational links including the self-link and links to the related data.",
        ]

        static let allDocumentation: [String: Documentation] = [
            "App": .rootSchema(
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
            "AppBetaTestersLinkagesRequest": .rootSchema(summary: "A request body you use to remove beta testers from an app."),
            "AppResponse": .rootSchema(summary: "A response that contains a single Apps resource."),
            "AppsResponse": .rootSchema(summary: "A response that contains a list of Apps resources."),
            "AppUpdateRequest": .rootSchema(
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
            "InAppPurchase": .rootSchema(
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
            "InAppPurchaseResponse": .rootSchema(summary: "A response that contains a single In-App Purchases resource."),
            "InAppPurchasesResponse": .rootSchema(summary: "A response that contains a list of In-App Purchase resources."),
            "Platform": .rootSchema(summary: "Strings that represent Apple operating systems."),
            "User": .rootSchema(
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
            "UserInvitation": .rootSchema(
                summary: "The data structure that represents a User Invitations resource.",
                children: [
                    .attributes(summary: "Attributes that describe a User Invitations resource.",
                                properties: [
                                    "email": "The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.",
                                    "firstName": "The first name of the user with the pending user invitation.",
                                    "lastName": "The last name of the user with the pending user invitation.",
                                    "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                                    "expirationDate": "The expiration date of the pending invitation.",
                                    "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                                    "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                                ]),
                ]),
            "UserInvitationCreateRequest": .rootSchema(
                summary: "The request body you use to create a User Invitation.",
                children: [
                    .createRequestDataAttributes(properties: [
                        "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                        "email": "The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.",
                        "firstName": "The user invitation recipient's first name.",
                        "lastName": "The user invitation recipient's last name.",
                        "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                        "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                    ]),
                ]),
            "UserInvitationResponse": .rootSchema(summary: "A response that contains a single User Invitations resource."),
            "UserInvitationsResponse": .rootSchema(summary: "A response that contains a list of User Invitations resources."),
            "UserResponse": .rootSchema(summary: "A response that contains a single Users resource."),
            "UserRole": .enumObject(
                summary: "Strings that represent user roles in App Store Connect.",
                cases: [
                    "ADMIN": "Serves as a secondary contact for teams and has many of the same responsibilities as the Account Holder role. Admins have access to all apps.",
                    "FINANCE": "Manages financial information, including reports and tax forms. A user assigned this role can view all apps in Payments and Financial Reports, Sales and Trends, and App Analytics.",
                    "TECHNICAL": "The Technical role is no longer assignable to new users in App Store Connect. Existing users with the Technical role can manage all the aspects of an app, such as pricing, App Store information, and app development and delivery. Techncial users have access to all apps.",
                    "SALES": "Analyzes sales, downloads, and other analytics for the app.",
                    "MARKETING": "Manages marketing materials and promotional artwork. A user assigned this role will be contacted by Apple if the app is in consideration to be featured on the App Store.",
                    "DEVELOPER": "Manages development and delivery of an app.",
                    "ACCOUNT_HOLDER": "Responsible for entering into legal agreements with Apple. The person who completes program enrollment is assigned the Account Holder role in both the Apple Developer account and App Store Connect.",
                    "READ_ONLY": "",
                    "APP_MANAGER": "Manages all aspects of an app, such as pricing, App Store information, and app development and delivery.",
                    "ACCESS_TO_REPORTS": "Downloads reports associated with a role. The Access To Reports role is an additional permission for users with the App Manager, Developer, Marketing, or Sales role. If this permission is added, the user has access to all of your apps.",
                    "CUSTOMER_SUPPORT": "Analyzes and responds to customer reviews on the App Store. If a user has only the Customer Support role, they'll go straight to the Ratings and Reviews section when they click on an app in My Apps.",
                ]),
            "UsersResponse": .rootSchema(summary: "A response that contains a list of Users resources."),
            "UserUpdateRequest": .rootSchema(
                summary: "The request body you use to update a User.",
                children: [
                    .updateRequestDataAttributes(
                        properties: [
                            "allAppsVisible": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                            "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                            "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                        ]),
                ]),
            "UserVisibleAppsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove visible apps from a user."),
            "UserVisibleAppsLinkagesResponse": .linkagesResponse,
        ]
    }
}
