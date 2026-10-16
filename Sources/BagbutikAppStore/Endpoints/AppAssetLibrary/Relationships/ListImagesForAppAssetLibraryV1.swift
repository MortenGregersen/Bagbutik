import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List related images

     List the image assets in an app’s asset library.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images?filter[state]=PREPARE_FOR_SUBMISSION&sort=-createdDate&limit=2
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryImages",
         "id" : "c3000005-e036-8f0b-8038-36fbc8d1c4ae",
         "attributes" : {
           "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
           "createdDate" : "2026-08-11T22:47:02Z",
           "lastModifiedDate" : "2026-08-11T22:47:19Z",
           "fileName" : "order-screen-6-9.png",
           "fileSize" : 1284736,
           "imageAsset" : {
             "templateUrl" : "https://is1.mzstatic.com/image/thumb/AOsFKpK1JfF_vrxSCSbIew/{w}x{h}bb.{f}",
             "width" : 1290,
             "height" : 2796
           },
           "referenceName" : "Order screen",
           "specId" : "f56c777c-99ea-5760-97ae-27c5f8cbb884",
           "state" : "PREPARE_FOR_SUBMISSION",
           "stateDetails" : null
         },
         "relationships" : {
           "placements" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/c3000005-e036-8f0b-8038-36fbc8d1c4ae/relationships/placements",
               "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/c3000005-e036-8f0b-8038-36fbc8d1c4ae/placements"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/c3000005-e036-8f0b-8038-36fbc8d1c4ae"
         }
       }, {
         "type" : "appAssetLibraryImages",
         "id" : "f4000005-e036-8f0b-8018-d259974bee61",
         "attributes" : {
           "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
           "createdDate" : "2026-08-11T22:44:12Z",
           "lastModifiedDate" : "2026-08-11T22:44:31Z",
           "fileName" : "menu-screen-6-9.png",
           "fileSize" : 1284736,
           "imageAsset" : {
             "templateUrl" : "https://is1.mzstatic.com/image/thumb/AOsFKpK1JfF_vrxSCSbIew/{w}x{h}bb.{f}",
             "width" : 1290,
             "height" : 2796
           },
           "referenceName" : "Menu screen",
           "specId" : "f56c777c-99ea-5760-97ae-27c5f8cbb884",
           "state" : "PREPARE_FOR_SUBMISSION",
           "stateDetails" : null
         },
         "relationships" : {
           "placements" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/relationships/placements",
               "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/placements"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images"
       },
       "meta" : {
         "paging" : {
           "total" : 2,
           "limit" : 2
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraries-_id_-images>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImagesForAppAssetLibraryV1(id: String,
                                               fields: [ListImagesForAppAssetLibraryV1.Field]? = nil,
                                               filters: [ListImagesForAppAssetLibraryV1.Filter]? = nil,
                                               includes: [ListImagesForAppAssetLibraryV1.Include]? = nil,
                                               sorts: [ListImagesForAppAssetLibraryV1.Sort]? = nil,
                                               limits: [ListImagesForAppAssetLibraryV1.Limit]? = nil) -> Request<AppAssetLibraryImagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraries/\(id)/images",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListImagesForAppAssetLibraryV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraryImages
        case appAssetLibraryImages([AppAssetLibraryImages])
        /// The fields to include for returned resources of type appAssetLibraryPlacements
        case appAssetLibraryPlacements([AppAssetLibraryPlacements])

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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'category'
        case category([AppAssetLibraryAssetCategory])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'referenceName'
        case referenceName([String])
        /// Filter by attribute 'specId'
        case specId([String])
        /// Filter by attribute 'state'
        case state([AppAssetLibraryAssetState])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case placements
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case createdDateAscending = "createdDate"
        case createdDateDescending = "-createdDate"
        case lastModifiedDateAscending = "lastModifiedDate"
        case lastModifiedDateDescending = "-lastModifiedDate"
        case referenceNameAscending = "referenceName"
        case referenceNameDescending = "-referenceName"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related placements returned (when they are included) - maximum 50
        case placements(Int)
    }
}
