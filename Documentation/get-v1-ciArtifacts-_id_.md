<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciArtifacts-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciArtifacts-{}"
  },
  "title" : "Read xcode cloud artifact information"
}
-->

# Read xcode cloud artifact information

Get information about the artifact Xcode Cloud created for a specific action when it performed a build.

## Discussion

The example request below retrieves detailed information about a specific artifact Xcode Cloud created when it performed a build. Use the information provided to download the artifact and store it on your own servers. Note that the returned download URL is only valid for a limited amount of time.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciArtifacts/73be0e4e-6da2-471a-b652-47bd99885dbc
```

**Response:**

```json
{    
"data": {
        "type": "ciArtifacts",
        "id": "73be0e4e-6da2-471a-b652-47bd99885dbc",
        "attributes": {
            "fileType": "LOG_BUNDLE",
            "fileName": "exampleName",
            "fileSize": 19,
            "downloadUrl": "https://example.com/url-to-artifact"
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciArtifacts/73be0e4e-6da2-471a-b652-47bd99885dbc"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciArtifacts/73be0e4e-6da2-471a-b652-47bd99885dbc"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)