import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List all builds of an app

     Get a list of builds associated with a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6446998023/builds
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "builds",
           "id": "b3149f9a-100d-4af7-a771-cef5507a0499",
           "attributes": {
             "version": "1",
             "uploadedDate": "2022-09-07T10:42:15-07:00",
             "expirationDate": "2022-12-06T10:42:15-08:00",
             "expired": false,
             "minOsVersion": "15.5",
             "lsMinimumSystemVersion": null,
             "computedMinMacOsVersion": "12.4",
             "iconAssetToken": {
               "templateUrl": "https://isq11.mzstatic.com/image/thumb/Purple123/v4/fb/4d/c2/fb4dc243-7048-8939-ac1c-0e1819c6e723/Icon-83.5@2x.png.png/{w}x{h}bb.{f}",
               "width": 167,
               "height": 167
             },
             "processingState": "VALID",
             "buildAudienceType": "APP_STORE_ELIGIBLE",
             "usesNonExemptEncryption": false
           },
           "relationships": {
             "preReleaseVersion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/preReleaseVersion",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/preReleaseVersion"
               }
             },
             "individualTesters": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/individualTesters",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/individualTesters"
               }
             },
             "betaGroups": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/betaGroups"
               }
             },
             "betaBuildLocalizations": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/betaBuildLocalizations",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/betaBuildLocalizations"
               }
             },
             "appEncryptionDeclaration": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/appEncryptionDeclaration",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/appEncryptionDeclaration"
               }
             },
             "betaAppReviewSubmission": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/betaAppReviewSubmission",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/betaAppReviewSubmission"
               }
             },
             "app": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/app",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/app"
               }
             },
             "buildBetaDetail": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/buildBetaDetail",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/buildBetaDetail"
               }
             },
             "appStoreVersion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/appStoreVersion",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/appStoreVersion"
               }
             },
             "icons": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/icons",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/icons"
               }
             },
             "perfPowerMetrics": {
               "links": {
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/perfPowerMetrics"
               }
             },
             "diagnosticSignatures": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/relationships/diagnosticSignatures",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499/diagnosticSignatures"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/builds/b3149f9a-100d-4af7-a771-cef5507a0499"
           }
         },
         {
           "type": "builds",
           "id": "e3d564dc-acff-468d-8cb5-0fc196c56dda",
           "attributes": {
             "version": "1",
             "uploadedDate": "2022-09-07T10:23:45-07:00",
             "expirationDate": "2022-12-06T10:23:45-08:00",
             "expired": false,
             "minOsVersion": "15.5",
             "lsMinimumSystemVersion": null,
             "computedMinMacOsVersion": "12.4",
             "iconAssetToken": {
               "templateUrl": "https://isq11.mzstatic.com/image/thumb/Purple123/v4/97/9b/62/979b62fb-df95-39cb-c2b9-45ee6aa0b707/Icon-83.5@2x.png.png/{w}x{h}bb.{f}",
               "width": 167,
               "height": 167
             },
             "processingState": "VALID",
             "buildAudienceType": "APP_STORE_ELIGIBLE",
             "usesNonExemptEncryption": false
           },
           "relationships": {
             "preReleaseVersion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/preReleaseVersion",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/preReleaseVersion"
               }
             },
             "individualTesters": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/individualTesters",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/individualTesters"
               }
             },
             "betaGroups": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/betaGroups"
               }
             },
             "betaBuildLocalizations": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/betaBuildLocalizations",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/betaBuildLocalizations"
               }
             },
             "appEncryptionDeclaration": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/appEncryptionDeclaration",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/appEncryptionDeclaration"
               }
             },
             "betaAppReviewSubmission": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/betaAppReviewSubmission",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/betaAppReviewSubmission"
               }
             },
             "app": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/app",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/app"
               }
             },
             "buildBetaDetail": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/buildBetaDetail",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/buildBetaDetail"
               }
             },
             "appStoreVersion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/appStoreVersion",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/appStoreVersion"
               }
             },
             "icons": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/icons",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/icons"
               }
             },
             "perfPowerMetrics": {
               "links": {
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/perfPowerMetrics"
               }
             },
             "diagnosticSignatures": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/relationships/diagnosticSignatures",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda/diagnosticSignatures"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/builds/e3d564dc-acff-468d-8cb5-0fc196c56dda"
           }
         },
         {
           "type": "builds",
           "id": "3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15",
           "attributes": {
             "version": "1",
             "uploadedDate": "2022-09-07T10:24:58-07:00",
             "expirationDate": "2022-12-06T10:24:58-08:00",
             "expired": false,
             "minOsVersion": "15.5",
             "lsMinimumSystemVersion": null,
             "computedMinMacOsVersion": "12.4",
             "iconAssetToken": {
               "templateUrl": "https://isq11.mzstatic.com/image/thumb/Purple113/v4/04/ac/0b/04ac0b6f-fa09-a354-80f3-ecf74ed38059/Icon-83.5@2x.png.png/{w}x{h}bb.{f}",
               "width": 167,
               "height": 167
             },
             "processingState": "VALID",
             "buildAudienceType": "APP_STORE_ELIGIBLE",
             "usesNonExemptEncryption": false
           },
           "relationships": {
             "preReleaseVersion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/preReleaseVersion",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/preReleaseVersion"
               }
             },
             "individualTesters": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/individualTesters",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/individualTesters"
               }
             },
             "betaGroups": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/betaGroups"
               }
             },
             "betaBuildLocalizations": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/betaBuildLocalizations",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/betaBuildLocalizations"
               }
             },
             "appEncryptionDeclaration": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/appEncryptionDeclaration",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/appEncryptionDeclaration"
               }
             },
             "betaAppReviewSubmission": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/betaAppReviewSubmission",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/betaAppReviewSubmission"
               }
             },
             "app": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/app",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/app"
               }
             },
             "buildBetaDetail": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/buildBetaDetail",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/buildBetaDetail"
               }
             },
             "appStoreVersion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/appStoreVersion",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/appStoreVersion"
               }
             },
             "icons": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/icons",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/icons"
               }
             },
             "perfPowerMetrics": {
               "links": {
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/perfPowerMetrics"
               }
             },
             "diagnosticSignatures": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/relationships/diagnosticSignatures",
                 "related": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15/diagnosticSignatures"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/builds/3f3a24e2-ae3b-4c39-8dd0-3fe46c69bb15"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/builds"
       },
       "meta": {
         "paging": {
           "total": 3,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-builds>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildsForAppV1(id: String,
                                   fields: [ListBuildsForAppV1.Field]? = nil,
                                   limit: Int? = nil) -> Request<BuildsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/builds",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBuildsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum Builds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaGroups
            case buildAudienceType
            case buildBetaDetail
            case buildBundles
            case buildUpload
            case computedMinMacOsVersion
            case computedMinVisionOsVersion
            case diagnosticSignatures
            case expirationDate
            case expired
            case iconAssetToken
            case icons
            case individualTesters
            case lsMinimumSystemVersion
            case minOsVersion
            case perfPowerMetrics
            case preReleaseVersion
            case processingState
            case uploadedDate
            case usesNonExemptEncryption
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Builds(rawValue: string) {
                    self = value
                } else if let value = Builds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Builds value: \(string)"
                    )
                }
            }
        }
    }
}
