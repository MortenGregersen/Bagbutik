<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterAppVersions-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterAppVersions-{}"
  },
  "title" : "Read app version information"
}
-->

# Read app version information

Read the Game Center enablement state and related app version information.

## Discussion

### Example Request and Response

**Other:**

```not specified
https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc
```

**Other:**

```json
{
  “data” : {
    “type” : “gameCenterAppVersions”,
    “id” : “1d9b87fb-80c4-44eb-a114-a51aeebd82fc”,
    “attributes” : {
      “enabled” : false
    },
    “relationships” : {
      “compatibilityVersions” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/relationships/compatibilityVersions”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/compatibilityVersions”
        }
      },
      “appStoreVersion” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/relationships/appStoreVersion”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc/appStoreVersion”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc”
    }
  },
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/1d9b87fb-80c4-44eb-a114-a51aeebd82fc”
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)