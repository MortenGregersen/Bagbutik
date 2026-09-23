<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-betaGroups",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-betaGroups"
  },
  "title" : "List all beta groups for an app"
}
-->

# List all beta groups for an app

Get a list of beta groups associated with a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaGroups
```

**Response:**

```json
{
    “data”: [
        {
            “type”: “betaGroups”,
            “id”: “26b3c3c4-aeb1-4d24-be6a-80c554f671a2”,
            “attributes”: {
                “name”: “Internal Test Group”,
                “createdDate”: “2022-09-07T18:25:13.582Z”,
                “isInternalGroup”: true,
                “hasAccessToAllBuilds”: true,
                “publicLinkEnabled”: null,
                “publicLinkId”: null,
                “publicLinkLimitEnabled”: null,
                “publicLinkLimit”: null,
                “publicLink”: null,
                “feedbackEnabled”: true,
                “iosBuildsAvailableForAppleSiliconMac”: true
            },
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)