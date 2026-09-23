<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/DELETE-v1-apps-_id_-relationships-betaTesters",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:delete:v1-apps-{}-relationships-betaTesters"
  },
  "title" : "Remove specified beta testers from all groups and builds of an app"
}
-->

# Remove specified beta testers from all groups and builds of an app

Remove one or more beta testers’ access to test any builds of a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/1000001234/relationships/betaTesters -d
"{
  "data": [
    {
      "type": "betaTesters",
      "id": "b6318884-4aa6-4586-bf0b-be97cf991817"
    }
  ]
}
"
```

**Response:**

```json
204 No Content
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)