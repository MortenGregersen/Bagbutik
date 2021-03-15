import Foundation

public extension Schema {
    struct AttributesDocumentation: Equatable {
        let summary: String
        let properties: [String: String]?

        init(summary: String, properties: [String: String]? = nil) {
            self.summary = summary
            self.properties = properties
        }
    }

    struct RequestDataAttributesDocumentaion: Equatable {
        let properties: [String: String]?

        init(properties: [String: String]? = nil) {
            self.properties = properties
        }
    }

    enum Documentation: Equatable {
        case rootSchema(summary: String, properties: [String: String]? = nil, attributes: AttributesDocumentation? = nil)
        case attributes(AttributesDocumentation)
        case relationships
        case relationship
        case relationshipData
        case relationshipLinks
        case createRequest(summary: String, attributes: RequestDataAttributesDocumentaion)
        case createRequestData
        case createRequestDataAttributes(RequestDataAttributesDocumentaion)
        case createRequestDataRelationships
        case createRequestDataRelationship
        case createRequestDataRelationshipData
        case updateRequest(summary: String, attributes: RequestDataAttributesDocumentaion)
        case updateRequestData
        case updateRequestDataAttributes(RequestDataAttributesDocumentaion)
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
            case .attributes(let documentation):
                return documentation.summary
            case .relationships:
                return "The relationships you included in the request and those on which you can operate."
            case .relationship:
                return "The data and links that describe the relationship between the resources."
            case .relationshipData:
                return "The type and ID of a related resource."
            case .relationshipLinks:
                return "The links to the related data and the relationship's self-link."
            case .createRequest(let summary, _):
                return summary
            case .createRequestData:
                return "The data element of the request body."
            case .createRequestDataAttributes:
                return "Attributes that you set that describe the new resource."
            case .createRequestDataRelationships:
                return "The relationships to other resources that you can set with this request."
            case .createRequestDataRelationship:
                return nil
            case .createRequestDataRelationshipData:
                return "The type and ID of the resource that you're relating with the resource you're creating."
            case .updateRequest(let summary, _):
                return summary
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
            case .attributes(let attributes):
                return propertiesMergedWithCommonProperties(attributes.properties)
            case .relationships,
                 .relationshipData:
                return Self.commonProperties
            case .relationship, .relationshipLinks:
                return propertiesMergedWithCommonProperties(Self.relationshipProperties)
            case .createRequestData:
                return propertiesMergedWithCommonProperties(Self.createRequestProperties)
            case .createRequestDataAttributes(let attributes):
                return propertiesMergedWithCommonProperties(attributes.properties)
            case .createRequest(_, _),
                 .createRequestDataRelationships,
                 .createRequestDataRelationshipData:
                return Self.commonProperties
            case .createRequestDataRelationship:
                return propertiesMergedWithCommonProperties(Self.createRequestDataRelationshipProperties)
            case .updateRequestData:
                return propertiesMergedWithCommonProperties(Self.updateRequestProperties)
            case .updateRequestDataAttributes(let attributes):
                return propertiesMergedWithCommonProperties(attributes.properties)
            case .updateRequest(_, _),
                 .updateRequestDataRelationships,
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

        private static let createRequestProperties: [String: String] = [
            "relationships": "The relationships to other resources that you can set with this request.",
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
            "AgeRatingDeclaration": .rootSchema(
                summary: "The data structure that represents an Age Rating Declarations resource.",
                attributes: .init(
                    summary: "Attributes that describe an Age Rating Declarations resource.",
                    properties: [
                        "alcoholTobaccoOrDrugUseOrReferences": "",
                        "gamblingAndContests": "",
                        "kidsAgeBand": "",
                        "medicalOrTreatmentInformation": "",
                        "profanityOrCrudeHumor": "",
                        "sexualContentOrNudity": "",
                        "unrestrictedWebAccess": "",
                        "gamblingSimulated": "",
                        "horrorOrFearThemes": "",
                        "matureOrSuggestiveThemes": "",
                        "sexualContentGraphicAndNudity": "",
                        "violenceCartoonOrFantasy": "",
                        "violenceRealistic": "",
                        "violenceRealisticProlongedGraphicOrSadistic": "",
                    ]
                )
            ),
            "AgeRatingDeclarationResponse": .rootSchema(summary: "A response that contains a single Age Rating Declarations resource."),
            "AgeRatingDeclarationUpdateRequest": .updateRequest(
                summary: "The request body you use to update an Age Rating Declaration.",
                attributes: .init(properties: [
                    "alcoholTobaccoOrDrugUseOrReferences": "",
                    "gamblingAndContests": "",
                    "kidsAgeBand": "",
                    "medicalOrTreatmentInformation": "",
                    "profanityOrCrudeHumor": "",
                    "sexualContentOrNudity": "",
                    "unrestrictedWebAccess": "",
                    "gamblingSimulated": "",
                    "horrorOrFearThemes": "",
                    "matureOrSuggestiveThemes": "",
                    "sexualContentGraphicAndNudity": "",
                    "violenceCartoonOrFantasy": "",
                    "violenceRealistic": "",
                    "violenceRealisticProlongedGraphicOrSadistic": "",
                ])
            ),
            "App": .rootSchema(
                summary: "The data structure that represents an Apps resource.",
                attributes: .init(
                    summary: "Attributes that describe an Apps resource.",
                    properties: [
                        "bundleId": "The bundle ID for your app. This ID must match the one you use in Xcode. The bundle ID cannot be changed after you upload your first build.",
                        "name": "The name of your app as it will appear in the App Store. The maximum length is 30 characters.",
                        "primaryLocale": "The primary locale for your app. If localized app information isn’t available in an App Store territory, the information from your primary language is used instead.",
                        "sku": "A unique ID for your app that is not visible on the App Store.",
                        "availableInNewTerritories": "",
                        "contentRightsDeclaration": "",
                        "isOrEverWasMadeForKids": "",
                    ]
                )
            ),
            "AppBetaTestersLinkagesRequest": .linkagesRequest(summary: "A request body you use to remove beta testers from an app."),
            "AppCategoriesResponse": .rootSchema(summary: "A response that contains a list of App Category resources."),
            "AppCategory": .rootSchema(
                summary: "The data structure that represent an App Categories resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Categories resource.",
                    properties: ["platforms": ""]
                )
            ),
            "AppCategoryResponse": .rootSchema(summary: "A response that contains a single App Categories resource."),
            "AppEncryptionDeclaration": .rootSchema(
                summary: "The data structure that represents an App Encryption Declarations resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Encryption Declarations resource.",
                    properties: [
                        "availableOnFrenchStore": "A Boolean value that indicates the intent to distribute your app on the French App Store.",
                        "codeValue": "A unique identifier that can be added to your app to associate it with a given declaration.",
                        "containsProprietaryCryptography": "A Boolean value that indicates your app implements any proprietary encryption algorithms.",
                        "containsThirdPartyCryptography": "A Boolean value that indicates your app implements any standard encryption algorithms instead of, or in addition to, using or accessing the encryption in Apple’s operating systems.",
                        "documentName": "The document name of your submitted export compliance documentation.",
                        "documentType": "The file type of your submitted export compliance documentation.",
                        "documentUrl": "The URL to the file of your submitted export compliance documentation.",
                        "exempt": "A Boolean value that indicates your app is exempt based on your use of encryption and the app's availability.",
                        "platform": "The platform of the declaration.",
                        "usesEncryption": "A Boolean value that indicates whether your app uses, contains, or incorporates cryptography.",
                        "appEncryptionDeclarationState": "The approval state of your export compliance documentation.",
                        "uploadedDate": "The date and time you submitted your declaration.",
                    ]
                )
            ),
            "AppEncryptionDeclarationBuildsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add builds to an app encryption declaration."),
            "AppEncryptionDeclarationResponse": .rootSchema(summary: "A response that contains a single App Encryption Declarations resource."),
            "AppEncryptionDeclarationsResponse": .rootSchema(summary: "A response that contains a list of App Encryption Declaration resources."),
            "AppEncryptionDeclarationState": .enumObject(
                summary: "Strings that represent the review or acceptance status of an app encryption declaration submitted to Apple.",
                cases: [
                    "APPROVED": "",
                    "INVALID": "",
                    "EXPIRED": "",
                    "IN_REVIEW": "",
                    "REJECTED": "",
                ]
            ),
            "AppInfo": .rootSchema(
                summary: "The data structure that represent an App Infos resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Infos resource.",
                    properties: [
                        "appStoreAgeRating": "",
                        "appStoreState": "",
                        "brazilAgeRating": "",
                        "kidsAgeBand": "",
                    ]
                )
            ),
            "AppInfoLocalization": .rootSchema(
                summary: "The data structure that represent an App Info Localizations resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Info Localizations resource.",
                    properties: [
                        "locale": "",
                        "name": "",
                        "privacyPolicyText": "",
                        "privacyPolicyUrl": "",
                        "subtitle": "",
                    ]
                )
            ),
            "AppInfoLocalizationCreateRequest": .createRequest(
                summary: "The request body you use to create an App Info Localization.",
                attributes: .init(properties: [
                    "locale": "",
                    "name": "",
                    "privacyPolicyText": "",
                    "privacyPolicyUrl": "",
                    "subtitle": "",
                ])
            ),
            "AppInfoLocalizationResponse": .rootSchema(summary: "A response that contains a single App Info Localizations resource."),
            "AppInfoLocalizationsResponse": .rootSchema(summary: "A response that contains a list of AppInfoLocalizations resources."),
            "AppInfoLocalizationUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Info Localization.",
                attributes: .init(properties: [
                    "name": "",
                    "privacyPolicyText": "",
                    "privacyPolicyUrl": "",
                    "subtitle": "",
                ])
            ),
            "AppInfoResponse": .rootSchema(summary: "A response that contains a single App Infos resource."),
            "AppInfosResponse": .rootSchema(summary: "A response that contains a list of App Info resources."),
            "AppInfoUpdateRequest": .rootSchema(summary: "The request body you use to update an App Info."),
            "AppMediaAssetState": .rootSchema(
                summary: "The state of an app or media upload, including any errors and warnings.",
                properties: [
                    "errors": "",
                    "state": "",
                    "warnings": "",
                ]
            ),
            "AppMediaStateError": .rootSchema(
                summary: "An error code and description.",
                properties: [
                    "code": "",
                    "description": "",
                ]
            ),
            "AppPreview": .rootSchema(
                summary: "The data structure that represent an App Previews resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Previews resource.",
                    properties: [
                        "assetDeliveryState": "",
                        "fileName": "",
                        "fileSize": "",
                        "mimeType": "",
                        "previewFrameTimeCode": "",
                        "previewImage": "",
                        "sourceFileChecksum": "",
                        "uploadOperations": "",
                        "videoUrl": "",
                    ]
                )
            ),
            "AppPreviewCreateRequest": .createRequest(
                summary: "The request body you use to create an App Preview.",
                attributes: .init(
                    properties: [
                        "fileName": "",
                        "fileSize": "",
                        "mimeType": "",
                        "previewFrameTimeCode": "",
                    ]
                )
            ),
            "AppPreviewResponse": .rootSchema(summary: "A response that contains a single App Previews resource."),
            "AppPreviewsResponse": .rootSchema(summary: "A response that contains a list of App Preview resources."),
            "AppPreviewUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Preview.",
                attributes: .init(properties: [
                    "previewFrameTimeCode": "",
                    "uploaded": "",
                    "sourceFileChecksum": "",
                ])
            ),
            "AppPreviewSet": .rootSchema(
                summary: "The data structure that represent an App Preview Sets resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Preview Sets resource.",
                    properties: ["previewType": ""]
                )
            ),
            "AppPreviewSetAppPreviewsLinkagesRequest": .linkagesRequest(summary: "A request body you use to reorder the app previews in a preview set."),
            "AppPreviewSetAppPreviewsLinkagesResponse": .linkagesResponse,
            "AppPreviewSetCreateRequest": .createRequest(
                summary: "The request body you use to create an App Preview Set.",
                attributes: .init(properties: ["previewType": ""])
            ),
            "AppPreviewSetResponse": .rootSchema(summary: "A response that contains a single App Preview Sets resource."),
            "AppPreviewSetsResponse": .rootSchema(summary: "A response that contains a list of App Preview Set resources."),
            "AppResponse": .rootSchema(summary: "A response that contains a single Apps resource."),
            "AppsResponse": .rootSchema(summary: "A response that contains a list of Apps resources."),
            "AppScreenshot": .rootSchema(
                summary: "The data structure that represent an App Screenshots resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Screenshots resource.",
                    properties: [
                        "assetDeliveryState": "",
                        "assetToken": "",
                        "assetType": "",
                        "fileName": "",
                        "fileSize": "",
                        "imageAsset": "",
                        "sourceFileChecksum": "",
                        "uploadOperations": "",
                    ]
                )
            ),
            "AppScreenshotCreateRequest": .createRequest(
                summary: "The request body you use to create an App Screenshot.",
                attributes: .init(properties: [
                    "fileName": "",
                    "fileSize": "",
                ])
            ),
            "AppScreenshotResponse": .rootSchema(summary: "A response that contains a single App Screenshots resource."),
            "AppScreenshotsResponse": .rootSchema(summary: "A response that contains a list of App Screenshots resources."),
            "AppScreenshotUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Screenshot.",
                attributes: .init(properties: [
                    "uploaded": "",
                    "sourceFileChecksum": "",
                ])
            ),
            "AppScreenshotSet": .rootSchema(
                summary: "The data structure that represent an App Screenshot Sets resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Screenshot Sets resource.",
                    properties: ["screenshotDisplayType": ""]
                )
            ),
            "AppScreenshotSetAppScreenshotsLinkagesRequest": .linkagesRequest(summary: "A request body you use to reorder the screenshots in a screenshot set."),
            "AppScreenshotSetAppScreenshotsLinkagesResponse": .linkagesResponse,
            "AppScreenshotSetCreateRequest": .createRequest(
                summary: "The request body you use to create an App Screenshot Set.",
                attributes: .init(properties: ["screenshotDisplayType": ""])
            ),
            "AppScreenshotSetResponse": .rootSchema(summary: "A response that contains a single App Screenshot Sets resource."),
            "AppScreenshotSetsResponse": .rootSchema(summary: "A response that contains a list of App Screenshot Set resources."),
            "AppStoreAgeRating": .enumObject(
                summary: "String that represents the app’s age rating as it will appear on the App Store for all platforms.",
                cases: [
                    "FOUR_PLUS": "",
                    "NINE_PLUS": "",
                    "TWELVE_PLUS": "",
                    "SEVENTEEN_PLUS": "",
                ]
            ),
            "AppStoreVersion": .rootSchema(
                summary: "The data structure that represent an App Store Versions resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Store Versions resource.",
                    properties: [
                        "platform": "",
                        "appStoreState": "",
                        "copyright": "",
                        "earliestReleaseDate": "",
                        "releaseType": "",
                        "usesIdfa": "",
                        "versionString": "",
                        "createdDate": "",
                        "downloadable": "",
                    ]
                )
            ),
            "AppStoreVersionBuildLinkageRequest": .linkagesRequest(summary: "The request body you use to attach a build to an App Store version."),
            "AppStoreVersionBuildLinkageResponse": .linkagesResponse,
            "AppStoreVersionCreateRequest": .createRequest(
                summary: "The request body you use to create an App Store Version.",
                attributes: .init(properties: [
                    "copyright": "",
                    "earliestReleaseDate": "",
                    "platform": "",
                    "releaseType": "",
                    "usesIdfa": "",
                    "versionString": "",
                ])
            ),
            "AppStoreVersionLocalization": .rootSchema(
                summary: "The data structure that represent an App Store Version Localizations resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Store Version Localizations resource.",
                    properties: [
                        "description": "",
                        "keywords": "",
                        "locale": "",
                        "marketingUrl": "",
                        "promotionalText": "",
                        "supportUrl": "",
                        "whatsNew": "",
                    ]
                )
            ),
            "AppStoreVersionLocalizationCreateRequest": .createRequest(
                summary: "The request body you use to create an App Store Version Localization.",
                attributes: .init(properties: [
                    "description": "",
                    "keywords": "",
                    "locale": "",
                    "marketingUrl": "",
                    "promotionalText": "",
                    "supportUrl": "",
                    "whatsNew": "",
                ])
            ),
            "AppStoreVersionLocalizationResponse": .rootSchema(summary: "A response that contains a single App Store Version Localizations resource."),
            "AppStoreVersionLocalizationsResponse": .rootSchema(summary: "A response that contains a list of App Store Version Localization resources."),
            "AppStoreVersionLocalizationUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Store Version Localization",
                attributes: .init(properties: [
                    "description": "",
                    "keywords": "",
                    "marketingUrl": "",
                    "promotionalText": "",
                    "supportUrl": "",
                    "whatsNew": "",
                ])
            ),
            "AppStoreVersionResponse": .rootSchema(summary: "A response that contains a single App Store Versions resource."),
            "AppStoreVersionsResponse": .rootSchema(summary: "A response that contains a list of App Store Version resources."),
            "AppStoreVersionState": .enumObject(
                summary: "String that represents the state of an app version in the App Store.",
                cases: [
                    "DEVELOPER_REMOVED_FROM_SALE": "",
                    "DEVELOPER_REJECTED": "",
                    "IN_REVIEW": "",
                    "INVALID_BINARY": "",
                    "METADATA_REJECTED": "",
                    "PENDING_APPLE_RELEASE": "",
                    "PENDING_CONTRACT": "",
                    "PENDING_DEVELOPER_RELEASE": "",
                    "PREPARE_FOR_SUBMISSION": "",
                    "PREORDER_READY_FOR_SALE": "",
                    "PROCESSING_FOR_APP_STORE": "",
                    "READY_FOR_SALE": "",
                    "REJECTED": "",
                    "REMOVED_FROM_SALE": "",
                    "WAITING_FOR_EXPORT_COMPLIANCE": "",
                    "WAITING_FOR_REVIEW": "",
                    "REPLACED_WITH_NEW_VERSION": "",
                ]
            ),
            "AppStoreVersionUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Store Version.",
                attributes: .init(properties: [
                    "copyright": "",
                    "earliestReleaseDate": "",
                    "releaseType": "",
                    "usesIdfa": "",
                    "versionString": "",
                    "downloadable": "",
                ])
            ),
            "AppUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Update.",
                attributes: .init(properties: [
                    "availableInNewTerritories": "",
                    "bundleId": "",
                    "contentRightsDeclaration": "",
                    "primaryLocale": "",
                ])
            ),
            "BetaTester": .rootSchema(
                summary: "The data structure that represents a Beta Testers resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta Testers resource.",
                    properties: [
                        "email": "The beta tester's email address, used for sending beta testing invitations.",
                        "firstName": "The beta tester's first name.",
                        "inviteType": "An invite type that indicates if a beta tester was invited by an email invite or used a TestFlight public link to join a beta test.",
                        "lastName": "The beta tester's last name.",
                    ]
                )
            ),
            "BetaTesterAppsLinkagesRequest": .linkagesRequest(summary: "A request body you use to remove an app from a beta tester."),
            "BetaTesterAppsLinkagesResponse": .linkagesResponse,
            "BetaTesterBetaGroupsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove beta groups from a beta tester."),
            "BetaTesterBetaGroupsLinkagesResponse": .linkagesResponse,
            "BetaTesterBuildsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove builds from a beta tester."),
            "BetaTesterBuildsLinkagesResponse": .linkagesResponse,
            "BetaTesterCreateRequest": .createRequest(
                summary: "The request body you use to create a BetaTester.",
                attributes: .init(properties: [
                    "email": "The beta tester's email address, used for sending beta testing invitations.",
                    "firstName": "The beta tester's first name.",
                    "lastName": "The beta tester's last name.",
                ])
            ),
            "BetaTesterResponse": .rootSchema(summary: "A response that contains a single Beta Testers resource."),
            "BetaTestersResponse": .rootSchema(summary: "A response that contains a list of Beta Tester resources."),
            "Build": .rootSchema(
                summary: "The data structure that represents a Builds resource.",
                attributes: .init(
                    summary: "Attributes that describe a Builds resource.",
                    properties: [
                        "expired": "A Boolean value that indicates if the build has expired. An expired build is unavailable for testing.",
                        "iconAssetToken": "The icon of the uploaded build.",
                        "minOsVersion": "The minimum operating system version needed to test a build.",
                        "processingState": "The processing state of the build indicating that it is not yet available for testing.",
                        "version": "The version number of the uploaded build.",
                        "usesNonExemptEncryption": "A Boolean value that indicates whether the build uses non-exempt encryption.",
                        "uploadedDate": "The date and time the build was uploaded to App Store Connect.",
                        "expirationDate": "The date and time the build will auto-expire and no longer be available for testing.",
                    ]
                )
            ),
            "BuildAppEncryptionDeclarationLinkageRequest": .linkagesRequest(summary: "The request body you use to attach an app encryption declaration to a build."),
            "BuildAppEncryptionDeclarationLinkageResponse": .linkagesResponse,
            "BuildBetaGroupsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove beta groups from a build."),
            "BuildIcon": .rootSchema(
                summary: "The data structure that represents the Build Icons resource.",
                attributes: .init(
                    summary: "Attributes that describe a Build Icons resource.",
                    properties: [
                        "iconAsset": "",
                        "iconType": "",
                    ]
                )
            ),
            "BuildIconsResponse": .rootSchema(summary: "A response that contains a list of Build Icon resources."),
            "BuildIndividualTestersLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove a build from multiple beta groups."),
            "BuildIndividualTestersLinkagesResponse": .linkagesResponse,
            "BuildResponse": .rootSchema(summary: "A response that contains a single Builds resource."),
            "BuildsResponse": .rootSchema(summary: "A response that contains a list of Builds resources."),
            "BuildUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Build.",
                attributes: .init(properties: [
                    "expired": "A Boolean value that indicates if the build has expired. An expired build is unavailable for testing.",
                    "usesNonExemptEncryption": "A Boolean value that indicates whether the build uses non-exempt encryption.",
                ])
            ),
            "BrazilAgeRating": .enumObject(
                summary: "String that represents the app's age rating as it will appear on the App Store in Brazil for all platforms.",
                cases: [
                    "L": "",
                    "TEN": "",
                    "TWELVE": "",
                    "FOURTEEN": "",
                    "SIXTEEN": "",
                    "EIGHTEEN": "",
                ]
            ),
            "BundleId": .rootSchema(
                summary: "The data structure that represents a Bundle IDs resource.",
                attributes: .init(
                    summary: "Attributes that describe a Bundle IDs resource.",
                    properties: [
                        "identifier": "",
                        "name": "",
                        "platform": "",
                        "seedId": "",
                    ]
                )
            ),
            "BundleIdCapabilitiesResponse": .rootSchema(
                summary: "A response that contains a list of Bundle ID Capability resources."
            ),
            "BundleIdCapability": .rootSchema(
                summary: "The data structure that represents a Bundle ID Capabilities resource.",
                attributes: .init(
                    summary: "Attributes that describe a Bundle ID Capabilities resource.",
                    properties: [
                        "capabilityType": "",
                        "settings": "",
                    ]
                )
            ),
            "BundleIdCapabilityCreateRequest": .createRequest(
                summary: "The request body you use to create a Bundle ID Capability.",
                attributes: .init(properties: [
                    "capabilityType": "",
                    "settings": "",
                ])
            ),
            "BundleIdCapabilityResponse": .rootSchema(
                summary: "A response that contains a single Bundle ID Capabilities resource."
            ),
            "BundleIdCapabilityUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Bundle ID Capability.",
                attributes: .init(properties: [
                    "capabilityType": "",
                    "settings": "",
                ])
            ),
            "BundleIdCreateRequest": .createRequest(
                summary: "The request body you use to create a Bundle ID.",
                attributes: .init(properties: [
                    "identifier": "",
                    "name": "",
                    "platform": "",
                    "seedId": "",
                ])
            ),
            "BundleIdUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Bundle ID.",
                attributes: .init(properties: [
                    "name": "",
                ])
            ),
            "BundleIdPlatform": .enumObject(
                summary: "Strings that represent the operating system intended for the bundle.",
                cases: [
                    "IOS": "A string that represents iOS.",
                    "MAC_OS": "A string that represents macOS.",
                ]
            ),
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
                ]
            ),
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
                ]
            ),
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
                ]
            ),
            "Certificate": .rootSchema(
                summary: "The data structure that represents a Certificates resource.",
                attributes: .init(
                    summary: "Attributes that describe a Certificates resource.",
                    properties: [
                        "certificateContent": "",
                        "displayName": "",
                        "expirationDate": "",
                        "name": "",
                        "platform": "",
                        "serialNumber": "",
                        "certificateType": "",
                    ]
                )
            ),
            "CertificateCreateRequest": .createRequest(
                summary: "The request body you use to create a Certificate.",
                attributes: .init(properties: [
                    "certificateType": "",
                    "csrContent": "",
                ])
            ),
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
                ]
            ),
            "Device": .rootSchema(
                summary: "The data structure that represents a Devices resource.",
                attributes: .init(
                    summary: "Attributes that describe a Devices resource.",
                    properties: [
                        "deviceClass": "",
                        "model": "",
                        "name": "",
                        "platform": "",
                        "status": "",
                        "udid": "",
                        "addedDate": "",
                    ]
                )
            ),
            "DeviceCreateRequest": .createRequest(
                summary: "The request body you use to create a Device.",
                attributes: .init(properties: [
                    "name": "",
                    "platform": "",
                    "udid": "",
                ])
            ),
            "DeviceResponse": .rootSchema(summary: "A response that contains a single Devices resource."),
            "DevicesResponse": .rootSchema(summary: "A response that contains a list of Devices resources."),
            "DeviceUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Device.",
                attributes: .init(properties: ["name": "", "status": ""])
            ),
            "EndUserLicenseAgreement": .rootSchema(
                summary: "The data structure that represents the End User License Agreement resource.",
                attributes: .init(
                    summary: "Attributes that describe an End User License Agreements resource.",
                    properties: ["agreementText": ""]
                )
            ),
            "EndUserLicenseAgreementCreateRequest": .createRequest(
                summary: "The request body you use to create an End User License Agreement.",
                attributes: .init(properties: ["agreementText": ""])
            ),
            "EndUserLicenseAgreementResponse": .rootSchema(summary: "A response that contains a single End User License Agreements resource."),
            "EndUserLicenseAgreementUpdateRequest": .updateRequest(
                summary: "The request body you use to update an End User License Agreement.",
                attributes: .init(properties: ["agreementText": ""])
            ),
            "GameCenterEnabledVersion": .rootSchema(
                summary: "The data structure that represents the Game Center Enabled Versions resource.",
                attributes: .init(
                    summary: "Attributes that describe a Game Center Enabled Versions resource.",
                    properties: [
                        "iconAsset": "",
                        "platform": "",
                        "versionString": "",
                    ]
                )
            ),
            "GameCenterEnabledVersionCompatibleVersionsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove compatible versions from a Game Center-enabled version."),
            "GameCenterEnabledVersionCompatibleVersionsLinkagesResponse": .linkagesResponse,
            "GameCenterEnabledVersionsResponse": .rootSchema(summary: "A response that contains a list of Game Center Enabled Version resources."),
            "IconAssetType": .enumObject(
                summary: "String that represents the type of icon contained in the build.",
                cases: [
                    "APP_STORE": "",
                    "MESSAGES_APP_STORE": "",
                    "WATCH_APP_STORE": "",
                    "TV_OS_HOME_SCREEN": "",
                    "TV_OS_TOP_SHELF": "",
                ]
            ),
            "ImageAsset": .rootSchema(
                summary: "An image asset, including its height, width, and template URL.",
                properties: [
                    "templateUrl": "",
                    "height": "",
                    "width": "",
                ]
            ),
            "InAppPurchase": .rootSchema(
                summary: "The data structure that represents the In-App Purchases resource.",
                attributes: .init(
                    summary: "Attributes that describe an In-App Purchases resource.",
                    properties: [
                        "inAppPurchaseType": "",
                        "productId": "",
                        "referenceName": "",
                        "state": "",
                    ]
                )
            ),
            "InAppPurchaseResponse": .rootSchema(summary: "A response that contains a single In-App Purchases resource."),
            "InAppPurchasesResponse": .rootSchema(summary: "A response that contains a list of In-App Purchase resources."),
            "KidsAgeBand": .enumObject(
                summary: "String that represents a Made for Kids app's age band.",
                cases: ["FIVE_AND_UNDER": "", "SIX_TO_EIGHT": "", "NINE_TO_ELEVEN": ""]
            ),
            "Platform": .enumObject(
                summary: "Strings that represent Apple operating systems.",
                cases: [
                    "IOS": "A string that represents iOS.",
                    "MAC_OS": "A string that represents macOS.",
                    "TV_OS": "A string that represents tvOS.",
                ]
            ),
            "PreviewType": .enumObject(
                summary: "String that represents the display type of an app preview.",
                cases: [
                    "IPHONE_65": "",
                    "IPHONE_58": "",
                    "IPHONE_55": "",
                    "IPHONE_47": "",
                    "IPHONE_40": "",
                    "IPHONE_35": "",
                    "IPAD_PRO_3GEN_129": "",
                    "IPAD_PRO_3GEN_11": "",
                    "IPAD_PRO_129": "",
                    "IPAD_105": "",
                    "IPAD_97": "",
                    "DESKTOP": "",
                    "WATCH_SERIES_4": "",
                    "WATCH_SERIES_3": "",
                    "APPLE_TV": "",
                ]
            ),
            "Profile": .rootSchema(
                summary: "The data structure that represents a Profiles resource.",
                attributes: .init(
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
                    ]
                )
            ),
            "ProfileCreateRequest": .createRequest(
                summary: "The request body you use to create a Profile.",
                attributes: .init(properties: [
                    "name": "",
                    "profileType": "",
                ])
            ),
            "ProfileResponse": .rootSchema(summary: "A response that contains a single Profiles resource."),
            "ProfilesResponse": .rootSchema(summary: "A response that contains a list of Profiles resources."),
            "RoutingAppCoverage": .rootSchema(
                summary: "The data structure that represents the Routing App Coverages resource.",
                attributes: .init(
                    summary: "Attributes that describe a Routing App Coverages resource.",
                    properties: [
                        "assetDeliveryState": "",
                        "fileName": "",
                        "fileSize": "",
                        "sourceFileChecksum": "",
                        "uploadOperations": "",
                    ]
                )
            ),
            "RoutingAppCoverageCreateRequest": .createRequest(
                summary: "The request body you use to create a Routing App Coverage.",
                attributes: .init(properties: [
                    "fileName": "",
                    "fileSize": "",
                ])
            ),
            "RoutingAppCoverageResponse": .rootSchema(summary: "A response that contains a single Routing App Coverages resource."),
            "RoutingAppCoverageUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Routing App Coverage.",
                attributes: .init(properties: [
                    "uploaded": "",
                    "sourceFileChecksum": "",

                ])
            ),
            "ScreenshotDisplayType": .enumObject(
                summary: "String that represents the display type of an app screenshot.",
                cases: [
                    "APP_IPHONE_65": "",
                    "APP_IPHONE_58": "",
                    "APP_IPHONE_55": "",
                    "APP_IPHONE_47": "",
                    "APP_IPHONE_40": "",
                    "APP_IPHONE_35": "",
                    "APP_IPAD_PRO_3GEN_129": "",
                    "APP_IPAD_PRO_3GEN_11": "",
                    "APP_IPAD_PRO_129": "",
                    "APP_IPAD_105": "",
                    "APP_IPAD_97": "",
                    "APP_DESKTOP": "",
                    "APP_WATCH_SERIES_4": "",
                    "APP_WATCH_SERIES_3": "",
                    "APP_APPLE_TV": "",
                    "IMESSAGE_APP_IPHONE_65": "",
                    "IMESSAGE_APP_IPHONE_58": "",
                    "IMESSAGE_APP_IPHONE_55": "",
                    "IMESSAGE_APP_IPHONE_47": "",
                    "IMESSAGE_APP_IPHONE_40": "",
                    "IMESSAGE_APP_IPAD_PRO_3GEN_129": "",
                    "IMESSAGE_APP_IPAD_PRO_3GEN_11": "",
                    "IMESSAGE_APP_IPAD_PRO_129": "",
                    "IMESSAGE_APP_IPAD_105": "",
                    "IMESSAGE_APP_IPAD_97": "",
                ]
            ),
            "UploadOperation": .rootSchema(
                summary: "Upload instructions for assets such as app previews and app screenshots.",
                properties: [
                    "length": "",
                    "method": "",
                    "offset": "",
                    "requestHeaders": "",
                    "url": "",
                ]
            ),
            "UploadOperationHeader": .rootSchema(
                summary: "A request header that is part of an upload operation.",
                properties: [
                    "name": "",
                    "value": "",
                ]
            ),
            "User": .rootSchema(
                summary: "The data structure that represents a Users resource.",
                attributes: .init(
                    summary: "Attributes that describe a Users resource.",
                    properties: [
                        "firstName": "The user's first name.",
                        "lastName": "The user's last name.",
                        "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                        "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                        "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                        "username": "The user's Apple ID.",
                    ]
                )
            ),
            "UserInvitation": .rootSchema(
                summary: "The data structure that represents a User Invitations resource.",
                attributes: .init(summary: "Attributes that describe a User Invitations resource.",
                                  properties: [
                                      "email": "The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.",
                                      "firstName": "The first name of the user with the pending user invitation.",
                                      "lastName": "The last name of the user with the pending user invitation.",
                                      "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                                      "expirationDate": "The expiration date of the pending invitation.",
                                      "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                                      "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                                  ])
            ),
            "UserInvitationCreateRequest": .createRequest(
                summary: "The request body you use to create a User Invitation.",
                attributes: .init(properties: [
                    "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                    "email": "The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.",
                    "firstName": "The user invitation recipient's first name.",
                    "lastName": "The user invitation recipient's last name.",
                    "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                    "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                ])
            ),
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
                ]
            ),
            "UsersResponse": .rootSchema(summary: "A response that contains a list of Users resources."),
            "UserUpdateRequest": .updateRequest(
                summary: "The request body you use to update a User.",
                attributes: .init(
                    properties: [
                        "allAppsVisible": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                        "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                        "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                    ])
            ),
            "UserVisibleAppsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove visible apps from a user."),
            "UserVisibleAppsLinkagesResponse": .linkagesResponse,
        ]
    }
}
