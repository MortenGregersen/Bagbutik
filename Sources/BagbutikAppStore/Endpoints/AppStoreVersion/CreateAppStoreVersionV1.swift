import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app store version

     Add a new App Store version or platform to an app.

     ## Discussion

     Use this endpoint to add a new version of an app. The new version can be an incremental update of an existing app for a particular platform, or it can be the first version on a new platform for the app.

     ### Add a New Version of an iOS App

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/appStoreVersions

     {
       "data": {
         "type": "appStoreVersions",
         "attributes": {
           "platform": "IOS",
           "versionString": "1.1",
           "copyright": "© 2020 Apple, Inc.",
           "releaseType": "MANUAL"
           "usesIdfa": false
         },
         "relationships": {
           "app": {
             "data": {
               "type": "apps",
               "id": "284993459"
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "appStoreVersions",
         "id": "f5b10fc0-afda-4b31-b3e8-cdbcbe945622",
         "attributes": {
           "platform": "IOS",
           "versionString": "1.1",
           "appStoreState": "PREPARE_FOR_SUBMISSION",
           "copyright": "© 2020 Apple, Inc.",
           "releaseType": "MANUAL",
           "earliestReleaseDate": null,
           "usesIdfa": false,
           "downloadable": true
         },
         "relationships": {
           "app": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/app",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/app"
             }
           },
           "ageRatingDeclaration": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/ageRatingDeclaration",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/ageRatingDeclaration"
             }
           },
           "appStoreVersionLocalizations": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/appStoreVersionLocalizations",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/appStoreVersionLocalizations"
             }
           },
           "build": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/build",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/build"
             }
           },
           "appStoreVersionPhasedRelease": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/appStoreVersionPhasedRelease",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/appStoreVersionPhasedRelease"
             }
           },
           "routingAppCoverage": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/routingAppCoverage",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/routingAppCoverage"
             }
           },
           "appStoreReviewDetail": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/appStoreReviewDetail",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/appStoreReviewDetail"
             }
           },
           "appStoreVersionSubmission": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/appStoreVersionSubmission",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/appStoreVersionSubmission"
             }
           },
           "idfaDeclaration": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/idfaDeclaration",
               "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/idfaDeclaration"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersions>

     - Parameter requestBody: AppStoreVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionV1(requestBody: AppStoreVersionCreateRequest) -> Request<AppStoreVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions",
            method: .post,
            requestBody: requestBody)
    }
}
