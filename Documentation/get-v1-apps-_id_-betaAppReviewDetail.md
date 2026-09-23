<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-betaAppReviewDetail",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-betaAppReviewDetail"
  },
  "title" : "Read the beta app review details resource of an app"
}
-->

# Read the beta app review details resource of an app

Get the beta app review details for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppReviewDetail
```

**Response:**

```json
{
    "data": {
        "type": "betaAppReviewDetails",
        "id": "6446998023",
        "attributes": {
            "contactFirstName": "Johnny",
            "contactLastName": "Appleseed",
            "contactPhone": "8001234567",
            "contactEmail": "example@apple.com",
            "demoAccountName": null,
            "demoAccountPassword": null,
            "demoAccountRequired": false,
            "notes": null
        },
        "relationships": {
            "app": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/6446998023/relationships/app",
                    "related": "https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/6446998023/app"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/6446998023"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppReviewDetail"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)