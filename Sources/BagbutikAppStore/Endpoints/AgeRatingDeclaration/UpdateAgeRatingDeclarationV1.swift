import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an age rating declaration

     Provide age-related information so the App Store can determine the age rating for your app.

     ## Discussion

     Every App Store version has an age rating declaration. Use this endpoint to edit the declaration and provide app-characteristic information so App Store Connect can determine the appropriate age rating for the app.

     Use this endpoint to indicate whether an app is Made for Kids.

     When calling this endpoint, only include the attributes that you’re modifying.

     The attributes for age-rating declarations, `INFREQUENT_OR_MILD` and `FREQUENT_OR_INTENSE` are deprecated. Instead, use `INFREQUENT` or `FREQUENT`.

     For example, in an app that has a `FREQUENT` declaration for contests, the age rating for the `AppInfos` is 12+. If you declare a value of true for `gambling`, the age rating for the `AppInfos` is 17+.

     ### Modify an age rating declaration

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/26b5c300-1814-4b7a-8ec9-5411ecf36305

     {
       "data": {
         "type": "ageRatingDeclarations",
         "id": "string",
         "attributes": {
           "alcoholTobaccoOrDrugUseOrReferences": "NONE",
           "contests": "NONE",
           "gambling": true,
           "gamblingSimulated": "NONE",
           "medicalOrTreatmentInformation": "NONE",
           "profanityOrCrudeHumor": "NONE",
           "sexualContentGraphicAndNudity": "NONE",
           "sexualContentOrNudity": "NONE",
           "horrorOrFearThemes": "NONE",
           "matureOrSuggestiveThemes": "NONE",
           "unrestrictedWebAccess": true,
           "violenceCartoonOrFantasy": "NONE",
           "violenceRealisticProlongedGraphicOrSadistic": "NONE",
           "violenceRealistic": "NONE",
           "kidsAgeBand": null
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "ageRatingDeclarations",
         "id": "26b5c300-1814-4b7a-8ec9-5411ecf36305",
         "attributes": {
           "alcoholTobaccoOrDrugUseOrReferences": "NONE",
           "contests": "NONE",
           "gambling": true,
           "gamblingSimulated": "NONE",
           "medicalOrTreatmentInformation": "NONE",
           "profanityOrCrudeHumor": "NONE",
           "sexualContentGraphicAndNudity": "NONE",
           "sexualContentOrNudity": "NONE",
           "horrorOrFearThemes": "NONE",
           "matureOrSuggestiveThemes": "NONE",
           "unrestrictedWebAccess": true,
           "violenceCartoonOrFantasy": "NONE",
           "violenceRealisticProlongedGraphicOrSadistic": "NONE",
           "violenceRealistic": "NONE",
           "kidsAgeBand": null
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/26b5c300-1814-4b7a-8ec9-5411ecf36305"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/26b5c300-1814-4b7a-8ec9-5411ecf36305"
       }
     }
     ```

     ### Mark an App as Made for Kids

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/26b5c300-1814-4b7a-8ec9-5411ecf36305

     {
       "data": {
         "type": "ageRatingDeclarations",
         "id": "string",
         "attributes": {
           "kidsAgeBand": "FIVE_AND_UNDER"
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "ageRatingDeclarations",
         "id": "26b5c300-1814-4b7a-8ec9-5411ecf36305",
         "attributes": {
           "alcoholTobaccoOrDrugUseOrReferences": "NONE",
           "contests": “NONE”,
           "gambling": false,
           "gamblingSimulated": "NONE",
           "medicalOrTreatmentInformation": "NONE",
           "profanityOrCrudeHumor": "NONE",
           "sexualContentGraphicAndNudity": "NONE",
           "sexualContentOrNudity": "NONE",
           "horrorOrFearThemes": "NONE",
           "matureOrSuggestiveThemes": "NONE",
           "unrestrictedWebAccess": true,
           "violenceCartoonOrFantasy": "NONE",
           "violenceRealisticProlongedGraphicOrSadistic": "NONE",
           "violenceRealistic": "NONE",
           "kidsAgeBand": "FIVE_AND_UNDER"
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/26b5c300-1814-4b7a-8ec9-5411ecf36305"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/26b5c300-1814-4b7a-8ec9-5411ecf36305"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-ageRatingDeclarations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AgeRatingDeclaration representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAgeRatingDeclarationV1(id: String,
                                             requestBody: AgeRatingDeclarationUpdateRequest) -> Request<AgeRatingDeclarationResponse, ErrorResponse> {
        .init(
            path: "/v1/ageRatingDeclarations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
