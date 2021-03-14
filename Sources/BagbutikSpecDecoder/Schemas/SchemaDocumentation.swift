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
                            "contentRightsDeclaration": "",
                            "isOrEverWasMadeForKids": "",
                        ]),
                ]),
            "AppBetaTestersLinkagesRequest": .linkagesRequest(summary: "A request body you use to remove beta testers from an app."),
            "AppInfo": .rootSchema(
                summary: "The data structure that represent an App Infos resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe an App Infos resource.",
                        properties: [
                            "appStoreAgeRating": "",
                            "appStoreState": "",
                            "brazilAgeRating": "",
                            "kidsAgeBand": "",
                        ]),
                ]),
            "AppInfoResponse": .rootSchema(summary: "A response that contains a single App Infos resource."),
            "AppInfosResponse": .rootSchema(summary: "A response that contains a list of App Info resources."),
            "AppInfoUpdateRequest": .rootSchema(summary: "The request body you use to update an App Info."),
            "AppResponse": .rootSchema(summary: "A response that contains a single Apps resource."),
            "AppsResponse": .rootSchema(summary: "A response that contains a list of Apps resources."),
            "AppUpdateRequest": .rootSchema(
                summary: "The request body you use to update an App Update.",
                children: [
                    .updateRequestDataAttributes(properties: [
                        "availableInNewTerritories": "",
                        "bundleId": "",
                        "contentRightsDeclaration": "",
                        "primaryLocale": "",
                    ]),
                ]),
            "BundleId": .rootSchema(
                summary: "The data structure that represents a Bundle IDs resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe a Bundle IDs resource.",
                        properties: [
                            "identifier": "",
                            "name": "",
                            "platform": "",
                            "seedId": "",
                        ]),
                ]),
            "BundleIdCapabilitiesResponse": .rootSchema(
                summary: "A response that contains a list of Bundle ID Capability resources."
            ),
            "BundleIdCapability": .rootSchema(
                summary: "The data structure that represents a Bundle ID Capabilities resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe a Bundle ID Capabilities resource.",
                        properties: [
                            "capabilityType": "",
                            "settings": "",
                        ]),
                ]),
            "BundleIdCapabilityCreateRequest": .rootSchema(
                summary: "The request body you use to create a Bundle ID Capability.",
                children: [
                    .createRequestDataAttributes(properties: [
                        "capabilityType": "",
                        "settings": "",
                    ]),
                ]),
            "BundleIdCapabilityResponse": .rootSchema(
                summary: "A response that contains a single Bundle ID Capabilities resource."
            ),
            "BundleIdCapabilityUpdateRequest": .rootSchema(
                summary: "The request body you use to update a Bundle ID Capability.",
                children: [
                    .updateRequestDataAttributes(properties: [
                        "capabilityType": "",
                        "settings": "",
                    ]),
                ]),
            "BundleIdCreateRequest": .rootSchema(
                summary: "The request body you use to create a Bundle ID.",
                children: [
                    .createRequestDataAttributes(properties: [
                        "identifier": "",
                        "name": "",
                        "platform": "",
                        "seedId": "",
                    ]),
                ]),
            "BundleIdUpdateRequest": .rootSchema(
                summary: "The request body you use to update a Bundle ID.",
                children: [.updateRequestDataAttributes(properties: ["name": ""])]),
            "BundleIdPlatform": .enumObject(
                summary: "Strings that represent the operating system intended for the bundle.",
                cases: [
                    "IOS": "A string that represents iOS.",
                    "MAC_OS": "A string that represents macOS.",
                ]),
            "BundleIdResponse": .rootSchema(summary: "A response that contains a single Bundle IDs resource."),
            "BundleIdsResponse": .rootSchema(summary: "A response that contains a list of Bundle ID resources."),
            "CapabilityOption": .rootSchema(
                summary: "An option within a capability setting.",
                properties: [
                    "description": "",
                    "enabled": "",
                    "enabledByDefault": "",
                    "key": "",
                    "name": "",
                    "supportsWildcard": "",
                ]),
            "CapabilitySetting": .rootSchema(
                summary: "An object that represents a capability setting for an app.",
                properties: [
                    "allowedInstances": "",
                    "description": "",
                    "enabledByDefault": "",
                    "key": "",
                    "name": "",
                    "options": "",
                    "visible": "",
                    "minInstances": "",
                ]),
            "CapabilityType": .enumObject(
                summary: "String that represents an app's capability type.",
                cases: [
                    "ICLOUD": "",
                    "IN_APP_PURCHASE": "",
                    "GAME_CENTER": "",
                    "PUSH_NOTIFICATIONS": "",
                    "WALLET": "",
                    "INTER_APP_AUDIO": "",
                    "MAPS": "",
                    "ASSOCIATED_DOMAINS": "",
                    "PERSONAL_VPN": "",
                    "APP_GROUPS": "",
                    "HEALTHKIT": "",
                    "HOMEKIT": "",
                    "WIRELESS_ACCESSORY_CONFIGURATION": "",
                    "APPLE_PAY": "",
                    "DATA_PROTECTION": "",
                    "SIRIKIT": "",
                    "NETWORK_EXTENSIONS": "",
                    "MULTIPATH": "",
                    "HOT_SPOT": "",
                    "NFC_TAG_READING": "",
                    "CLASSKIT": "",
                    "AUTOFILL_CREDENTIAL_PROVIDER": "",
                    "ACCESS_WIFI_INFORMATION": "",
                    "NETWORK_CUSTOM_PROTOCOL": "",
                    "COREMEDIA_HLS_LOW_LATENCY": "",
                    "SYSTEM_EXTENSION_INSTALL": "",
                    "USER_MANAGEMENT": "",
                    "APPLE_ID_AUTH": "",
                ]),
            "Certificate": .rootSchema(
                summary: "The data structure that represents a Certificates resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe a Certificates resource.",
                        properties: [
                            "certificateContent": "",
                            "displayName": "",
                            "expirationDate": "",
                            "name": "",
                            "platform": "",
                            "serialNumber": "",
                            "certificateType": "",
                        ]),
                ]),
            "CertificateCreateRequest": .rootSchema(
                summary: "The request body you use to create a Certificate.",
                children: [.createRequestDataAttributes(properties: [
                    "certificateType": "",
                    "csrContent": "",
                ])]),
            "CertificateResponse": .rootSchema(summary: "A response that contains a single Certificates resource."),
            "CertificatesResponse": .rootSchema(summary: "A response that contains a list of Certificates resources."),
            "CertificateType": .enumObject(
                summary: "Literal values that represent types of signing certificates.",
                cases: [
                    "IOS_DEVELOPMENT": "",
                    "IOS_DISTRIBUTION": "",
                    "MAC_APP_DISTRIBUTION": "",
                    "MAC_INSTALLER_DISTRIBUTION": "",
                    "MAC_APP_DEVELOPMENT": "",
                    "DEVELOPER_ID_KEXT": "",
                    "DEVELOPER_ID_APPLICATION": "",
                    "DEVELOPMENT": "",
                    "DISTRIBUTION": "",
                ]),
            "Device": .rootSchema(
                summary: "The data structure that represents a Devices resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe a Devices resource.",
                        properties: [
                            "deviceClass": "",
                            "model": "",
                            "name": "",
                            "platform": "",
                            "status": "",
                            "udid": "",
                            "addedDate": "",
                        ]),
                ]),
            "DeviceCreateRequest": .rootSchema(
                summary: "The request body you use to create a Device.",
                children: [
                    .createRequestDataAttributes(properties: [
                        "name": "",
                        "platform": "",
                        "udid": "",
                    ]),
                ]),
            "DeviceResponse": .rootSchema(summary: "A response that contains a single Devices resource."),
            "DevicesResponse": .rootSchema(summary: "A response that contains a list of Devices resources."),
            "DeviceUpdateRequest": .rootSchema(
                summary: "The request body you use to update a Device.",
                children: [
                    .updateRequestDataAttributes(properties: [
                        "name": "",
                        "status": "",
                    ]),
                ]),
            "InAppPurchase": .rootSchema(
                summary: "The data structure that represents the In-App Purchases resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe an In-App Purchases resource.",
                        properties: [
                            "inAppPurchaseType": "",
                            "productId": "",
                            "referenceName": "",
                            "state": "",
                        ]),
                ]),
            "InAppPurchaseResponse": .rootSchema(summary: "A response that contains a single In-App Purchases resource."),
            "InAppPurchasesResponse": .rootSchema(summary: "A response that contains a list of In-App Purchase resources."),
            "Platform": .enumObject(
                summary: "Strings that represent Apple operating systems.",
                cases: [
                    "IOS": "A string that represents iOS.",
                    "MAC_OS": "A string that represents macOS.",
                    "TV_OS": "A string that represents tvOS.",
                ]),
            "Profile": .rootSchema(
                summary: "The data structure that represents a Profiles resource.",
                children: [
                    .attributes(
                        summary: "Attributes that describe a Profiles resource.",
                        properties: [
                            "name": "",
                            "platform": "",
                            "profileContent": "",
                            "uuid": "",
                            "createdDate": "",
                            "profileState": "",
                            "profileType": "",
                            "expirationDate": "",
                        ]),
                ]),
            "ProfileCreateRequest": .rootSchema(
                summary: "The request body you use to create a Profile.",
                children: [
                    .createRequestDataAttributes(properties: [
                        "name": "",
                        "profileType": "",
                    ]),
                ]),
            "ProfileResponse": .rootSchema(summary: "A response that contains a single Profiles resource."),
            "ProfilesResponse": .rootSchema(summary: "A response that contains a list of Profiles resources."),
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
