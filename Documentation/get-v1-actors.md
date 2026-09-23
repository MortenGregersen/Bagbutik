<!--
{
  "availability" : [
    "App Store Connect API: 2.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-actors",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-actors"
  },
  "title" : "List all actors"
}
-->

# List all actors

Get a list of actors.

## Discussion

This endpoint supports multiple id’s in the filter paramenter.

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/actors?filter%5Bid%5D=USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73,USER%3A83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3
```

**Response:**

```json
{  “data” : [ {
    “type” : “actors”,
    “id” : “USER:83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3”,
    “attributes” : {
      “actorType” : “USER”,
      “userFirstName” : “Maria”,
      “userLastName” : “Ruiz”,
      “userEmail” : “mruiz2@icloud.com”,
      “apiKeyId” : null
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/actors/USER%3A83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3”
    }
  }, {
    “type” : “actors”,
    “id” : “USER:2cd2a1ef-cb74-411c-a078-0ebe119ade73”,
    “attributes” : {
      “actorType” : “USER”,
      “userFirstName” : “Bill”,
      “userLastName” : “James”,
      “userEmail” : “billjames2@icloud.com”,
      “apiKeyId” : null
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/actors/USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/actors?filter%5Bid%5D=USER%3A2cd2a1ef-cb74-411c-a078-0ebe119ade73%2CUSER%3A83f7ddc0-64d6-4e4f-a5d9-51d74a8009a3”
  },
  “meta” : {
    “paging” : {
      “total” : 2,
      “limit” : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)