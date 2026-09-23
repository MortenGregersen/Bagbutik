import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an end user license agreement

     Update the text or territories for your custom end user license agreement.

     ## Discussion

     Use this endpoint to change the license agreement text or associate the agreement with different App Store territories.

     In the following example the request contains a blank value for the `agreementText` attribute. Replace that attribute value with your actual agreement text.

     If you change the territories relationship, the new territories replace the original territories.

     ### Change the Text of a License Agreement

     **Request:**

     ```
     PATCH /v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a

     {
       "data": {
         "type": "endUserLicenseAgreements",
         "attributes": {
           "agreementText": "..."
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

     ### Replace the Territories of a License Agreement with Japan and Canada

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/b25d1669-d6b1-4e9b-8679-02863557222a

     {
       "data": {
         "type": "endUserLicenseAgreements",
         "relationships": {
           "territories": {
             "data": [
               {
                 "type": "territories",
                 "id": "JPN"
               },
               {
                 "type": "territories",
                 "id": "CAN"
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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-endUserLicenseAgreements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: EndUserLicenseAgreement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateEndUserLicenseAgreementV1(id: String,
                                                requestBody: EndUserLicenseAgreementUpdateRequest) -> Request<EndUserLicenseAgreementResponse, ErrorResponse> {
        .init(
            path: "/v1/endUserLicenseAgreements/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
