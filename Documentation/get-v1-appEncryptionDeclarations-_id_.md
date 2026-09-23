<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appEncryptionDeclarations-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appEncryptionDeclarations-{}"
  },
  "title" : "Read app encryption declaration information"
}
-->

# Read app encryption declaration information

Get information about a specific app encryption declaration.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82
```

**Response:**

```json
{
  "data" : {
    "type" : "appEncryptionDeclarations",
    "id" : "69ab60b8-2f7a-91d4-e053-5b8c7c110c82",
    "attributes" : {
      "usesEncryption" : true,
      "exempt" : false,
      "containsProprietaryCryptography" : true,
      "containsThirdPartyCryptography" : false,
      "availableOnFrenchStore" : true,
      "platform" : "ios",
      "uploadedDate" : "2017-04-22T12:16:46-07:00",
      "documentUrl" : "https://misc-assets.itunes.apple.com/itunes-assets/Purple122/v4/d7/95/a7/d795a76e-3979-1f01-7bfb-5e5f2743af01/pr_source.pdf?accessKey=1674990162_6254129799175828264_uoh8Pzf0BlIzad3Lf9lhp9aqsz3vbNsz9anPfOVET3eE3Pifrb07%2BGcanQHmdwQVYMwkOx%2BZ1Wz7sralhjPgdp8vms9wLknEkuC1XU8HJY5%2Bok%2FOcMYjOnxYpThTYZ%2F9BhUkRjupYVAJ1trISCCgn7oa5y%2BVCFckt3q8eTwhdo0%3D",
      "documentName" : "ECDoc.pdf",
      "documentType" : "pdf",
      "appEncryptionDeclarationState" : "APPROVED",
      "codeValue" : "1c9a2aa8-d0f6-466a-b5dd-d87d881c18c6"
    },
    "relationships" : {
      "app" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82/relationships/app",
          "related" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82/app"
        }
      },
      "builds" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82/relationships/builds"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/69ab60b8-2f7a-91d4-e053-5b8c7c110c82"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)