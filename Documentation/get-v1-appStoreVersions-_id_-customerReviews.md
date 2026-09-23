<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appStoreVersions-_id_-customerReviews",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appStoreVersions-{}-customerReviews"
  },
  "title" : "List all customer reviews for an app store version"
}
-->

# List all customer reviews for an app store version

Get a list of customer reviews for a specific version of your app.

## Discussion

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/appStoreVersions/d716c220-3de9-4cf2-a885-8cfb43a11087/customerReviews?limit=1&filter%5Bterritory%5D=USA
```

**Response:**

```json
{
  "data": [
    {
      "type": "customerReviews",
      "id": "00000028-b08c-0014-9674-c54800000000",
      "attributes": {
        "rating": 5,
        "title": "Pretty Stellar",
        "body": "I love how creative I can be when I use this app. I can really explore the depths of my imagination!",
        "reviewerNickname": "Juan Chavez",
        "createdDate": "2024-01-02T11:19:36-07:00",
        "territory": "USA"
      },
      "relationships": {
        "response": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-9674-c54800000000/relationships/response",
            "related": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-9674-c54800000000/response"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-9674-c54800000000"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/d716c220-3de9-4cf2-a885-8cfb43a11087/customerReviews?filter%5Bterritory%5D=USA&limit=1",
    "next": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/d716c220-3de9-4cf2-a885-8cfb43a11087/customerReviews?cursor=AQ.AJJtGDc&filter%5Bterritory%5D=USA&limit=1"
  },
  "meta": {
    "paging": {
      "total": 10,
      "limit": 1
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)