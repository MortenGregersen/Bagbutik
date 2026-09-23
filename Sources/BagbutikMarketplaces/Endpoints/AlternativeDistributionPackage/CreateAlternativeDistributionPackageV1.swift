import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Create an Alternative Distribution Package

     Create an alternative distribution package for an App Store version.

     ## Discussion

     > Tip:
     > This endpoint requires the `appStoreVersion` in the payload. Obtain the `appStoreVersion` resource ID from the ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appStoreVersions`` response.

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages
     {
       "data": {
         "type": "alternativeDistributionPackages",
         "relationships": {
           "appStoreVersion": {
             "data": {
               "type": "appStoreVersions",
               "id": "3fb74833-4bf4-4c34-9cfd-f9dc4978ea45"
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
         "type": "alternativeDistributionPackages",
         "id": "f3190601-974c-45ee-aa24-35db2090c260",
         "relationships": {
           "versions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/f3190601-974c-45ee-aa24-35db2090c260/relationships/versions",
               "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/f3190601-974c-45ee-aa24-35db2090c260/versions"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/f3190601-974c-45ee-aa24-35db2090c260"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-alternativeDistributionPackages>

     - Parameter requestBody: AlternativeDistributionPackage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAlternativeDistributionPackageV1(requestBody: AlternativeDistributionPackageCreateRequest) -> Request<AlternativeDistributionPackageResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackages",
            method: .post,
            requestBody: requestBody)
    }
}
