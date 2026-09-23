import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Read app versions for a game center detail

     Get a list of app versions for a Game Center detail.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/gameCenterAppVersions?limit=5
     ```

     **Response:**

     ```json
     {
       “data” : [ {
         “type” : “gameCenterAppVersions”,
         “id” : “1d9b87fb-80c4-44eb-a114-a51aeebd82fc”,
         “attributes” : {
           “enabled” : false
         },
         “relationships” : {
           “compatibilityVersions” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/relationships/compatibilityVersions”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/compatibilityVersions”
             }
           },
           “appStoreVersion” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/relationships/appStoreVersion”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/appStoreVersion”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc”
         }
       }, {
         “type” : “gameCenterAppVersions”,
         “id” : “6ee80093-de91-9073-a043-4e7dcd28ae7b”,
         “attributes” : {
           “enabled” : true
         },
         “relationships” : {
           “compatibilityVersions” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/relationships/compatibilityVersions”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/compatibilityVersions”
             }
           },
           “appStoreVersion” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/relationships/appStoreVersion”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/appStoreVersion”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b”
         }
       }, {
         “type” : “gameCenterAppVersions”,
         “id” : “7bb8ca27-b622-43e1-a838-15b18dc58421”,
         “attributes” : {
           “enabled” : true
         },
         “relationships” : {
           “compatibilityVersions” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/relationships/compatibilityVersions”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/compatibilityVersions”
             }
           },
           “appStoreVersion” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/relationships/appStoreVersion”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/appStoreVersion”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421”
         }
       }, {
         “type” : “gameCenterAppVersions”,
         “id” : “97c63a59-3dee-a1b3-6bec-5f0a2245c445”,
         “attributes” : {
           “enabled” : true
         },
         “relationships” : {
           “compatibilityVersions” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/relationships/compatibilityVersions”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/compatibilityVersions”
             }
           },
           “appStoreVersion” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/relationships/appStoreVersion”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/appStoreVersion”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445”
         }
       }, {
         “type” : “gameCenterAppVersions”,
         “id” : “a3d76fe2-5baf-e9e7-198f-dcec974711eb”,
         “attributes” : {
           “enabled” : true
         },
         “relationships” : {
           “compatibilityVersions” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/relationships/compatibilityVersions”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/compatibilityVersions”
             }
           },
           “appStoreVersion” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/relationships/appStoreVersion”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/appStoreVersion”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb”
         }
       } ],
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/gameCenterAppVersions?limit=5”,
         “next” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/gameCenterAppVersions?cursor=ODExNDMwNzYw.Wc8eXw&limit=5”
       },
       “meta” : {
         “paging” : {
           “total” : 14,
           “limit” : 5
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-gameCenterAppVersions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAppVersionsForGameCenterDetailV1(id: String,
                                                               fields: [ListGameCenterAppVersionsForGameCenterDetailV1.Field]? = nil,
                                                               filters: [ListGameCenterAppVersionsForGameCenterDetailV1.Filter]? = nil,
                                                               includes: [ListGameCenterAppVersionsForGameCenterDetailV1.Include]? = nil,
                                                               limits: [ListGameCenterAppVersionsForGameCenterDetailV1.Limit]? = nil) -> Request<GameCenterAppVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/gameCenterAppVersions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListGameCenterAppVersionsForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type gameCenterAppVersions
        case gameCenterAppVersions([GameCenterAppVersions])

        public enum AppStoreVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionPackage
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case appVersionState
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case gameCenterAppVersion
            case platform
            case releaseType
            case reviewType
            case routingAppCoverage
            case usesIdfa
            case versionString

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersions(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersions value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterAppVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreVersion
            case compatibilityVersions
            case enabled

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAppVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterAppVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAppVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'enabled'
        case enabled([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreVersion
        case compatibilityVersions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related compatibilityVersions returned (when they are included) - maximum 50
        case compatibilityVersions(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
