import Foundation

public extension Schema {
    /// Documentation for a schema's attributes
    struct AttributesDocumentation: Equatable {
        /// The summary for the attributes
        let summary: String
        /// The attributes' properties
        let properties: [String: String]?

        /**
         Initialize a new documentation for a schema's attributes

         - Parameters:
            - summary: The summary for the attributes
            - properties: The attributes' properties
         */
        init(summary: String, properties: [String: String]? = nil) {
            self.summary = summary
            self.properties = properties
        }
    }

    /// Documentation for a request's data's attributes
    struct RequestDataAttributesDocumentaion: Equatable {
        /// The attributes' properties
        let properties: [String: String]?

        /**
         Initialize a new documentation for a request's data's attributes

         - Parameter properties: The attributes' properties
         */
        init(properties: [String: String]? = nil) {
            self.properties = properties
        }
    }

    /// Documentation for a schema
    enum Documentation: Equatable {
        /// Documentation for a schema which is not a child of another schema
        case rootSchema(summary: String, discussion: String? = nil, properties: [String: String]? = nil, attributes: AttributesDocumentation? = nil)
        /// Documentation for attributes
        case attributes(AttributesDocumentation)
        /// Documentation for relationships
        case relationships
        /// Documentation for a relationship
        case relationship
        /// Documentation for data of a relationship
        case relationshipData
        /// Documentation for links of a relationship
        case relationshipLinks
        /// Documentation for a create request
        case createRequest(summary: String, attributes: RequestDataAttributesDocumentaion? = nil)
        /// Documentation for data of a create request
        case createRequestData
        /// Documentation for attributes for data of a create request
        case createRequestDataAttributes(RequestDataAttributesDocumentaion)
        /// Documentation for relationships for data of a create request
        case createRequestDataRelationships
        /// Documentation for a relationship for data of a create request
        case createRequestDataRelationship
        /// Documentation for data of a relationship for data of a create request
        case createRequestDataRelationshipData
        /// Documentation for a update request
        case updateRequest(summary: String, attributes: RequestDataAttributesDocumentaion? = nil)
        /// Documentation for data of a update request
        case updateRequestData
        /// Documentation for attributes for data of a update request
        case updateRequestDataAttributes(RequestDataAttributesDocumentaion)
        /// Documentation for relationships for data of a update request
        case updateRequestDataRelationships
        /// Documentation for a relationship for data of a update request
        case updateRequestDataRelationship
        /// Documentation for data of a relationship for data of a update request
        case updateRequestDataRelationshipData
        /// Documentation for a linkages request
        case linkagesRequest(summary: String)
        /// Documentation for data of a linkages request
        case linkagesRequestData
        /// Documentation for a linkages response
        case linkagesResponse
        /// Documentation for data of a linkages response
        case linkagesResponseData
        /// Documentation for a enum
        case enumObject(summary: String, cases: [String: String])

        internal static func lookupDocumentation(forSchemaNamed name: String) -> Documentation? {
            allDocumentation[name]
        }

        /// The potential summary for the schema
        public var summary: String? {
            switch self {
            case .rootSchema(let summary, _, _, _):
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

        /// The potential discussion for the schema
        public var discussion: String? {
            switch self {
            case .rootSchema(_, let discussion, _, _):
                return discussion
            default:
                return nil
            }
        }

        /// The properties for the schema
        public var properties: [String: String] {
            switch self {
            case .rootSchema(_, _, let properties, _):
                return Self.propertiesMergedWithCommonProperties(properties)
            case .attributes(let attributes):
                return Self.propertiesMergedWithCommonProperties(attributes.properties)
            case .relationship, .relationshipLinks:
                return Self.propertiesMergedWithCommonProperties(Self.relationshipProperties)
            case .createRequestData:
                return Self.propertiesMergedWithCommonProperties(Self.createRequestProperties)
            case .createRequestDataAttributes(let attributes):
                return Self.propertiesMergedWithCommonProperties(attributes.properties)
            case .createRequestDataRelationship:
                return Self.propertiesMergedWithCommonProperties(Self.createRequestDataRelationshipProperties)
            case .updateRequestData:
                return Self.propertiesMergedWithCommonProperties(Self.updateRequestProperties)
            case .updateRequestDataAttributes(let attributes):
                return Self.propertiesMergedWithCommonProperties(attributes.properties)
            case .updateRequestDataRelationship:
                return Self.propertiesMergedWithCommonProperties(Self.updateRequestDataRelationshipProperties)
            case .linkagesRequest:
                return Self.propertiesMergedWithCommonProperties(Self.linkagesRequestProperties)
            case .enumObject(_, let cases):
                return cases
            default:
                return Self.commonProperties
            }
        }

        internal static func propertiesMergedWithCommonProperties(_ properties: [String: String]?) -> [String: String] {
            commonProperties.merging(properties ?? [:], uniquingKeysWith: { $1 })
        }

        internal static let commonProperties: [String: String] = [
            "attributes": "The resource's attributes.",
            "relationships": "Navigational links to related data and included resource types and IDs.",
            "data": "The resource data.",
            "id": "The opaque resource ID that uniquely identifies the resource.",
            "links": "Navigational links that include the self-link.",
            "type": "The resource type.",
            "meta": "Paging information.",
            "included": "The included related resources.", // Unofficial documentation
        ]

        internal static let relationshipProperties: [String: String] = [
            "data": "The type and ID of a related resource.",
            "links": "The links to the related data and the relationship's self-link.",
            "meta": "Paging information for data responses.",
            "related": "The link to the related data.",
            "self": "The relationship's self-link",
        ]

        internal static let createRequestProperties: [String: String] = [
            "relationships": "The relationships to other resources that you can set with this request.",
        ]

        internal static let updateRequestProperties: [String: String] = [
            "relationships": "The types and IDs of the related data to update.",
        ]

        internal static let createRequestDataRelationshipProperties: [String: String] = [
            "data": "The type and ID of the resource that you're relating with the resource you're creating.",
        ]

        internal static let updateRequestDataRelationshipProperties: [String: String] = [
            "data": "The type and ID of a resource that you're relating with the resource you're updating.",
        ]

        internal static let linkagesRequestProperties: [String: String] = [
            "data": "The object types and IDs of the related resources.",
        ]

        internal static let responseProperties: [String: String] = [
            "links": "Navigational links including the self-link and links to the related data.",
        ]

        private static let allDocumentation: [String: Documentation] = [
            "AgeRatingDeclaration": .rootSchema(
                summary: "The data structure that represents an Age Rating Declarations resource.",
                attributes: .init(
                    summary: "Attributes that describe an Age Rating Declarations resource.",
                    properties: [
                        "alcoholTobaccoOrDrugUseOrReferences": "Declaration for alcohol, tobacco, or drug use.",
                        "gamblingAndContests": "Declaration for gambling or contests, as a Boolean value.",
                        "kidsAgeBand": "Declaration for the Kids Age Band value.",
                        "medicalOrTreatmentInformation": "Declaration for medical or treatment-focused content.",
                        "profanityOrCrudeHumor": "Declaration for profanity or crude humor.",
                        "sexualContentOrNudity": "Declaration for sexual content or nudity.",
                        "unrestrictedWebAccess": "Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.",
                        "gamblingSimulated": "Declaration for simulated gambling.",
                        "horrorOrFearThemes": "Declaration for horror or fear themed content.",
                        "matureOrSuggestiveThemes": "Declaration for mature or suggestive themes.",
                        "sexualContentGraphicAndNudity": "Declaration for graphic sexual content and nudity.",
                        "violenceCartoonOrFantasy": "Declaration for cartoon or fantasy violence.",
                        "violenceRealistic": "Declaration for realistic violence.",
                        "violenceRealisticProlongedGraphicOrSadistic": "Declaration for prolonged realistic or sadistic violence.",
                        "contests": "Declaration for contests.",
                        "gambling": "Declaration for gambling, provided as a Boolean value.",
                        "seventeenPlus": "Declaration for a 17+ rating, provided as a Boolean value.",
                    ]
                )
            ),
            "AgeRatingDeclarationResponse": .rootSchema(summary: "A response that contains a single Age Rating Declarations resource."),
            "AgeRatingDeclarationUpdateRequest": .updateRequest(
                summary: "The request body you use to update an Age Rating Declaration.",
                attributes: .init(properties: [
                    "alcoholTobaccoOrDrugUseOrReferences": "Declaration for alcohol, tobacco, or drug use.",
                    "gamblingAndContests": "Declaration for gambling or contests, as a Boolean value.",
                    "kidsAgeBand": "Declaration for the Kids Age Band value.",
                    "medicalOrTreatmentInformation": "Declaration for medical or treatment-focused content.",
                    "profanityOrCrudeHumor": "Declaration for profanity or crude humor.",
                    "sexualContentOrNudity": "Declaration for sexual content or nudity.",
                    "unrestrictedWebAccess": "Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.",
                    "gamblingSimulated": "Declaration for simulated gambling.",
                    "horrorOrFearThemes": "Declaration for horror or fear themed content.",
                    "matureOrSuggestiveThemes": "Declaration for mature or suggestive themes.",
                    "sexualContentGraphicAndNudity": "Declaration for graphic sexual content and nudity.",
                    "violenceCartoonOrFantasy": "Declaration for cartoon or fantasy violence.",
                    "violenceRealistic": "Declaration for realistic violence.",
                    "violenceRealisticProlongedGraphicOrSadistic": "Declaration for prolonged realistic or sadistic violence.",
                    "contests": "Declaration for contests.",
                    "gambling": "Declaration for gambling, provided as a Boolean value.",
                    "seventeenPlus": "Declaration for a 17+ rating, provided as a Boolean value.",
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
            "AppClip": .rootSchema(
                summary: "The data structure that represents an App Clips resource.",
                attributes: .init(
                    summary: "The attributes that describe an App Clips resource.",
                    properties: [
                        "bundleId": "The related Bundle IDs resource.",
                    ]
                )
            ),
            "AppClipAction": .enumObject(
                summary: "A string that represents the call-to-action verb on the App Clip card.",
                cases: [
                    "OPEN": "",
                    "VIEW": "",
                    "PLAY": "",
                ]
            ),
            "AppClipAdvancedExperience": .rootSchema(
                summary: "The data structure that represents an Advanced App Clip Experiences resource.",
                attributes: .init(
                    summary: "The attributes that describe an Advanced App Clip Experiences resource.",
                    properties: [
                        "action": "The call-to-action verb that appears on the App Clip card.",
                        "businessCategory": "The business category of an advanced App Clip experience; for example, PARKING",
                        "defaultLanguage": "The default language for the advanced App Clip experience.",
                        "isPoweredBy": "A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.",
                        "link": "The invocation URL of the advanced App Clip experience.",
                        "place": "The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from location-based suggestions from Siri Suggestions and the Maps app.",
                        "placeStatus": "A string that describes a place’s match status with Points of Interest (POI) in Apple Maps. PENDING indicates that Apple Maps is currently matching the place to a POI. MATCHED indicates that the provided place information matched a POI, and NO_MATCH indicates that the place doesn’t match a POI in Apple Maps or is in a location not supported by Apple Maps.",
                        "status": "A string that describes the status of an advanced App Clip experience. RECEIVED indicates that users can invoke this experience, DEACTIVATED indicates that the experience is deactivated and users can’t launch the App Clip with this invocation, and APP_TRANSFER_IN_PROGRESS indicates that the experience is part of an app that’s currently transferred to another developer.",
                        "version": "The build version of the App Clip as an integer value; for example, 1234.",
                    ]
                )
            ),
            "AppClipAdvancedExperienceCreateRequest": .createRequest(
                summary: "The request body you use to create an advanced App Clip experience.",
                attributes: .init(properties: [
                    "action": "The call-to-action verb that appears on the App Clip card.",
                    "businessCategory": "The business category of an advanced App Clip experience; for example, PARKING",
                    "defaultLanguage": "The default language for the advanced App Clip experience.",
                    "isPoweredBy": "A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.",
                    "link": "The invocation URL of the advanced App Clip experience you’re creating.",
                    "place": "The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from from location-based suggestions from Siri Suggestions and the Maps app.",
                ]
                )
            ),
            "AppClipAdvancedExperienceImage": .rootSchema(
                summary: "The data structure that represents an image that appears on the App Clip card for an advanced App Clip experience.",
                attributes: .init(
                    summary: "The attributes that describe an Advanced App Clip Experience Images resource.",
                    properties: [
                        "assetDeliveryState": "The state of the App Clip card image asset you uploaded.",
                        "fileName": "The filename of the image asset that appears on the App Clip card for the advanced App Clip experience.",
                        "fileSize": "The size of the image asset that appears on the App Clip card for the advanced App Clip experience.",
                        "imageAsset": "The image asset that appears on the App Clip card of an advanced App Clip experience.",
                        "sourceFileChecksum": "A string that represents the MD5 checksum of the image asset you use for the App Clip card.",
                        "uploadOperations": "Upload operations for the image asset that appears on the App Clip card for an advanced App Clip experience.",
                    ]
                )
            ),
            "AppClipAdvancedExperienceImageCreateRequest": .createRequest(
                summary: "The request body you use to reserve an image asset for an advanced App Clip experience.",
                attributes: .init(properties: [
                    "fileName": "The filename of the image asset that appears on the App Clip card for the advanced App Clip experience.",
                    "fileSize": "The size of the image asset that appears on the App Clip card for the advanced App Clip experience.",
                ])
            ),
            "AppClipAdvancedExperienceImageResponse": .rootSchema(summary: "A response that contains a single Advanced App Clip Experience Images resource."),
            "AppClipAdvancedExperienceImageUpdateRequest": .updateRequest(
                summary: "The request body you use to commit the image asset for an advanced App Clip experience.",
                attributes: .init(properties: [
                    "sourceFileChecksum": "A string that represents the MD5 checksum of the image asset you use for the App Clip card.",
                    "uploaded": "A Boolean value that indicates whether you uploaded the image asset for an advanced App Clip experience.",
                ]
                )
            ),
            "AppClipAdvancedExperienceLanguage": .enumObject(
                summary: "The data structure that represents the language you configure for an advanced App Clip experience.",
                cases: [
                    "AR": "",
                    "CA": "",
                    "CS": "",
                    "DA": "",
                    "DE": "",
                    "EL": "",
                    "EN": "",
                    "ES": "",
                    "FI": "",
                    "FR": "",
                    "HE": "",
                    "HI": "",
                    "HR": "",
                    "HU": "",
                    "ID": "",
                    "IT": "",
                    "JA": "",
                    "KO": "",
                    "MS": "",
                    "NL": "",
                    "NO": "",
                    "PL": "",
                    "PT": "",
                    "RO": "",
                    "RU": "",
                    "SK": "",
                    "SV": "",
                    "TH": "",
                    "TR": "",
                    "UK": "",
                    "VI": "",
                    "ZH": "",
                ]
            ),
            "AppClipAdvancedExperienceLocalization": .rootSchema(
                summary: "The data structure that represents the Advanced App Clip Localizations resource.",
                attributes: .init(
                    summary: "The attributes that describe an Advanced App Clip Experience Localizations resource.",
                    properties: [
                        "language": "A string that identifies the language of the advanced App Clip experience.",
                        "subtitle": "The subtitle that appears on the App Clip card for the advanced App Clip experience.",
                        "title": "The title that appears on the App Clip card for the advanced App Clip experience.",
                    ]
                )
            ),
            "AppClipAdvancedExperienceLocalizationInlineCreate": .rootSchema(
                summary: "The data structure that represents an Advanced App Clip Experience Localization Inline Creates resource.",
                attributes: .init(
                    summary: "The attributes that describe an Advanced App Clip Experience Localization Inline Creates resource.",
                    properties: [
                        "language": "A string that identifies the language of the advanced App Clip experience.",
                        "subtitle": "The subtitle that appears on the App Clip card for the advanced App Clip experience.",
                        "title": "The title that appears on the App Clip card for the advanced App Clip experience.",
                    ]
                )
            ),
            "AppClipAdvancedExperienceResponse": .rootSchema(summary: "A response that contains a single Advanced App Clip Experiences resource."),
            "AppClipAdvancedExperienceUpdateRequest": .updateRequest(
                summary: "The request body you use to update an advanced App Clip experience.",
                attributes: .init(properties: [
                    "action": "The call-to-action verb that appears on the App Clip card.",
                    "businessCategory": "The business category of an advanced App Clip experience; for example, PARKING",
                    "defaultLanguage": "The default language for the advanced App Clip experience.",
                    "isPoweredBy": "A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.",
                    "place": "The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from location-based suggestions from Siri Suggestions and the Maps app.",
                    "removed": "A Boolean value that indicates whether you want to delete an advanced App Clip experience. To delete the advanced App Clip experience, set it to true.",
                ]
                )
            ),
            "AppClipAdvancedExperiencesResponse": .rootSchema(summary: "A response that contains a list of Advanced App Clip Experiences resources."),
            "AppClipAppStoreReviewDetail": .rootSchema(
                summary: "The data structure that represents an App Clip App Store Review Details resource.",
                attributes: .init(
                    summary: "The attributes that describe the App Clip App Store Review Details resource.",
                    properties: [
                        "invocationUrls": "An array of invocation URLs for your App Clip.",
                    ]
                )
            ),
            "AppClipAppStoreReviewDetailCreateRequest": .createRequest(
                summary: "The request body you use to create an App Clip App Store Review Detail.",
                attributes: .init(properties: [
                    "invocationUrls": "An array of invocation URLs for your App Clip.",
                ])
            ),
            "AppClipAppStoreReviewDetailResponse": .rootSchema(summary: "A response that contains a single App Clip App Store Review Details resource."),
            "AppClipAppStoreReviewDetailUpdateRequest": .updateRequest(
                summary: "The request body you use to update App Clip information that you provide to App Store Review.",
                attributes: .init(properties: [
                    "invocationUrls": "An array of invocation URLs for your App Clip.",
                ])
            ),
            "AppClipDefaultExperience": .rootSchema(
                summary: "The data structure that represents a Default App Clip Experiences resource.",
                attributes: .init(
                    summary: "The attributes that describe a Default App Clip Experiences resource.",
                    properties: [
                        "action": "The call-to-action verb that appears on the App Clip card.",
                    ]
                )
            ),
            "AppClipDefaultExperienceCreateRequest": .createRequest(
                summary: "The request body you use to create a default App Clip experience.",
                attributes: .init(properties: [
                    "action": "The call-to-action verb that appears on the App Clip card.",
                ])
            ),
            "AppClipDefaultExperienceLocalization": .rootSchema(
                summary: "The data structure that represents a Default App Clip Experience Localizations resource.",
                attributes: .init(
                    summary: "The attributes that describe a Default App Clip Experience Localizations resource.",
                    properties: [
                        "locale": "The specified locale.",
                        "subtitle": "The subtitle that appears on the App Clip card for the default App Clip experience.",
                    ]
                )
            ),
            "AppClipDefaultExperienceLocalizationCreateRequest": .createRequest(
                summary: "The request body you use to create a Default App Clip Experience Localization.",
                attributes: .init(properties: [
                    "locale": "The specified locale.",
                    "subtitle": "The subtitle that appears on the App Clip card for the default App Clip experience.",
                ])
            ),
            "AppClipDefaultExperienceLocalizationResponse": .rootSchema(summary: "A response that contains a single Default App Clip Experience Localizations resource."),
            "AppClipDefaultExperienceLocalizationsResponse": .rootSchema(summary: "A response that contains a list of Default App Clip Experience Localizations resources."),
            "AppClipDefaultExperienceLocalizationUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Default App Clip Experiences resource.",
                attributes: .init(properties: [
                    "subtitle": "The subtitle that appears on the App Clip card for the default App Clip experience.",
                ])
            ),
            "AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageRequest": .linkagesRequest(summary: "The request body you use to relate a released App Store version with a default App Clip experience."),
            "AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageResponse": .linkagesResponse,
            "AppClipDefaultExperienceResponse": .rootSchema(summary: "A response that contains a single Default App Clip Experiences resource."),
            "AppClipDefaultExperiencesResponse": .rootSchema(summary: "A response that contains a list of Default App Clip Experiences resources."),
            "AppClipDefaultExperienceUpdateRequest": .updateRequest(
                summary: "The request body you use to update a default App Clip experience.",
                attributes: .init(properties: [
                    "action": "The call-to-action verb that appears on the App Clip card.",
                ])
            ),
            "AppClipDomainStatus": .rootSchema(
                summary: "The data structure that represents the App Clip Domain Statuses resource.",
                attributes: .init(
                    summary: "The attributes that describe the App Clip Domain Status resource.",
                    properties: [
                        "domains": "An array of domains you associated with your app or App Clip.",
                        "lastUpdatedDate": "The date when App Store Connect last verified the status of an associated domain.",
                    ]
                )
            ),
            "AppClipDomainStatusResponse": .rootSchema(summary: "A response that contains a single App Clip Domain Statuses resource."),
            "AppClipHeaderImage": .rootSchema(
                summary: "The data structure that represents the image that appears on the App Clip card of a default App Clip experience.",
                attributes: .init(
                    summary: "The attributes that describe the image that appears on the App Clip card of a default App Clip experience.",
                    properties: [
                        "assetDeliveryState": "The state of the App Clip card image asset you uploaded.",
                        "fileName": "The filename of the image asset that appears on the App Clip card for the default App Clip experience.",
                        "fileSize": "The size of the image asset that appears on the App Clip card for the default App Clip experience.",
                        "imageAsset": "The image asset that appears on the App Clip card of a default App Clip experience.",
                        "sourceFileChecksum": "A string that represents the MD5 checksum of the image asset you use for the App Clip card.",
                        "uploadOperations": "Upload operations for the image asset that appears on the App Clip card for a default App Clip experience.",
                    ]
                )
            ),
            "AppClipHeaderImageCreateRequest": .createRequest(
                summary: "The request body you use to reserve an image asset that appears on the App Clip card of a default App Clip experience.",
                attributes: .init(properties: [
                    "fileName": "The filename of the image asset that appears on the App Clip card for the default App Clip experience.",
                    "fileSize": "The size of the image asset that appears on the App Clip card for the default App Clip experience.",
                ])
            ),
            "AppClipHeaderImageResponse": .rootSchema(summary: "A response that contains a single App Clip Header Images resource."),
            "AppClipHeaderImageUpdateRequest": .updateRequest(
                summary: "The request body you use to commit the image asset for a default App Clip experience.",
                attributes: .init(properties: [
                    "sourceFileChecksum": "A string that represents the MD5 checksum of the image asset you use for the App Clip card.",
                    "uploaded": "A Boolean value that indicates whether you uploaded the image asset for an advanced App Clip experience.",
                ])
            ),
            "AppClipResponse": .rootSchema(summary: "A response that contains a single App Clips resource."),
            "AppClipsResponse": .rootSchema(summary: "A response that contains a list of App Clips resources."),
            "AppCustomProductPage": .rootSchema(summary: ""),
            "AppCustomProductPageCreateRequest": .rootSchema(summary: ""),
            "AppCustomProductPageLocalization": .rootSchema(summary: ""),
            "AppCustomProductPageLocalizationCreateRequest": .createRequest(summary: ""),
            "AppCustomProductPageLocalizationInlineCreate": .rootSchema(summary: ""),
            "AppCustomProductPageLocalizationResponse": .rootSchema(summary: ""),
            "AppCustomProductPageLocalizationsResponse": .rootSchema(summary: ""),
            "AppCustomProductPageLocalizationUpdateRequest": .updateRequest(summary: ""),
            "AppCustomProductPageResponse": .rootSchema(summary: ""),
            "AppCustomProductPageUpdateRequest": .updateRequest(summary: ""),
            "AppCustomProductPageVersion": .rootSchema(summary: ""),
            "AppCustomProductPageVersionCreateRequest": .createRequest(summary: ""),
            "AppCustomProductPageVersionInlineCreate": .rootSchema(summary: ""),
            "AppCustomProductPageVersionResponse": .rootSchema(summary: ""),
            "AppCustomProductPageVersionsResponse": .rootSchema(summary: ""),
            "AppCustomProductPagesResponse": .rootSchema(summary: ""),
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
            "AppEvent": .rootSchema(summary: ""),
            "AppEventAssetType": .rootSchema(summary: ""),
            "AppEventCreateRequest": .rootSchema(summary: ""),
            "AppEventLocalization": .rootSchema(summary: ""),
            "AppEventLocalizationCreateRequest": .createRequest(summary: ""),
            "AppEventLocalizationResponse": .rootSchema(summary: ""),
            "AppEventLocalizationUpdateRequest": .updateRequest(summary: ""),
            "AppEventLocalizationsResponse": .rootSchema(summary: ""),
            "AppEventResponse": .rootSchema(summary: ""),
            "AppEventScreenshot": .rootSchema(summary: ""),
            "AppEventScreenshotCreateRequest": .createRequest(summary: ""),
            "AppEventScreenshotResponse": .rootSchema(summary: ""),
            "AppEventScreenshotUpdateRequest": .updateRequest(summary: ""),
            "AppEventScreenshotsResponse": .rootSchema(summary: ""),
            "AppEventUpdateRequest": .updateRequest(summary: ""),
            "AppEventVideoClip": .rootSchema(summary: ""),
            "AppEventVideoClipCreateRequest": .createRequest(summary: ""),
            "AppEventVideoClipResponse": .rootSchema(summary: ""),
            "AppEventVideoClipUpdateRequest": .updateRequest(summary: ""),
            "AppEventVideoClipsResponse": .rootSchema(summary: ""),
            "AppEventsResponse": .rootSchema(summary: ""),
            "AppInfo": .rootSchema(
                summary: "The data structure that represent an App Infos resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Infos resource.",
                    properties: [
                        "appStoreAgeRating": "The app’s age rating as it appears on the App Store for all platforms.",
                        "appStoreState": "The state of an app version in the App Store.",
                        "brazilAgeRating": "The app’s age rating as it appears on the App Store in Brazil for all platforms.",
                        "kidsAgeBand": "A Made for Kids app’s age band.",
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
            "AppPreOrder": .rootSchema(
                summary: "The data structure that represent an App Pre Orders resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Pre Orders resource.",
                    properties: [
                        "appReleaseDate": "",
                        "preOrderAvailableDate": "",
                    ]
                )
            ),
            "AppPreOrderCreateRequest": .createRequest(
                summary: "The request body you use to create an App Pre-Order.",
                attributes: .init(properties: ["appReleaseDate": ""])
            ),
            "AppPreOrderResponse": .rootSchema(summary: "A response that contains a single App Pre-Orders resource."),
            "AppPreOrderUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Pre-Order.",
                attributes: .init(properties: ["appReleaseDate": ""])
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
            "AppPrice": .rootSchema(summary: "The data structure that represent an App Prices resource."),
            "AppPriceInlineCreate": .rootSchema(
                summary: "",
                properties: [
                    "id": "",
                    "type": "",
                ]
            ),
            "AppPricePoint": .rootSchema(
                summary: "The data structure that represent an App Price Points resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Price Points resource.",
                    properties: [
                        "customerPrice": "",
                        "proceeds": "",
                    ]
                )
            ),
            "AppPricePointResponse": .rootSchema(summary: "A response that contains a single App Price Points resource."),
            "AppPricePointsResponse": .rootSchema(summary: "A response that contains a list of App Price Point resources."),
            "AppPricePointV2": .rootSchema(
                summary: "The data structure that represents an App Price Point V2 resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Price Point V2 resource.",
                    properties: [
                        "customerPrice": "The price to the customer.",
                        "proceeds": "The proceeds that go to the developer.",
                    ]
                )
            ),
            "AppPricePointsV2Response": .rootSchema(summary: "A response that contains a list of App Price Points V2 resources."),
            "AppPriceResponse": .rootSchema(summary: "A response that contains a single App Prices resource."),
            "AppPricesResponse": .rootSchema(summary: "A response that contains a list of App Prices resources."),
            "AppPriceTier": .rootSchema(summary: "The data structure that represent an App Price Tiers resource."),
            "AppPriceTierResponse": .rootSchema(summary: "A response that contains a single App Price Tiers resource."),
            "AppPriceTiersResponse": .rootSchema(summary: "A response that contains a list of App Price Tier resources."),
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
            "AppStoreReviewAttachment": .rootSchema(
                summary: "The data structure that represent an App Store Review Attachments resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Store Review Attachments resource.",
                    properties: [
                        "assetDeliveryState": "",
                        "fileName": "",
                        "fileSize": "",
                        "sourceFileChecksum": "",
                        "uploadOperations": "",
                    ]
                )
            ),
            "AppStoreReviewAttachmentCreateRequest": .createRequest(
                summary: "The request body you use to create an App Store Review Attachment.",
                attributes: .init(properties: [
                    "fileName": "",
                    "fileSize": "",
                ])
            ),
            "AppStoreReviewAttachmentResponse": .rootSchema(summary: "A response that contains a single App Store Review Attachments resource."),
            "AppStoreReviewAttachmentsResponse": .rootSchema(summary: "A response that contains a list of App Store Review Attachment resources."),
            "AppStoreReviewAttachmentUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Store Review Attachment.",
                attributes: .init(properties: [
                    "sourceFileChecksum": "",
                    "uploaded": "",
                ])
            ),
            "AppStoreReviewDetail": .rootSchema(
                summary: "The data structure that represent an App Store Review Details resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Store Review Details resource.",
                    properties: [
                        "contactEmail": "",
                        "contactFirstName": "",
                        "contactLastName": "",
                        "contactPhone": "",
                        "demoAccountName": "",
                        "demoAccountPassword": "",
                        "demoAccountRequired": "",
                        "notes": "",
                    ]
                )
            ),
            "AppStoreReviewDetailCreateRequest": .createRequest(
                summary: "The request body you use to create an App Store Review Detail.",
                attributes: .init(properties: [
                    "contactEmail": "",
                    "contactFirstName": "",
                    "contactLastName": "",
                    "contactPhone": "",
                    "demoAccountName": "",
                    "demoAccountPassword": "",
                    "demoAccountRequired": "",
                    "notes": "",
                ])
            ),
            "AppStoreReviewDetailResponse": .rootSchema(summary: "A response that contains a single App Store Review Details resource."),
            "AppStoreReviewDetailUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Store Review Detail.",
                attributes: .init(properties: [
                    "contactEmail": "",
                    "contactFirstName": "",
                    "contactLastName": "",
                    "contactPhone": "",
                    "demoAccountName": "",
                    "demoAccountPassword": "",
                    "demoAccountRequired": "",
                    "notes": "",
                ])
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
            "AppStoreVersionAppClipDefaultExperienceLinkageRequest": .linkagesRequest(summary: "The request body you use to attach a default App Clip experience to an App Store version."),
            "AppStoreVersionAppClipDefaultExperienceLinkageResponse": .linkagesResponse,
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
            "AppStoreVersionExperiment": .rootSchema(summary: ""),
            "AppStoreVersionExperimentCreateRequest": .createRequest(summary: ""),
            "AppStoreVersionExperimentResponse": .rootSchema(summary: ""),
            "AppStoreVersionExperimentTreatment": .rootSchema(summary: ""),
            "AppStoreVersionExperimentTreatmentCreateRequest": .createRequest(summary: ""),
            "AppStoreVersionExperimentTreatmentLocalization": .rootSchema(summary: ""),
            "AppStoreVersionExperimentTreatmentLocalizationCreateRequest": .createRequest(summary: ""),
            "AppStoreVersionExperimentTreatmentLocalizationResponse": .rootSchema(summary: ""),
            "AppStoreVersionExperimentTreatmentLocalizationsResponse": .rootSchema(summary: ""),
            "AppStoreVersionExperimentTreatmentResponse": .rootSchema(summary: ""),
            "AppStoreVersionExperimentTreatmentUpdateRequest": .updateRequest(summary: ""),
            "AppStoreVersionExperimentTreatmentsResponse": .rootSchema(summary: ""),
            "AppStoreVersionExperimentUpdateRequest": .updateRequest(summary: ""),
            "AppStoreVersionExperimentsResponse": .rootSchema(summary: ""),
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
            "AppStoreVersionPhasedRelease": .rootSchema(
                summary: "The data structure that represent an App Store Version Phased Releases resource.",
                attributes: .init(
                    summary: "Attributes that describe an App Store Version Phased Releases resource.",
                    properties: [
                        "currentDayNumber": "",
                        "phasedReleaseState": "",
                        "startDate": "",
                        "totalPauseDuration": "",
                    ]
                )
            ),
            "AppStoreVersionPhasedReleaseCreateRequest": .createRequest(
                summary: "The request body you use to create an App Store Version Phased Release.",
                attributes: .init(properties: ["phasedReleaseState": ""])
            ),
            "AppStoreVersionPhasedReleaseResponse": .rootSchema(summary: "A response that contains a single App Store Version Phased Releases resource."),
            "AppStoreVersionPhasedReleaseUpdateRequest": .updateRequest(
                summary: "The request body you use to update an App Store Version Phased Release.",
                attributes: .init(properties: ["phasedReleaseState": ""])
            ),
            "AppStoreVersionPromotion": .rootSchema(summary: ""),
            "AppStoreVersionPromotionCreateRequest": .createRequest(summary: ""),
            "AppStoreVersionPromotionResponse": .rootSchema(summary: ""),
            "AppStoreVersionReleaseRequest": .rootSchema(summary: "The data structure that represents an App Store Version Release Request resource."),
            "AppStoreVersionReleaseRequestCreateRequest": .createRequest(summary: "The request body you use to manually release an App Store approved version of your app."),
            "AppStoreVersionReleaseRequestResponse": .rootSchema(summary: "A response that contains a single App Store Version Release Request resource."),
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
            "AppStoreVersionSubmission": .rootSchema(summary: "The data structure that represents an App Store Version Submissions resource."),
            "AppStoreVersionSubmissionCreateRequest": .createRequest(summary: "The request body you use to create an App Store Version Submission."),
            "AppStoreVersionSubmissionResponse": .rootSchema(summary: "A response that contains a single App Store Version Submissions resource."),
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
            "BetaAppClipInvocation": .rootSchema(
                summary: "The data structure that represents a Beta App Clip Invocations resource.",
                attributes: .init(
                    summary: "The attributes that describe a Beta App Clip Invocations resource.",
                    properties: [
                        "url": "The invocation URL you configure for testers who use the TestFlight to launch your App Clip.",
                    ]
                )
            ),
            "BetaAppClipInvocationCreateRequest": .createRequest(
                summary: "The request body you use to create an App Clip invocation for testers.",
                attributes: .init(properties: [
                    "url": "The invocation URL you configure for testers who use the TestFlight to launch your App Clip.",
                ])
            ),
            "BetaAppClipInvocationLocalization": .rootSchema(
                summary: "The data structure that represents a Beta App Clip Invocation Localizations resource.",
                attributes: .init(
                    summary: "The attributes that describe a Beta App Clip Invocation Localizations resource.",
                    properties: [
                        "locale": "The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.",
                        "title": "The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.",
                    ]
                )
            ),
            "BetaAppClipInvocationLocalizationCreateRequest": .createRequest(
                summary: "The request body you use to create a Beta App Clip Localization.",
                attributes: .init(properties: [
                    "locale": "The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.",
                    "title": "The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.",
                ])
            ),
            "BetaAppClipInvocationLocalizationInlineCreate": .rootSchema(
                summary: "The data structure that represents a Beta App Clip Invocation Localization Inline Creates resource.",
                attributes: .init(
                    summary: "The attributes that describe a Beta App Clip Invocation Localization Inline Creates resource.",
                    properties: [
                        "locale": "The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.",
                        "title": "The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.",
                    ]
                )
            ),
            "BetaAppClipInvocationLocalizationResponse": .rootSchema(summary: "A response that contains a single Beta App Clip Invocation Localizations resource."),
            "BetaAppClipInvocationLocalizationUpdateRequest": .updateRequest(
                summary: "The request body you use to update localized text that appears on the App Clip card for testers.",
                attributes: .init(properties: [
                    "title": "The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.",
                ])
            ),
            "BetaAppClipInvocationResponse": .rootSchema(summary: "A response that contains a single Beta App Clip Invocations resource."),
            "BetaAppClipInvocationsResponse": .rootSchema(summary: "A response that contains a list of Beta App Clip Invocations resources."),
            "BetaAppClipInvocationUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Beta App Clip Invocation.",
                attributes: .init(properties: [
                    "url": "The invocation URL you configure for testers who use the TestFlight to launch your App Clip.",
                ])
            ),
            "BetaAppLocalization": .rootSchema(
                summary: "The data structure that represents a Beta App Localizations resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta App Localizations resource.",
                    properties: [
                        "description": "A description of your app that highlights features and functionality.",
                        "feedbackEmail": "An email address to which beta testers can send feedback. Also appears as the reply-to address for TestFlight invitation emails.",
                        "locale": "The specified locale. Refer to Table 1 for possible values.",
                        "marketingUrl": "A URL with information about your app. This URL is visible to testers in the TestFlight app.",
                        "privacyPolicyUrl": "A URL that links to your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data or as otherwise required by law.",
                        "tvOsPrivacyPolicy": "Your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data, or as otherwise required by law.",
                    ]
                )
            ),
            "BetaAppLocalizationCreateRequest": .createRequest(
                summary: "The request body you use to create a Beta App Localization.",
                attributes: .init(properties: [
                    "description": "A description of your app that highlights features and functionality.",
                    "feedbackEmail": "An email address to which beta testers can send feedback. Also appears as the reply-to address for TestFlight invitation emails.",
                    "locale": "The specified locale. Refer to Table 1 for possible values.",
                    "marketingUrl": "A URL with information about your app. This URL is visible to testers in the TestFlight app.",
                    "privacyPolicyUrl": "A URL that links to your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data or as otherwise required by law.",
                    "tvOsPrivacyPolicy": "Your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data, or as otherwise required by law.",
                ])
            ),
            "BetaAppLocalizationResponse": .rootSchema(summary: "A response that contains a single Beta App Localizations resource."),
            "BetaAppLocalizationsResponse": .rootSchema(summary: "A response that contains a list of Beta App Localization resources."),
            "BetaAppLocalizationUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Beta App Localization.",
                attributes: .init(properties: [
                    "description": "A description of your app that highlights features and functionality.",
                    "feedbackEmail": "An email address to which beta testers can send feedback. Also appears as the reply-to address for TestFlight invitation emails.",
                    "marketingUrl": "A URL with information about your app. This URL is visible to testers in the TestFlight app",
                    "privacyPolicyUrl": "A URL that links to your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data or as otherwise required by law.",
                    "tvOsPrivacyPolicy": "Your company’s privacy policy. Privacy policies are recommended for all apps that collect user or device-related data, or as otherwise required by law.",
                ])
            ),
            "BetaAppReviewDetail": .rootSchema(
                summary: "The data structure that represents a Beta App Review Details resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta App Review Details resource.",
                    properties: [
                        "contactEmail": "Email address of contact in case communication is needed with the beta app review.",
                        "contactFirstName": "First name of contact in case communication is needed with the beta app review.",
                        "contactLastName": "Last name of contact in case communication is needed with the beta app review.",
                        "contactPhone": "Phone number of contact in case communication is needed with the beta app review.",
                        "demoAccountName": "The user name to sign in to your app to review its features.",
                        "demoAccountPassword": "The password to sign in to your app to review its features.",
                        "demoAccountRequired": "A Boolean value that indicates if sign-in information is required to review all the features of your app. If users sign in using social media, provide information for an account for review. Credentials must be valid and active for duration of review.",
                        "notes": "Additional information about your app that can help during the review process. Do not include demo account details. Review notes have a maximum of 4,000 characters.",
                    ]
                )
            ),
            "BetaAppReviewDetailResponse": .rootSchema(summary: "A response that contains a single Beta App Review Details resource."),
            "BetaAppReviewDetailsResponse": .rootSchema(summary: "A response that contains a list of Beta App Review Detail resources."),
            "BetaAppReviewDetailUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Beta App Review Detail.",
                attributes: .init(properties: [
                    "contactEmail": "Email address of contact in case communication is needed with the beta app review.",
                    "contactFirstName": "First name of contact in case communication is needed with the beta app review.",
                    "contactLastName": "Last name of contact in case communication is needed with the beta app review.",
                    "contactPhone": "Phone number of contact in case communication is needed with the beta app review.",
                    "demoAccountName": "The user name to sign in to your app to review its features.",
                    "demoAccountPassword": "The password to sign in to your app to review its features.",
                    "demoAccountRequired": "A Boolean value that indicates if sign-in information is required to review all the features of your app. If users sign in using social media, provide information for an account for review. Credentials must be valid and active for duration of review.",
                    "notes": "Additional information about your app that can help during the review process. Do not include demo account details. Review notes have a maximum of 4,000 characters.",
                ])
            ),
            "BetaAppReviewSubmission": .rootSchema(
                summary: "The data structure that represents a Beta App Review Submissions resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta App Review Submissions resource.",
                    properties: [
                        "betaReviewState": "A state that indicates the current status of the beta app review submission.",
                    ]
                )
            ),
            "BetaAppReviewSubmissionCreateRequest": .createRequest(summary: "The request body you use to create a Beta App Review Submission."),
            "BetaAppReviewSubmissionResponse": .rootSchema(summary: "A response that contains a single Beta App Review Submissions resource."),
            "BetaAppReviewSubmissionsResponse": .rootSchema(summary: "A response that contains a list of Beta App Review Submission resources."),
            "BetaBuildLocalization": .rootSchema(
                summary: "The data structure that represents a Beta Build Localizations resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta Build Localizations resource.",
                    properties: [
                        "locale": "The specified locale. Refer to Table 1 for possible values.",
                        "whatsNew": "A field that describes changes and additions to a build and indicates features you would like your users to test.",
                    ]
                )
            ),
            "BetaBuildLocalizationCreateRequest": .createRequest(
                summary: "The request body you use to create a Beta Build Localization.",
                attributes: .init(properties: [
                    "locale": "The specified locale. Refer to Table 1 for possible values.",
                    "whatsNew": "A field that describes changes and additions to a build and indicates features you would like your users to test.",
                ])
            ),
            "BetaBuildLocalizationResponse": .rootSchema(summary: "A response that contains a single Beta Build Localizations resource."),
            "BetaBuildLocalizationsResponse": .rootSchema(summary: "A response that contains a list of Beta Build Localization resources."),
            "BetaBuildLocalizationUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Beta Build Localization.",
                attributes: .init(properties: [
                    "whatsNew": "A field that describes changes and additions to a build and indicates features you would like your users to test.",
                ])
            ),
            "BetaGroup": .rootSchema(
                summary: "The data structure that represents a Beta Groups resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta Groups resource.",
                    properties: [
                        "isInternalGroup": "A Boolean value that indicates whether the group is internal. Only existing users of App Store Connect may be added for internal beta testing.",
                        "name": "The name for the beta group.",
                        "publicLink": "The URL of the public link provided to your app's beta testers.",
                        "publicLinkEnabled": "A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.",
                        "publicLinkId": "The ID as part of the URL of the public link.",
                        "publicLinkLimit": "The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.",
                        "publicLinkLimitEnabled": "A Boolean value that limits the number of testers who can join the beta group using the public link.",
                        "createdDate": "The creation date of the beta group.",
                        "feedbackEnabled": "",
                    ]
                )
            ),
            "BetaGroupBetaTestersLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove beta testers from a beta group."),
            "BetaGroupBetaTestersLinkagesResponse": .linkagesResponse,
            "BetaGroupBuildsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove builds from a beta group."),
            "BetaGroupBuildsLinkagesResponse": .linkagesResponse,
            "BetaGroupResponse": .rootSchema(summary: "A response that contains a single Beta Groups resource."),
            "BetaGroupCreateRequest": .createRequest(
                summary: "The request body you use to create a Beta Group.",
                attributes: .init(properties: [
                    "name": "The name for the beta group.",
                    "publicLinkEnabled": "A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.",
                    "publicLinkLimit": "The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.",
                    "publicLinkLimitEnabled": "A Boolean value that limits the number of testers who can join the beta group using the public link.",
                    "feedbackEnabled": "",
                ])
            ),
            "BetaGroupsResponse": .rootSchema(summary: "A response that contains a list of Beta Group resources."),
            "BetaGroupUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Beta Group.",
                attributes: .init(properties: [
                    "name": "The name for the beta group.",
                    "publicLinkEnabled": "A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.",
                    "publicLinkLimit": "The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.",
                    "publicLinkLimitEnabled": "A Boolean value that limits the number of testers who can join the beta group using the public link.",
                    "feedbackEnabled": "",
                ])
            ),
            "BetaInviteType": .enumObject(
                summary: "String that indicates how you offer a beta invitation.",
                cases: [
                    "EMAIL": "",
                    "PUBLIC_LINK": "",
                ]
            ),
            "BetaLicenseAgreement": .rootSchema(
                summary: "The data structure that represents a Beta License Agreements resource.",
                attributes: .init(
                    summary: "Attributes that describe a Beta License Agreements resource.",
                    properties: [
                        "agreementText": "The license agreement text for your beta app that displays to users.",
                    ]
                )
            ),
            "BetaLicenseAgreementResponse": .rootSchema(summary: "A response that contains a single Beta License Agreements resource."),
            "BetaLicenseAgreementsResponse": .rootSchema(summary: "A response that contains a list of Beta License Agreement resources."),
            "BetaLicenseAgreementUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Beta License Agreement.",
                attributes: .init(properties: [
                    "agreementText": "The license agreement text for your beta app that displays to users.",
                ])
            ),
            "BetaReviewState": .enumObject(
                summary: "String that indicates the review state of a beta app.",
                cases: [
                    "WAITING_FOR_REVIEW": "",
                    "IN_REVIEW": "",
                    "REJECTED": "",
                    "APPROVED": "",
                ]
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
            "BetaTesterInvitation": .rootSchema(summary: "The data structure that represents a Beta Tester Invitations resource."),
            "BetaTesterInvitationCreateRequest": .createRequest(summary: "The request body you use to create a Beta Tester Invitation."),
            "BetaTesterInvitationResponse": .rootSchema(summary: "A response that contains a single Beta Tester Invitations resource."),
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
            "BuildBetaDetail": .rootSchema(
                summary: "The data structure that represents a Build Beta Details resource.",
                attributes: .init(
                    summary: "Attributes that describe a Build Beta Details resource.",
                    properties: [
                        "autoNotifyEnabled": "A Boolean value that enables you to send test invitations to users automatically when the build is available to external groups.",
                        "externalBuildState": "A state that indicates if the build is available for external testing.",
                        "internalBuildState": "A state that indicates if the build is available for internal testing.",
                    ]
                )
            ),
            "BuildBetaDetailResponse": .rootSchema(summary: "A response that contains a single Build Beta Details resource."),
            "BuildBetaDetailsResponse": .rootSchema(summary: "A response that contains a list of Build Beta Detail resources."),
            "BuildBetaDetailUpdateRequest": .updateRequest(
                summary: "The request body you use to update a Build Data Detail.",
                attributes: .init(properties: [
                    "autoNotifyEnabled": "A Boolean value that enables you to send test invitations to users automatically when the build is available to external groups.",
                ])
            ),
            "BuildBetaGroupsLinkagesRequest": .linkagesRequest(summary: "A request body you use to add or remove beta groups from a build."),
            "BuildBetaNotification": .rootSchema(summary: "The data structure that represents a Build Beta Notifications resource."),
            "BuildBetaNotificationCreateRequest": .createRequest(summary: "The request body you use to create a Build Beta Notification."),
            "BuildBetaNotificationResponse": .rootSchema(summary: "A response that contains a single Build Beta Notifications resource."),
            "BuildBundle": .rootSchema(
                summary: "The data structure that represents Build Bundles resource.",
                attributes: .init(
                    summary: "The attributes that describe a Build Bundles resource.",
                    properties: [
                        "bundleId": "The bundle ID of the build bundle.",
                        "bundleType": "The type of the build bundle.",
                        "deviceProtocols": "The protocols that the app uses to communicate with external accessory hardware. For more information, see UISupportedExternalAccessoryProtocols.",
                        "dSYMUrl": "The URL to the symbolication file for the app or App Clip.",
                        "entitlements": "Entitlement information for your app or App Clip.",
                        "fileName": "The name of the build bundle.",
                        "hasOnDemandResources": "A Boolean value that indicates whether the build bundle contains on-demand resources.",
                        "hasPrerenderedIcon": "A Boolean value that indicates whether the build bundle contains a pre-rendered app icon.",
                        "hasSirikit": "A Boolean value that indicates whether the build bundle contains an app or App Clip that allows users to interact with it through voice, intelligent suggestions, and personalized workflows.",
                        "includesSymbols": "A Boolean value that indicates whether the build bundle includes symbol information for debugging and crash reports.",
                        "isIosBuildMacAppStoreCompatible": "A Boolean value that indicates whether an iOS app included in the build bundle is included on the Mac App Store.",
                        "locales": "The specified locale. Refer to BetaAppLocalizationCreateRequest.Data.Attributes for possible values.",
                        "platformBuild": "The build number of the OS you used to build the app or App Clip.",
                        "requiredCapabilities": "An array of capabilities that your app or App Clip requires.",
                        "sdkBuild": "A string that identifies the SDK you used to build your app or App Clip.",
                        "supportedArchitectures": "An array of supported CPU architectures that your app or App Clip supports.",
                        "usesLocationServices": "A Boolean value that indicates whether the app or App Clip included in the build bundle uses location services.",
                    ]
                )
            ),
            "BuildBundleFileSize": .rootSchema(
                summary: "The data structure that represents a Build Bundle File Sizes resource.",
                attributes: .init(
                    summary: "The attributes that describe a Build Bundle File Sizes resource.",
                    properties: [
                        "deviceModel": "A string that identifies the Apple device model.",
                        "downloadBytes": "An integer value that represents the download size of the build bundle in bytes.",
                        "installBytes": "An integer value that represents the installation size of the build bundle in bytes.",
                        "osVersion": "A string that identifies the OS version supported by the app or App Clip.",
                    ]
                )
            ),
            "BuildBundleFileSizesResponse": .rootSchema(summary: "A response that contains a list of Build Bundle File Sizes resources."),
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
            "BuildAudienceType": .enumObject(
                summary: "",
                cases: [
                    "INTERNAL_ONLY": "",
                    "APP_STORE_ELIGIBLE": "",
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
            "CiAction": .rootSchema(
                summary: "The data structure that represents an Actions resource.",
                properties: [
                    "actionType": "The type of the action.",
                    "buildDistributionAudience": "A type that indicates whether a build’s artifact is eligible for release on the App Store.",
                    "destination": "A string that describes the destination Xcode Cloud uses for an action.",
                    "isRequiredToPass": "A Boolean value that indicates whether the action must succeed in order for a build to succeed.",
                    "name": "The name of the action; for example, archive or test.",
                    "platform": "The platform Xcode Cloud uses for the action.",
                    "scheme": "The name of the scheme that Xcode Cloud uses to perform the action.",
                    "testConfiguration": "An action’s test configuration. Only set this field for test actions.",
                ]
            ),
            "CiActionType": .enumObject(
                summary: "A string that represents the type of an Xcode Cloud workflow’s action.",
                cases: [
                    "BUILD": "The action is a build action.",
                    "ANALYZE": "The action is an analyze action.",
                    "TEST": "The action is a test action.",
                    "ARCHIVE": "The action is an archive action.",
                ]
            ),
            "CiArtifact": .rootSchema(
                summary: "The data structure that represents an Artifacts resource.",
                attributes: .init(
                    summary: "The attributes that describe an Artifacts resource.",
                    properties: [
                        "downloadUrl": "The URL you use to download the Xcode Cloud build artifact.",
                        "fileName": "The artifact’s filename as a string.",
                        "fileSize": "An integer value that represents the artifact’s file size.",
                        "fileType": "A string that describes the type of the artifact.",
                    ]
                )
            ),
            "CiArtifactResponse": .rootSchema(summary: "A response that contains a single Artifacts resource."),
            "CiArtifactsResponse": .rootSchema(summary: "A response that contains a list of Artifacts resources."),
            "CiBranchPatterns": .rootSchema(
                summary: "Case-sensitive patterns Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.",
                properties: [
                    "isAllMatch": "A Boolean value that indicates whether a start condition’s settings apply to all branches. If true, the patterns attribute isn’t expected. If false, the patterns attribute is required.",
                    "patterns": "The list of case-sensitive patterns Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.",
                ]
            ),
            "CiBranchPatterns.Patterns": .rootSchema(
                summary: "A case-sensitive pattern Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.",
                properties: [
                    "isPrefix": "A Boolean value that indicates whether the pattern matches the start of a branch name, or the exact branch name.",
                    "pattern": "A case-sensitive string. If the string is a prefix pattern, Xcode Cloud starts a build when the changed branch name starts with this string. Otherwise, Xcode Cloud starts a build when the changed branch name exactly matches this string.",
                ]
            ),
            "CiBranchStartCondition": .rootSchema(
                summary: "Settings for a start condition that starts a build if a branch changes.",
                properties: [
                    "autoCancel": "A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.",
                    "filesAndFoldersRule": "Settings Xcode Cloud uses to determine whether a change to a branch should start a new build or not.",
                    "source": "The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a branch.",
                ]
            ),
            "CiBuildAction": .rootSchema(
                summary: "The data structure that represents a Build Actions resource.",
                attributes: .init(
                    summary: "The attributes that describe a Build Actions resource.",
                    properties: [
                        "actionType": "The type of the build action.",
                        "completionStatus": "The status of the action.",
                        "executionProgress": "A string that indicates the progress of the build action.",
                        "finishedDate": "The date and time when Xcode Cloud finished performing the action.",
                        "isRequiredToPass": "A Boolean value that indicates whether the action must succeed in order for a build to succeed.",
                        "issueCounts": "An integer value that represents the number of issues Xcode Cloud encountered when it performed the action.",
                        "name": "The name of the build action; for example, Archive iOS.",
                        "startedDate": "The date and time when Xcode Cloud started performing the action.",
                    ]
                )
            ),
            "CiBuildActionResponse": .rootSchema(summary: "A response that contains a single Build Actions resource."),
            "CiBuildActionsResponse": .rootSchema(summary: "A response that contains a list of Build Actions resources."),
            "CiBuildRun": .rootSchema(
                summary: "The data structure that represents a Build Runs resource.",
                attributes: .init(
                    summary: "The attributes that describe a Build Runs resource.",
                    properties: [
                        "cancelReason": "A string that indicates the reason for a canceled build.",
                        "completionStatus": "A string that indicates the status of a completed build.",
                        "createdDate": "The date and time when Xcode Cloud created the build.",
                        "destinationCommit": "Detailed information about the commit of a pull request build’s target branch. This value is only available to builds from pull requests.",
                        "executionProgress": "A string that indicates the progress of the build action.",
                        "finishedDate": "The date and time when Xcode Cloud completed the build.",
                        "isPullRequestBuild": "A Boolean value that indicates whether the build was started by a change to a pull request.",
                        "issueCounts": "An integer value that represents the number of issues Xcode Cloud encountered when it performed the build.",
                        "number": "The Xcode Cloud build number.",
                        "sourceCommit": "Detailed information about the commit of a pull request build’s source branch. This value is only available to builds from pull requests.",
                        "startedDate": "The date and time when Xcode Cloud started the build.",
                        "startReason": "A string that indicates what started the build.",
                    ]
                )
            ),
            "CiBuildRunCreateRequest": .createRequest(
                summary: "The request body you use to start a new Xcode Cloud build.",
                attributes: .init(
                    properties: [
                        "clean": "A Boolean value that indicates whether Xcode Cloud should perform a clean build.",
                    ])
            ),
            "CiBuildRunResponse": .rootSchema(summary: "A response that contains a single Build Runs resource."),
            "CiBuildRunsResponse": .rootSchema(summary: "A response that contains a list of Build Runs resources."),
            "CiCompletionStatus": .enumObject(
                summary: "A string that represents the completion status of an Xcode Cloud build.",
                cases: [
                    "SUCCEEDED": "Xcode Cloud successfully completed a build.",
                    "FAILED": "The Xcode Cloud build failed; for example, if you configure the Required to Pass setting for a test action and a unit test fails. For more information, see Add a Test Action in [Configuring Your Xcode Cloud Workflow’s Actions](https://developer.apple.com/documentation/xcode/configuring-your-xcode-cloud-workflow-s-actions).",
                    "ERRORED": "Xcode Cloud encountered an internal error when it performed the build.",
                    "CANCELED": "Xcode Cloud canceled the build because you manually canceled an ongoing build or because you enabled the Auto-cancel Builds setting for a workflow. For more information about the Auto-cancel Builds setting, see [Xcode Cloud Workflow Reference](https://developer.apple.com/documentation/xcode/xcode-cloud-workflow-reference).",
                    "SKIPPED": "Xcode Cloud skipped the build; for example, if you configure the Auto-cancel Builds setting for a workflow and push many changes in quick succession.",
                ]
            ),
            "CiExecutionProgress": .enumObject(
                summary: "A string that represents the progress of an ongoing Xcode Cloud build.",
                cases: [
                    "PENDING": "Xcode Cloud hasn’t started the build.",
                    "RUNNING": "Xcode Cloud is performing the build.",
                    "COMPLETE": "Xcode Cloud completed the build.",
                ]
            ),
            "CiFilesAndFoldersRule": .rootSchema(
                summary: "Settings Xcode Cloud uses to determine whether a change should start a new build or not.",
                properties: [
                    "matchers": "Directory and file information Xcode Cloud uses to determine if a change to a file or directory matches a custom start condition.",
                    "mode": "A string that indicates whether a workflow’s start condition’s Files and Folders setting should start a new build or not for a change.",
                ]
            ),
            "CiGitRefKind": .enumObject(
                summary: "A string that represents the kind of a Git References resource.",
                cases: [
                    "BRANCH": "The Git reference represents a branch.",
                    "TAG": "The Git reference represents a tag.",
                ]
            ),
            "CiGitUser": .rootSchema(
                summary: "The data structure that represents a Git Users resource.",
                properties: [
                    "avatarUrl": "The URL to the Git user’s avatar image.",
                    "displayName": "The name of the Git user.",
                ]
            ),
            "CiIssue": .rootSchema(
                summary: "The data structure that represents an Issues resource.",
                attributes: .init(
                    summary: "The attributes that describe an Issues resource.",
                    properties: [
                        "category": "A string representing the issue’s category; for example, the name of the build phase where the issue occurred.",
                        "fileSource": "The file and line number where Xcode Cloud encountered an issue.",
                        "issueType": "A string that indicates what kind of issue Xcode Cloud encountered.",
                        "message": "Information about the issue that occurred.",
                    ]
                )
            ),
            "CiIssueCounts": .rootSchema(
                summary: "The data structure that represents an Issue Counts resource.",
                properties: [
                    "analyzerWarnings": "The number of analyzer warnings.",
                    "errors": "The number of errors.",
                    "testFailures": "The number of failing tests.",
                    "warnings": "The number of warnings.",
                ]
            ),
            "CiIssueResponse": .rootSchema(summary: "A response that contains a single Issues resource."),
            "CiIssuesResponse": .rootSchema(summary: "A response that contains a list of Issues resources."),
            "CiMacOsVersion": .rootSchema(
                summary: "The data structure that represents a macOS Versions resource.",
                attributes: .init(
                    summary: "The attributes that describe a macOS Versions resource.",
                    properties: [
                        "name": "The name of the macOS version.",
                        "version": "The macOS version of the simulated environment.",
                    ]
                )
            ),
            "CiMacOsVersionResponse": .rootSchema(summary: "A response that contains a single macOS Versions resource."),
            "CiMacOsVersionsResponse": .rootSchema(summary: "A response that contains a list of macOS Versions resources."),
            "CiProduct": .rootSchema(
                summary: "The data structure that represents a Products resource.",
                attributes: .init(
                    summary: "The attributes that describe a Products resource.",
                    properties: [
                        "createdDate": "The date when you created the Xcode Cloud product.",
                        "name": "The name of the Xcode Cloud product.",
                        "productType": "A string that indicates whether the Xcode Cloud product is a framework or an app.",
                    ]
                )
            ),
            "CiProductResponse": .rootSchema(summary: "A response that contains a single Products resource."),
            "CiProductsResponse": .rootSchema(summary: "A response that contains a list of Products resources."),
            "CiPullRequestStartCondition": .rootSchema(
                summary: "Settings for a start condition that starts a build if a pull request changes.",
                properties: [
                    "destination": "The destination branch name and custom patterns you configure for a workflow that starts a new build for changes to a pull request.",
                    "filesAndFoldersRule": "The custom rule that determines whether Xcode Cloud starts a build or not based on a pull request’s changes to files.",
                    "source": "The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a pull request.",
                    "autoCancel": "A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.",
                ]
            ),
            "CiScheduledStartCondition": .rootSchema(
                summary: "Settings for a start condition that starts a build based on a schedule.",
                properties: [
                    "schedule": "The schedule information you configure for a workflow that starts a new build based on a schedule.",
                    "source": "The source branch name and custom patterns you configure for a workflow that starts a new build on a schedule.",
                ]
            ),
            "CiStartConditionFileMatcher": .rootSchema(
                summary: "The data structure that represents a Start Condition File Matchers resource.",
                properties: [
                    "directory": "The directory you configure for a custom start condition’s Files and Folders setting.",
                    "fileExtension": "The file extension you configure for a custom start condition’s Files and Folders setting.",
                    "fileName": "The filename you configure for a custom start condition’s Files and Folders setting.",
                ]
            ),
            "CiTagPatterns": .rootSchema(
                summary: "Case-sensitive patterns Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.",
                properties: [
                    "isAllMatch": "A Boolean value that indicates whether a start condition’s settings apply to all tags. If true, the patterns attribute isn’t expected. If false, the patterns attribute is required.",
                    "patterns": "The list of case-sensitive patterns Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.",
                ]
            ),
            "CiTagPatterns.Patterns": .rootSchema(
                summary: "A case-sensitive pattern Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.",
                properties: [
                    "isPrefix": "A Boolean value that indicates whether the pattern matches the start of a tag name, or the exact tag name.",
                    "pattern": "A case-sensitive string. If the string is a prefix pattern, Xcode Cloud starts a build when the changed tag name starts with this string. Otherwise, Xcode Cloud starts a build when the changed tag name exactly matches this string.",
                ]
            ),
            "CiTagStartCondition": .rootSchema(
                summary: "Settings for a start condition that starts a build if a Git tag changes.",
                properties: [
                    "autoCancel":
                        "A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.",
                    "filesAndFoldersRule":
                        "Settings Xcode Cloud uses to determine whether a change to a tag should start a new build or not.",
                    "source":
                        "The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a Git tag.",
                ]
            ),
            "CiTestDestination": .rootSchema(
                summary: "The test destination of a test action Xcode Cloud performs.",
                properties: [
                    "deviceTypeIdentifier": "A string that uniquely identifies the simulated device Xcode Cloud uses for a test action; for example, com.apple.CoreSimulator.SimDeviceType.iPhone-12.",
                    "deviceTypeName": "The display name of the simulated device Xcode Cloud uses for a test action; for example, iPhone 12.",
                    "kind": "A string that indicates whether a test destination is a simulated device or a Mac.",
                    "runtimeIdentifier": "A string that identifies the simulated environment Xcode Cloud uses for a test action.",
                    "runtimeName": "The name of the operating system of the simulated environment Xcode Cloud uses for a test action.",
                ]
            ),
            "CiTestDestinationKind": .enumObject(
                summary: "The string that represents the kind of a test destination.",
                cases: [
                    "SIMULATOR": "The test destination is a simulated device.",
                    "MAC": "The test destination is a Mac.",
                ]
            ),
            "CiTestResult": .rootSchema(
                summary: "The data structure that represents a Test Results resource.",
                attributes: .init(
                    summary: "The attributes that describe a Test Results resource.",
                    properties: [
                        "className": "The name of the class that contained the tests Xcode Cloud performed.",
                        "destinationTestResults": "Information about the test results for a specific test destination.",
                        "fileSource": "Information about a test file.",
                        "message": "A message generated by a test.",
                        "name": "The name of the test result; for example, ExampleName.",
                        "status": "Test status information; for example, whether the test succeeded or failed.",
                    ]
                )
            ),
            "CiTestResultResponse": .rootSchema(summary: "A response that contains a single Test Results resource."),
            "CiTestResultsResponse": .rootSchema(summary: "A response that contains a list of Test Results resources."),
            "CiTestStatus": .enumObject(
                summary: "A string that represents test status information.",
                cases: [
                    "SUCCESS": "The tests passed.",
                    "FAILURE": "The tests failed.",
                    "MIXED": "Some tests passed and some failed.",
                    "SKIPPED": "Xcode Cloud skipped some tests.",
                    "EXPECTED_FAILURE": "Tests failed that you marked as expected to fail with [XCTExpectFailure](https://developer.apple.com/documentation/xctest/3726077-xctexpectfailure).",
                ]
            ),
            "CiWorkflow": .rootSchema(
                summary: "The data structure that represents a Workflows resource.",
                attributes: .init(
                    summary: "The attributes that describe a Workflows resource.",
                    properties: [
                        "actions": "The actions that are part of the workflow.",
                        "clean": "A Boolean value that indicates whether Xcode Cloud should perform a clean build.",
                        "containerFilePath": "The relative path to your Xcode project or workspace.",
                        "description": "The workflow’s description.",
                        "isEnabled": "A Boolean value that indicates whether the workflow is active or deactivated.",
                        "isLockedForEditing": "A Boolean value that indicates whether edits to the workflow are restricted.",
                        "lastModifiedDate": "The date and time when the workflow was last modified.",
                        "name": "The name of the Xcode Cloud workflow; for example, My Workflow.",
                        "pullRequestStartCondition": "The workflow’s start condition for pull request changes.",
                        "scheduledStartCondition": "The workflow’s start condition that starts new builds on a custom schedule.",
                        "branchStartCondition": "The workflow’s start condition that starts new builds for changes to a branch.",
                        "tagStartCondition": "The workflow’s start condition that starts new builds for changes to a tag.",
                    ]
                )
            ),
            "CiWorkflowCreateRequest": .createRequest(
                summary: "The request body you use to create a new Xcode Cloud workflow.",
                attributes: .init(
                    properties: [
                        "actions": "The workflow’s actions.",
                        "clean": "A Boolean value that indicates whether Xcode Cloud should perform a clean build.",
                        "containerFilePath": "The relative path to your Xcode project or workspace.",
                        "description": "The workflow description.",
                        "isEnabled": "A Boolean value that indicates whether the workflow is active or deactivated.",
                        "name": "The name of the workflow you want to create; for example, My New Workflow.",
                        "isLockedForEditing": "A Boolean value that indicates whether edits to the workflow are restricted.",
                        "pullRequestStartCondition": "A start condition that starts new builds for changes to a pull request.",
                        "scheduledStartCondition": "A start condition that starts new builds based on a custom schedule.",
                        "branchStartCondition": "A start condition that starts new builds for changes to a branch.",
                        "tagStartCondition": "A start condition that starts new builds for changes to a tag.",
                    ]
                )
            ),
            "CiWorkflowUpdateRequest": .updateRequest(
                summary: "The request body you use to update an Xcode Cloud workflow.",
                attributes: .init(properties: [
                    "actions": "The workflow’s actions.",
                    "clean": "A Boolean value that indicates whether Xcode Cloud should perform a clean build.",
                    "containerFilePath": "The path to your Xcode project or workspace.",
                    "description": "The workflow description.",
                    "isEnabled": "A Boolean value that indicates whether the workflow is active or deactivated.",
                    "name": "The name of the workflow you want to create; for example, My Workflow.",
                    "isLockedForEditing": "A Boolean value that indicates whether edits to the workflow are restricted.",
                    "pullRequestStartCondition": "The workflow’s start condition for pull request changes.",
                    "scheduledStartCondition": "The workflow’s start condition that starts new builds on a custom schedule.",
                    "branchStartCondition": "The workflow’s start condition that starts new builds for changes to a branch.",
                    "tagStartCondition": "The workflow’s start condition that starts new builds for changes to a tag.",
                ])
            ),
            "CiWorkflowResponse": .rootSchema(summary: "A response that contains a single Workflows resource."),
            "CiWorkflowsResponse": .rootSchema(summary: "A response that contains a list of Workflows resources."),
            "CiXcodeVersion": .rootSchema(
                summary: "The data structure that represents an Xcode Versions resource.",
                attributes: .init(
                    summary: "",
                    properties: [
                        "name": "The name of the Xcode version.",
                        "testDestinations": "A list of the Xcode version’s available test destinations.",
                        "version": "The Xcode version.",
                    ]
                )
            ),
            "CiXcodeVersionResponse": .rootSchema(summary: "A response that contains a single Xcode Versions resource."),
            "CiXcodeVersionsResponse": .rootSchema(summary: "A response that contains a list of Xcode Versions resources."),
            "ErrorResponse": .rootSchema(
                summary: "Information with error details that an API returns in the response body whenever the API request is not successful.",
                properties: ["errors": "An array of one or more errors."]
            ),
            "ErrorResponse.Errors": .rootSchema(
                summary: "The details about one error that is returned when an API request is not successful.",
                discussion: "Use the code parameter for programmatic error handling. See [Parsing the Error Response Code](https://developer.apple.com/documentation/appstoreconnectapi/interpreting_and_handling_errors/parsing_the_error_response_code) for more information. For more information about using the source parameter, see [Pinpointing the Location of Errors](https://developer.apple.com/documentation/appstoreconnectapi/interpreting_and_handling_errors/pinpointing_the_location_of_errors).",
                properties: [
                    "code": "A machine-readable code indicating the type of error. The code is a hierarchical value with levels of specificity separated by the '.' character. This value is parseable for programmatic error handling in code.",
                    "status": "The HTTP status code of the error. This status code usually matches the response's status code; however, if the request produces multiple errors, these two codes may differ.",
                    "id": "The unique ID of a specific instance of an error, request, and response. Use this ID when providing feedback to or debugging issues with Apple.",
                    "title": "A summary of the error. Do not use this field for programmatic error handling.",
                    "detail": "A detailed explanation of the error. Do not use this field for programmatic error handling.",
                    "source": "One of two possible types of values: source.parameter, provided when a query parameter produced the error, or source.JsonPointer, provided when a problem with the entity produced the error.",
                ]
            ),
            "ErrorSourcePointer": .rootSchema(
                summary: "An object that contains the JSON pointer that indicates the location of the error.",
                discussion: "In some cases, the JSON pointer may indicate an element that isn't in the request entity, but should be. For more information about JSON pointers, see the [RFC 6901](https://tools.ietf.org/html/rfc6901) proposed standards document.",
                properties: ["pointer": "A JSON pointer that indicates the location in the request entity where the error originates."]
            ),
            "ErrorSourceParameter": .rootSchema(
                summary: "An object that contains the query parameter that produced the error.",
                properties: ["parameter": "The query parameter that produced the error."]
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
            "DiagnosticLog": .rootSchema(summary: "The data structure that represents the Diagnostic Logs resource."),
            "DiagnosticLogsResponse": .rootSchema(summary: "A response that contains a list of Diagnostic Logs resources."),
            "DiagnosticSignature": .rootSchema(
                summary: "The data structure that represents the Diagnostic Signatures resource.",
                attributes: .init(
                    summary: "Attributes that describe a Diagnostic Signatures resource.",
                    properties: [
                        "diagnosticType": "",
                        "signature": "",
                        "weight": "",
                    ]
                )
            ),
            "DiagnosticSignaturesResponse": .rootSchema(summary: "A response that contains a list of Diagnostic Signature resources."),
            "DocumentLinks": .rootSchema(
                summary: "Self-links to documents that can contain information for one or more resources.",
                discussion: "All the response data constitutes a document.",
                properties: ["self": "The link that produced the current document."]
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
            "ExternalBetaState": .enumObject(
                summary: "String that represents a build's availability for external testing.",
                cases: [
                    "PROCESSING": "",
                    "PROCESSING_EXCEPTION": "",
                    "MISSING_EXPORT_COMPLIANCE": "",
                    "READY_FOR_BETA_TESTING": "",
                    "IN_BETA_TESTING": "",
                    "EXPIRED": "",
                    "READY_FOR_BETA_SUBMISSION": "",
                    "IN_EXPORT_COMPLIANCE_REVIEW": "",
                    "WAITING_FOR_BETA_REVIEW": "",
                    "IN_BETA_REVIEW": "",
                    "BETA_REJECTED": "",
                    "BETA_APPROVED": "",
                ]
            ),
            "FileLocation": .rootSchema(
                summary: "The data structure that represents a File Locations resource.",
                properties: [
                    "lineNumber": "The line number of a file that contains code.",
                    "path": "The path to the file that caused an issue.",
                ]
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
            "Gzip": .rootSchema(summary: ""),
            "HttpHeader": .rootSchema(
                summary: "",
                properties: [
                    "name": "",
                    "value": "",
                ]
            ),
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
            "IdfaDeclaration": .rootSchema(
                summary: "The data structure that represents the IDFA Declarations resource.",
                attributes: .init(
                    summary: "Attributes that describe an IDFA Declarations resource.",
                    properties: [
                        "attributesActionWithPreviousAd": "",
                        "attributesAppInstallationToPreviousAd": "",
                        "honorsLimitedAdTracking": "",
                        "servesAds": "",
                    ]
                )
            ),
            "IdfaDeclarationCreateRequest": .createRequest(
                summary: "The request body you use to create an IDFA Declaration.",
                attributes: .init(properties: [
                    "attributesActionWithPreviousAd": "",
                    "attributesAppInstallationToPreviousAd": "",
                    "honorsLimitedAdTracking": "",
                    "servesAds": "",
                ])
            ),
            "IdfaDeclarationResponse": .rootSchema(summary: "A response that contains a single IDFA Declarations resource."),
            "IdfaDeclarationUpdateRequest": .updateRequest(
                summary: "The request body you use to update an IDFA Declaration.",
                attributes: .init(properties: [
                    "attributesActionWithPreviousAd": "",
                    "attributesAppInstallationToPreviousAd": "",
                    "honorsLimitedAdTracking": "",
                    "servesAds": "",
                ])
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
            "InternalBetaState": .enumObject(
                summary: "String that represents a build's availability for internal testing.",
                cases: [
                    "PROCESSING": "",
                    "PROCESSING_EXCEPTION": "",
                    "MISSING_EXPORT_COMPLIANCE": "",
                    "READY_FOR_BETA_TESTING": "",
                    "IN_BETA_TESTING": "",
                    "EXPIRED": "",
                    "IN_EXPORT_COMPLIANCE_REVIEW": "",
                ]
            ),
            "KidsAgeBand": .enumObject(
                summary: "String that represents a Made for Kids app's age band.",
                cases: ["FIVE_AND_UNDER": "", "SIX_TO_EIGHT": "", "NINE_TO_ELEVEN": ""]
            ),
            "PagedDocumentLinks": .rootSchema(
                summary: "Links related to the response document, including paging links.",
                discussion: "All the response data constitutes a document.",
                properties: [
                    "first": "The link to the first page of documents.",
                    "next": "The link to the next page of documents.",
                    "self": "The link that produced the current document.",
                ]
            ),
            "PagingInformation": .rootSchema(
                summary: "Paging information for data responses.",
                properties: ["paging": "The paging information details."]
            ),
            "PagingInformation.Paging": .rootSchema(
                summary: "Paging details such as the total number of resources and the per-page limit.",
                discussion: """
                Adjust the number of resources returned per page by using the limit query parameter in your request. For example, the following request returns the first 10 testers:
                ```
                GET /v1/betaTesters?limit=10
                ```
                """,
                properties: [
                    "total": "The total number of resources matching your request.",
                    "limit": "The maximum number of resources to return per page, from 0 to 200.",
                ]
            ),
            "PerfPowerMetric": .rootSchema(
                summary: "The data structure that represents the Power and Performance Metrics resource.",
                attributes: .init(
                    summary: "Attributes that describe a Power and Performance Metrics resource.",
                    properties: [
                        "deviceType": "",
                        "metricType": "",
                        "platform": "",
                    ]
                )
            ),
            "PerfPowerMetricsResponse": .rootSchema(summary: "A response that contains a list of Power and Performance Metrics resources."),
            "PhasedReleaseState": .enumObject(
                summary: "String that represents the progress of a phased release for an app version.",
                cases: [
                    "INACTIVE": "",
                    "ACTIVE": "",
                    "PAUSED": "",
                    "COMPLETE": "",
                ]
            ),
            "Platform": .enumObject(
                summary: "Strings that represent Apple operating systems.",
                cases: [
                    "IOS": "A string that represents iOS.",
                    "MAC_OS": "A string that represents macOS.",
                    "TV_OS": "A string that represents tvOS.",
                ]
            ),
            "PrereleaseVersion": .rootSchema(
                summary: "The data structure that represents a Prerelease Versions resource.",
                attributes: .init(
                    summary: "Attributes that describe a Prerelease Versions resource.",
                    properties: [
                        "platform": "The platform of the prerelease version of your app.",
                        "version": "The version number of the prerelease version of your app.",
                    ]
                )
            ),
            "PrereleaseVersionResponse": .rootSchema(summary: "A response that contains a single Prerelease Versions resource."),
            "PreReleaseVersionsResponse": .rootSchema(summary: "A response that contains a list of Pre-Release Version resources."),
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
            "ResourceLinks": .rootSchema(
                summary: "Self-links to requested resources.",
                properties: ["self": "The link to the resource."]
            ),
            "ReviewSubmission": .rootSchema(summary: ""),
            "ReviewSubmissionCreateRequest": .createRequest(summary: ""),
            "ReviewSubmissionItem": .rootSchema(summary: ""),
            "ReviewSubmissionItemCreateRequest": .createRequest(summary: ""),
            "ReviewSubmissionItemResponse": .rootSchema(summary: ""),
            "ReviewSubmissionItemUpdateRequest": .updateRequest(summary: ""),
            "ReviewSubmissionItemsResponse": .rootSchema(summary: ""),
            "ReviewSubmissionResponse": .rootSchema(summary: ""),
            "ReviewSubmissionUpdateRequest": .updateRequest(summary: ""),
            "ReviewSubmissionsResponse": .rootSchema(summary: ""),
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
            "ScmGitReference": .rootSchema(
                summary: "The data structure that represents a Git References resource.",
                attributes: .init(
                    summary: "The attributes that describe a Git Reference resource.",
                    properties: [
                        "canonicalName":
                            "The canonical name of the Git reference.",
                        "isDeleted":
                            "A Boolean value that indicates whether the Git reference was deleted.",
                        "kind":
                            "A value that indicates whether the Git reference is a tag or a branch.",
                        "name":
                            "The name of the Git reference.",
                    ]
                )
            ),
            "ScmGitReferenceResponse": .rootSchema(summary: "A response that contains a single Git References resource."),
            "ScmGitReferencesResponse": .rootSchema(summary: "A response that contains a list of Git References resources."),
            "ScmProvider": .rootSchema(
                summary: "The data structure that represents a Providers resource.",
                attributes: .init(
                    summary: "The attributes that describe a Providers resource.",
                    properties: [
                        "scmProviderType": "The source code management provider’s type.",
                        "url": "The URL of the source code management provider.",
                    ]
                )
            ),
            "ScmProviderResponse": .rootSchema(summary: "A response that contains a single Providers resource."),
            "ScmProvidersResponse": .rootSchema(summary: "A response that contains a list of Providers resources."),
            "ScmProviderType": .rootSchema(
                summary: "The source code management provider’s type.",
                properties: [
                    "displayName": "The source code management provider’s display name; for example, Bitbucket Server.",
                    "isOnPremise": "A Boolean value that indicates whether it’s a self-hosted source code management provider.",
                    "kind": "A string that represents the kind of a Providers resource.",
                ]
            ),
            "ScmPullRequest": .rootSchema(
                summary: "The data structure that represents a Pull Requests resource.",
                attributes: .init(
                    summary: "The attributes that describe a Pull Requests resource.",
                    properties: [
                        "destinationBranchName": "The name of the pull request’s destination branch.",
                        "destinationRepositoryName": "The name of the pull request’s destination repository. If the pull request is not for a fork, this is the same value as the source repository name.",
                        "destinationRepositoryOwner": "The owner of the pull request’s destination repository.",
                        "isClosed": "A Boolean value that indicates whether the pull request is open or closed.",
                        "isCrossRepository": "A Boolean value that indicates whether the pull request is for a Git fork.",
                        "number": "The pull request number.",
                        "sourceBranchName": "The name of the pull request’s source branch.",
                        "sourceRepositoryName": "The name of the pull request’s source repository.",
                        "sourceRepositoryOwner": "The owner of the pull request’s destination repository.",
                        "title": "The pull request’s title.",
                        "webUrl": "The URL of the pull request.",
                    ]
                )
            ),
            "ScmPullRequestResponse": .rootSchema(summary: "A response that contains a single Pull Requests resource."),
            "ScmPullRequestsResponse": .rootSchema(summary: "A response that contains a list of Pull Requests resources."),
            "ScmRepositoriesResponse": .rootSchema(summary: "A response that contains a list of Repositories resources."),
            "ScmRepository": .rootSchema(
                summary: "The data structure that represents a Repositories resource.",
                attributes: .init(
                    summary: "The attributes that describe a Repositories resource.",
                    properties: [
                        "httpCloneUrl": "The Git repository’s URL for cloning it using HTTP.",
                        "lastAccessedDate": "The date and time when Xcode Cloud last accessed the repository.",
                        "ownerName": "The name of the Git repository’s owner.",
                        "repositoryName": "The name of the Git repository.",
                        "sshCloneUrl": "The Git repository’s URL for cloning it using SSH.",
                    ]
                )
            ),
            "ScmRepositoryResponse": .rootSchema(summary: "A response that contains a single Repositories resource."),
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
            "SubscriptionStatusUrlVersion": .rootSchema(summary: ""),
            "TerritoriesResponse": .rootSchema(summary: "A response that contains a list of Territory resources."),
            "Territory": .rootSchema(
                summary: "The data structure that represents a Territories resource.",
                attributes: .init(
                    summary: "Attributes that describe a Territories resource.",
                    properties: ["currency": ""]
                )
            ),
            "TerritoryCode": .rootSchema(summary: "The App Store territory codes."),
            "TerritoryResponse": .rootSchema(summary: "A response that contains a single Territories resource."),
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
            "XcodeMetrics": .rootSchema(summary: ""),
        ]
    }
}
