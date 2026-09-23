<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-betaLicenseAgreement",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-betaLicenseAgreement"
  },
  "title" : "Read the beta license agreement of an app"
}
-->

# Read the beta license agreement of an app

Get the beta license agreement for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaLicenseAgreement
```

**Response:**

```json
{
    "data": {
        "type": "betaLicenseAgreements",
        "id": "66237ae8-4920-497d-90f5-3f9acc76ec95",
        "attributes": {
            "agreementText": "This is the Beta License Agreement for your Your Next Cortado. You are testing pre-release version of this app. Here are some more thoughts about a beta coffee app. The coffee might not be dialed in and you may experience less than perfect coffee."
        },
        "relationships": {
            "app": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/66237ae8-4920-497d-90f5-3f9acc76ec95/relationships/app",
                    "related": "https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/66237ae8-4920-497d-90f5-3f9acc76ec95/app"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/66237ae8-4920-497d-90f5-3f9acc76ec95"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaLicenseAgreement"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)