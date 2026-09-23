import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an end user license agreement

     Add a custom end user license agreement (EULA) to an app and configure the territories to which it applies.

     ## Discussion

     Use this endpoint to associate a custom license agreement with an app in the specified App Store territories. Any other territories will use the standard Apple-provided license agreement.

     In the following example the request contains a blank value for the `agreementText` attribute. Replace that attribute value with your actual agreement text.

     ### Create a Custom License Agreement for USA and China

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements

     {
       "data": {
         "type": "endUserLicenseAgreements",
         "attributes": {
           "agreementText": "..."
         },
         "relationships": {
           "app": {
             "data": {
               "type": "apps",
               "id": "284993459"
             }
           },
           "territories": {
             "data": [
               {
                 "type": "territories",
                 "id": "USA"
               },
               {
                 "type": "territories",
                 "id": "CHN"
               }
             ]
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "endUserLicenseAgreements",
         "id" : "b25d1669-d6b1-4e9b-8679-02863557222a",
         "attributes" : {
           "agreementText" : "..."
         },
         "relationships" : {
           "app" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a/relationships/app",
               "related" : "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a/app"
             }
           },
           "territories" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a/relationships/territories",
               "related" : "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a/territories"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-endUserLicenseAgreements>

     - Parameter requestBody: EndUserLicenseAgreement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createEndUserLicenseAgreementV1(requestBody: EndUserLicenseAgreementCreateRequest) -> Request<EndUserLicenseAgreementResponse, ErrorResponse> {
        .init(
            path: "/v1/endUserLicenseAgreements",
            method: .post,
            requestBody: requestBody)
    }
}
