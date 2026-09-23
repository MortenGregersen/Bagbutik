<!--
{
  "availability" : [
    "App Store Connect API: 2.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-customerReviews",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-customerReviews"
  },
  "title" : "List all customer reviews for an app"
}
-->

# List all customer reviews for an app

Get a list of customer reviews for a specific app.

## Discussion

The example below limits the number of reviews returned in the response.

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/682658836/customerReviews?limit=1
```

**Response:**

```json
{
  "data": [
    {
      "type": "customerReviews",
      "id": "00000028-b08c-0014-729e-fbd500000000",
      "attributes": {
        "rating": 5,
        "title": "Awesome!!!",
        "body": "It's a really fantastic app!",
        "reviewerNickname": "Anne Johnson",
        "createdDate": "2017-11-15T08:10:34-08:00",
        "territory": "USA"
      },
      "relationships": {
        "response": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-729e-fbd500000000/relationships/response",
            "related": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-729e-fbd500000000/response"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/customerReviews/00000028-b08c-0014-729e-fbd500000000"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/apps/682658836/customerReviews?limit=1",
    "next": "https://api.appstoreconnect.apple.com/v1/apps/682658836/customerReviews?cursor=AQ.AMt2C-U&limit=1"
  },
  "meta": {
    "paging": {
      "total": 4326,
      "limit": 1
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)