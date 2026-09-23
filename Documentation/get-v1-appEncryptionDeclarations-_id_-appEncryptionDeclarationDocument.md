<!--
{
  "availability" : [
    "App Store Connect API: 2.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appEncryptionDeclarations-_id_-appEncryptionDeclarationDocument",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appEncryptionDeclarations-{}-appEncryptionDeclarationDocument"
  },
  "title" : "Read the declaration document for an app encryption declaration"
}
-->

# Read the declaration document for an app encryption declaration

Read the associated document for a specific App Encryption Declaration.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/6c2ddd3b-6d5e-4535-95f9-ece2c72c3848/appEncryptionDeclarationDocument
```

**Response:**

```json
{
  "data" : {
    "type" : "appEncryptionDeclarationDocuments",
    "id" : "e55c4bbe-a1b9-427c-99cf-fd8db5050fc9",
    "attributes" : {
      "fileSize" : 186110,
      "fileName" : "EncryptionDocumentation.pdf",
      "assetToken" : "Purple113/v4/11/d4/08/11d408a8-e57a-4541-60bb-4192a3722623/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9_EncryptionDocumentation.pdf",
      "downloadUrl" : "https://misc-assets.itunes.apple.com/itunes-assets/Purple113/v4/11/d4/08/11d408a8-e57a-4541-60bb-4192a3722623/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9_EncryptionDocumentation.pdf?accessKey=1675044398_3481250329993679798_NHHQ2xtrY2EX3gS7CwgTVEwFSvYg1NO1KRtGg7LiuZQ9ASafREyyovMKVIm2AyCwWPHfd%2Fquw%2BrXJsN%2BAWBgKsOkNwTmjqrLA86eFDTPrajcum4yoziAitV%2BIiYH34nIreiGrF%2BMqePA%2FOijcxCGQH6Tle4YNoSb7q0B1SFcgFHUwCi9ML6hQIJ7AJyf2d4uJSouqy8zUWBwRDHBl2B0kpMj6BOSdY%2B22PiKpFQXweQ%3D",
      "sourceFileChecksum" : "d228e04d46284ca195ad1ac7d13e269b",
      "uploadOperations" : null,
      "assetDeliveryState" : {
        "errors" : [ ],
        "warnings" : null,
        "state" : "COMPLETE"
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarationDocuments/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/6c2ddd3b-6d5e-4535-95f9-ece2c72c3848/appEncryptionDeclarationDocument"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)