<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-endUserLicenseAgreement",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-endUserLicenseAgreement"
  },
  "title" : "Read the end user license agreement information of an app"
}
-->

# Read the end user license agreement information of an app

Get the custom end user license agreement (EULA) for a specific app and the territories where the agreement applies.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/1000001234/endUserLicenseAgreement
```

**Response:**

```json
{
  "data": {
    "type": "endUserLicenseAgreements",
    "id": "d187a413-70fb-45c7-ae43-12345ea0d40",
    "attributes": {
      "agreementText": "This is the agreement. It is vital you read it."
    },
    "relationships": {
      "territories": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/d187a413-70fb-45c7-ae43-12345ea0d40/relationships/territories",
          "related": "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/d187a413-70fb-45c7-ae43-12345ea0d40/territories"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/endUserLicenseAgreements/d187a413-70fb-45c7-ae43-12345ea0d40"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/1000001234/endUserLicenseAgreement"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)