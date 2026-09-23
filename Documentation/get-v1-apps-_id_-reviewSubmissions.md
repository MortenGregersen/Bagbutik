<!--
{
  "availability" : [
    "App Store Connect API: 1.7.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-reviewSubmissions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-reviewSubmissions"
  },
  "title" : "Get Review Submissions for an App"
}
-->

# Get Review Submissions for an App

Get a list of review submissions associated with a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6446998023/reviewSubmissions
```

**Response:**

```json
{
    "data": [
        {
            "type": "reviewSubmissions",
            "id": "fda9bd85-170b-4a1c-8d78-c2b445527542",
            "attributes": {
                "platform": "IOS",
                "submittedDate": null,
                "state": "READY_FOR_REVIEW"
            },
            "relationships": {
                "items": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/reviewSubmissions/fda9bd85-170b-4a1c-8d78-c2b445527542/relationships/items",
                        "related": "https://api.appstoreconnect.apple.com/v1/reviewSubmissions/fda9bd85-170b-4a1c-8d78-c2b445527542/items"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/reviewSubmissions/fda9bd85-170b-4a1c-8d78-c2b445527542"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/reviewSubmissions"
    },
    "meta": {
        "paging": {
            "total": 1,
            "limit": 50
        }
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)