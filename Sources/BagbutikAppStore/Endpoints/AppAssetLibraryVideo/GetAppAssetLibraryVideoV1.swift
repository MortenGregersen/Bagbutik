import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read an app asset library video

     Get information about an app asset library video.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appAssetLibraryVideos",
         "id" : "3b100005-e036-8f0b-8021-77aa41c6b502",
         "attributes" : {
           "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
           "createdDate" : "2026-08-11T22:51:04Z",
           "lastModifiedDate" : "2026-08-11T22:53:22Z",
           "fileName" : "app-preview-6-9.mp4",
           "fileSize" : 31457280,
           "previewFrameImage" : {
             "image" : {
               "templateUrl" : "https://is1.mzstatic.com/image/thumb/AOsFKpK1JfF_vrxSCSbIew/{w}x{h}bb.{f}",
               "width" : 886,
               "height" : 1920
             },
             "state" : "COMPLETE"
           },
           "previewFrameTimeCode" : "00:00:03:00",
           "referenceName" : "Fall campaign preview",
           "specId" : "1861fdcb-eb99-59e6-8c6c-5a07479d9a84",
           "state" : "PREPARE_FOR_SUBMISSION",
           "stateDetails" : null,
           "videoAsset" : "https://video-ssl.itunes.apple.com/itunes-assets/Video/v4/preview.m3u8"
         },
         "relationships" : {
           "placements" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/relationships/placements",
               "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraryVideos-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related placements returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppAssetLibraryVideoV1(id: String,
                                          fields: [GetAppAssetLibraryVideoV1.Field]? = nil,
                                          includes: [GetAppAssetLibraryVideoV1.Include]? = nil,
                                          limit: GetAppAssetLibraryVideoV1.Limit? = nil) -> Request<AppAssetLibraryVideoResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryVideos/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetAppAssetLibraryVideoV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraryPlacements
        case appAssetLibraryPlacements([AppAssetLibraryPlacements])
        /// The fields to include for returned resources of type appAssetLibraryVideos
        case appAssetLibraryVideos([AppAssetLibraryVideos])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case placements
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related placements returned (when they are included) - maximum 50
        case placements(Int)
    }
}
