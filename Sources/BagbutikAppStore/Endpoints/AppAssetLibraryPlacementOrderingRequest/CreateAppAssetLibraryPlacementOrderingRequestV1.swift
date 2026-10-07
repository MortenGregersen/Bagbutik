import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app asset library placement ordering request

     Create an app asset library placement ordering request.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacementOrderingRequests

     {
       "data": {
         "type": "appAssetLibraryPlacementOrderingRequests",
         "attributes": {
           "placementGroup": "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE"
         },
         "relationships": {
           "orderedPlacements": {
             "data": [
               {
                 "type": "appAssetLibraryPlacements",
                 "id": "1e800005-e036-8f0b-8f37-9c5cc67e23a1"
               },
               {
                 "type": "appAssetLibraryPlacements",
                 "id": "2e000005-e036-8f0b-8f25-6dbc2baa784a"
               }
             ]
           },
           "appStoreVersionLocalization": {
             "data": {
               "type": "appStoreVersionLocalizations",
               "id": "b3a9b4c2-d2de-43f4-ad8c-71c5ebe301d1"
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appAssetLibraryPlacementOrderingRequests",
         "id" : "24f44809-07db-497e-8ea9-153baedd0771",
         "relationships" : {
           "orderedPlacements" : {
             "meta" : {
               "paging" : {
                 "total" : 2,
                 "limit" : 10
               }
             },
             "data" : [ {
               "type" : "appAssetLibraryPlacements",
               "id" : "1e800005-e036-8f0b-8f37-9c5cc67e23a1"
             }, {
               "type" : "appAssetLibraryPlacements",
               "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a"
             } ]
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacementOrderingRequests/24f44809-07db-497e-8ea9-153baedd0771"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacementOrderingRequests"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appAssetLibraryPlacementOrderingRequests>

     - Parameter requestBody: AppAssetLibraryPlacementOrderingRequest representation
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related orderedPlacements returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppAssetLibraryPlacementOrderingRequestV1(requestBody: AppAssetLibraryPlacementOrderingRequestCreateRequest,
                                                                fields: [CreateAppAssetLibraryPlacementOrderingRequestV1.Field]? = nil,
                                                                includes: [CreateAppAssetLibraryPlacementOrderingRequestV1.Include]? = nil,
                                                                limit: CreateAppAssetLibraryPlacementOrderingRequestV1.Limit? = nil) -> Request<AppAssetLibraryPlacementOrderingRequestResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryPlacementOrderingRequests",
            method: .post,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }),
            requestBody: requestBody)
    }
}

public enum CreateAppAssetLibraryPlacementOrderingRequestV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraryPlacementOrderingRequests
        case appAssetLibraryPlacementOrderingRequests([AppAssetLibraryPlacementOrderingRequests])
        /// The fields to include for returned resources of type appAssetLibraryPlacements
        case appAssetLibraryPlacements([AppAssetLibraryPlacements])

        public enum AppAssetLibraryPlacementOrderingRequests: String, Sendable, ParameterValue, Codable, CaseIterable {
            case orderedPlacements

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraryPlacementOrderingRequests(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraryPlacementOrderingRequests(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraryPlacementOrderingRequests value: \(string)"
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case orderedPlacements
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related orderedPlacements returned (when they are included) - maximum 50
        case orderedPlacements(Int)
    }
}
