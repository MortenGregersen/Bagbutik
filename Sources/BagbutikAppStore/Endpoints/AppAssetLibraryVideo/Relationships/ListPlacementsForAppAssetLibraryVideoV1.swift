import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List related placements

     List the placements that reuse an app asset library video.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements?limit=1
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryPlacements",
         "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a",
         "attributes" : {
           "mediaType" : "VIDEO",
           "placementType" : "APP_PREVIEW",
           "placementGroup" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
           "createdDate" : "2026-08-11T22:45:27Z",
           "lastModifiedDate" : "2026-08-11T22:45:27Z",
           "state" : "PARENT_PREPARE_FOR_SUBMISSION",
           "stateDetails" : null
         },
         "relationships" : {
           "video" : {
             "data" : {
               "type" : "appAssetLibraryVideos",
               "id" : "3b100005-e036-8f0b-8021-77aa41c6b502"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacements/2e000005-e036-8f0b-8f25-6dbc2baa784a"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements"
       },
       "meta" : {
         "paging" : {
           "total" : 1,
           "limit" : 1
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraryVideos-_id_-placements>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPlacementsForAppAssetLibraryVideoV1(id: String,
                                                        fields: [ListPlacementsForAppAssetLibraryVideoV1.Field]? = nil,
                                                        filters: [ListPlacementsForAppAssetLibraryVideoV1.Filter]? = nil,
                                                        includes: [ListPlacementsForAppAssetLibraryVideoV1.Include]? = nil,
                                                        sorts: [ListPlacementsForAppAssetLibraryVideoV1.Sort]? = nil,
                                                        limit: Int? = nil) -> Request<AppAssetLibraryPlacementsResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryVideos/\(id)/placements",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListPlacementsForAppAssetLibraryVideoV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraryImages
        case appAssetLibraryImages([AppAssetLibraryImages])
        /// The fields to include for returned resources of type appAssetLibraryPlacements
        case appAssetLibraryPlacements([AppAssetLibraryPlacements])
        /// The fields to include for returned resources of type appAssetLibraryVideos
        case appAssetLibraryVideos([AppAssetLibraryVideos])
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appEventLocalizations
        case appEventLocalizations([AppEventLocalizations])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppAssetLibraryImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case category
            case createdDate
            case fileName
            case fileSize
            case imageAsset
            case lastModifiedDate
            case placements
            case referenceName
            case specId
            case state
            case stateDetails
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraryImages(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraryImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraryImages value: \(string)"
                    )
                }
            }
        }

        public enum AppAssetLibraryPlacements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appEventLocalization
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case createdDate
            case image
            case lastModifiedDate
            case mediaType
            case placementGroup
            case placementType
            case state
            case stateDetails
            case video

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraryPlacements(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraryPlacements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraryPlacements value: \(string)"
                    )
                }
            }
        }

        public enum AppAssetLibraryVideos: String, Sendable, ParameterValue, Codable, CaseIterable {
            case category
            case createdDate
            case fileName
            case fileSize
            case lastModifiedDate
            case placements
            case previewFrameImage
            case previewFrameTimeCode
            case referenceName
            case specId
            case state
            case stateDetails
            case uploadOperations
            case videoAsset

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraryVideos(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraryVideos(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraryVideos value: \(string)"
                    )
                }
            }
        }

        public enum AppCustomProductPageLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case placements
            case promotionalText
            case searchKeywords

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCustomProductPageLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppCustomProductPageLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCustomProductPageLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppEventLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEvent
            case appEventScreenshots
            case appEventVideoClips
            case locale
            case longDescription
            case name
            case placements
            case shortDescription

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEventLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppEventLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEventLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale
            case placements

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersionExperimentTreatmentLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersionExperimentTreatmentLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersionExperimentTreatmentLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersion
            case description
            case keywords
            case locale
            case marketingUrl
            case placements
            case promotionalText
            case searchKeywords
            case supportUrl
            case whatsNew

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersionLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersionLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersionLocalizations value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'appCustomProductPageLocalization'
        case appCustomProductPageLocalization([String])
        /// Filter by id(s) of related 'appEventLocalization'
        case appEventLocalization([String])
        /// Filter by id(s) of related 'appStoreVersionExperimentTreatmentLocalization'
        case appStoreVersionExperimentTreatmentLocalization([String])
        /// Filter by id(s) of related 'appStoreVersionLocalization'
        case appStoreVersionLocalization([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by id(s) of related 'image'
        case image([String])
        /// Filter by attribute 'placementGroup'
        case placementGroup([String])
        /// Filter by attribute 'placementType'
        case placementType([AppAssetLibraryPlacementType])
        /// Filter by attribute 'state'
        case state([AppAssetLibraryPlacementState])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appCustomProductPageLocalization
        case appEventLocalization
        case appStoreVersionExperimentTreatmentLocalization
        case appStoreVersionLocalization
        case image
        case video
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case createdDateAscending = "createdDate"
        case createdDateDescending = "-createdDate"
        case lastModifiedDateAscending = "lastModifiedDate"
        case lastModifiedDateDescending = "-lastModifiedDate"
        case placementGroupPositionAscending = "placementGroupPosition"
        case placementGroupPositionDescending = "-placementGroupPosition"
    }
}
