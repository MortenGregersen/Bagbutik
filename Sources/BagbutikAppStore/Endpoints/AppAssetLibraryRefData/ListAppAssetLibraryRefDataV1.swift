import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List app asset library ref data

     List app asset library reference data.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraryRefData?filter[features]=APP_STORE_VERSIONS
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryRefData",
         "id" : "1",
         "attributes" : {
           "features" : [ {
             "featureId" : "APP_STORE_VERSIONS",
             "placementPolicies" : [ {
               "placementType" : "APP_SCREENSHOT",
               "groupLimits" : [ {
                 "groupIds" : [ "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE", "MAC_PROFILE" ],
                 "maxCount" : 10
               } ]
             } ]
           } ],
           "placementProfileGroups" : [ {
             "placementProfileGroupId" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
             "platform" : "IPHONE_APP_STORE",
             "displayClassId" : "IPHONE_DYNAMIC_ISLAND_LARGE_DISPLAY"
           } ],
           "imageSpecs" : [ {
             "specId" : "f56c777c-99ea-5760-97ae-27c5f8cbb884",
             "shortName" : "i1290x2796a0",
             "dimensions" : {
               "minWidth" : 1290,
               "maxWidth" : 1290,
               "minHeight" : 2796,
               "maxHeight" : 2796
             },
             "aspectRatio" : "6:13",
             "compatiblePlacementTypes" : [ "APP_SCREENSHOT", "IMESSAGE_APP_SCREENSHOT" ],
             "alphaAllowed" : false,
             "fileExtensions" : [ ".jpg", ".jpeg", ".png" ],
             "maxFileSize" : 524288000,
             "mimeTypes" : [ "image/jpeg", "image/png" ],
             "universalAsset" : false
           } ],
           "videoSpecs" : [ {
             "specId" : "1861fdcb-eb99-59e6-8c6c-5a07479d9a84",
             "shortName" : "v886x1920f23~30t15~30u1",
             "dimensions" : {
               "minWidth" : 886,
               "maxWidth" : 886,
               "minHeight" : 1920,
               "maxHeight" : 1920
             },
             "aspectRatio" : "6:13",
             "compatiblePlacementTypes" : [ "APP_PREVIEW" ],
             "frameRates" : [ {
               "minFps" : 23,
               "maxFps" : 30
             } ],
             "duration" : {
               "min" : "PT15S",
               "max" : "PT30S"
             },
             "audioRequired" : true,
             "fileExtensions" : [ ".mp4", ".m4v", ".mov" ],
             "maxFileSize" : 524288000,
             "mimeTypes" : [ "video/quicktime", "video/mp4", "video/x-m4v" ],
             "universalAsset" : false
           } ],
           "placementTypes" : [ {
             "placementTypeId" : "APP_SCREENSHOT",
             "acceptsAssetCategories" : [ "APP_SCREENSHOTS_AND_PREVIEWS" ],
             "specMappings" : [ {
               "placementGroupId" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
               "specs" : [ "f56c777c-99ea-5760-97ae-27c5f8cbb884" ]
             } ]
           } ],
           "displayClasses" : [ {
             "displayClassId" : "IPHONE_DYNAMIC_ISLAND_LARGE_DISPLAY",
             "deviceFamily" : "IPHONE",
             "screenDimensions" : [ "6.9" ]
           } ]
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryRefData/1"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryRefData"
       },
       "meta" : {
         "paging" : {
           "total" : 1,
           "limit" : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraryRefData>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppAssetLibraryRefDataV1(fields: [ListAppAssetLibraryRefDataV1.Field]? = nil,
                                             filters: [ListAppAssetLibraryRefDataV1.Filter]? = nil) -> Request<AppAssetLibraryRefDataResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryRefData",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters))
    }
}

public enum ListAppAssetLibraryRefDataV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraryRefData
        case appAssetLibraryRefData([AppAssetLibraryRefData])

        public enum AppAssetLibraryRefData: String, Sendable, ParameterValue, Codable, CaseIterable {
            case displayClasses
            case features
            case imageSpecs
            case placementProfileGroups
            case placementTypes
            case videoSpecs

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraryRefData(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraryRefData(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraryRefData value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'features'
        case features([String])
        /// Filter by attribute 'placementProfileGroups'
        case placementProfileGroups([String])
        /// Filter by attribute 'placementTypes'
        case placementTypes([String])
        /// Filter by specs
        case specs([String])
    }
}
