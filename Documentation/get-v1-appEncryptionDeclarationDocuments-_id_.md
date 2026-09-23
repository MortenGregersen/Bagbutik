<!--
{
  "availability" : [
    "App Store Connect API: 2.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appEncryptionDeclarationDocuments-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appEncryptionDeclarationDocuments-{}"
  },
  "title" : "Read a specific app encryption declaration document"
}
-->

# Read a specific app encryption declaration document

Get detailed information about a specified App Encryption Declaration document.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarationDocuments/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9
```

**Response:**

```json
{  "data": {
    "type": "appEncryptionDeclarationDocuments",
    "id": "e55c4bbe-a1b9-427c-99cf-fd8db5050fc9",
    "attributes": {
      "fileSize": 186110,
      "fileName": "EncryptionDocumentation.pdf",
      "assetToken": "Purple113/v4/11/d4/08/11d408a8-e57a-4541-60bb-4192a3722623/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9_EncryptionDocumentation.pdf",
      "downloadUrl": "https://misc-assets.itunes.apple.com/itunes-assets/Purple113/v4/11/d4/08/11d408a8-e57a-4541-60bb-4192a3722623/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9_EncryptionDocumentation.pdf?accessKey=1675040844_8877869041959196296_dpXq9G7f4BF3oguy1BccshsmBYPlFP1xE4%2FenEAhRgymD2MPBYd1P%2BZopSavvkw3ZxuTRBGQwxHg4aBoWBl1UVFWOnW6nwI9Scivbm5vCk7GDEuVOImbEDaMYDC5Xxtag%2BVd2P4gDO7kdp%2FpPcnGLQFQ83RYrqfOqSqLstXnTwpbK9FPiQlGo1xIMZZYvLq5STbnREud24pbdmvvtUexlCoFuR7tjvpmRrlD0LGUUSs%3D",
      "sourceFileChecksum": "d228e04d46284ca195ad1ac7d13e269b",
      "uploadOperations": null,
      "assetDeliveryState": {
        "errors": [],
        "warnings": null,
        "state": "COMPLETE"
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarationDocuments/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarationDocuments/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)