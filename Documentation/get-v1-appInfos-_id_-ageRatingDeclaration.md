<!--
{
  "availability" : [
    "App Store Connect API: 1.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appInfos-_id_-ageRatingDeclaration",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appInfos-{}-ageRatingDeclaration"
  },
  "title" : "Read the age-rating declaration"
}
-->

# Read the age-rating declaration

Get the age-rating declaration for an app info.

## Discussion

Responses for this endpoint include `contests` or `gambling` properties. In an app that has a `FREQUENT_OR_INTENSE` declaration for contests, the age rating for the `AppInfos` is 12+. If you declare a value of true for `gambling`, the age rating for the `AppInfos` is 17+.

### Read the age-rating declaration

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/appInfos/994af4c0-ff6c-fdb9-e053-d23ab111187e/ageRatingDeclaration
```

**Response:**

```json
{
  "data": {
    "type": "ageRatingDeclarations",
    "id": "994af4c0-ff6c-fdb9-e053-d23ab111187e",
    "attributes": {
      "alcoholTobaccoOrDrugUseOrReferences": "NONE",
      "contests": "FREQUENT_OR_INTENSE",
      "gambling": false,
      "gamblingSimulated": "NONE",
      "kidsAgeBand": null,
      "medicalOrTreatmentInformation": "NONE",
      "profanityOrCrudeHumor": "NONE",
      "sexualContentGraphicAndNudity": "NONE",
      "sexualContentOrNudity": "NONE",
      "horrorOrFearThemes": "NONE",
      "matureOrSuggestiveThemes": "NONE",
      "unrestrictedWebAccess": false,
      "violenceCartoonOrFantasy": "NONE",
      "violenceRealisticProlongedGraphicOrSadistic": "NONE",
      "violenceRealistic": "NONE"
    },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/994af4c0-ff6c-fdb9-e053-d23ab111187e"
  }
},
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appInfos/994af4c0-ff6c-fdb9-e053-d23ab111187e/ageRatingDeclaration"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)