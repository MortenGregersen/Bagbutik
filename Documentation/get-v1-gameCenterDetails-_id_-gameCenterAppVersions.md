<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterDetails-_id_-gameCenterAppVersions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterDetails-{}-gameCenterAppVersions"
  },
  "title" : "Read app versions for a game center detail"
}
-->

# Read app versions for a game center detail

Get a list of app versions for a Game Center detail.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/gameCenterAppVersions?limit=5
```

**Response:**

```json
{
  “data” : [ {
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
  }, {
    “type” : “gameCenterAppVersions”,
    “id” : “6ee80093-de91-9073-a043-4e7dcd28ae7b”,
    “attributes” : {
      “enabled” : true
    },
    “relationships” : {
      “compatibilityVersions” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/relationships/compatibilityVersions”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/compatibilityVersions”
        }
      },
      “appStoreVersion” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/relationships/appStoreVersion”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b/appStoreVersion”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/6ee80093-de91-9073-a043-4e7dcd28ae7b”
    }
  }, {
    “type” : “gameCenterAppVersions”,
    “id” : “7bb8ca27-b622-43e1-a838-15b18dc58421”,
    “attributes” : {
      “enabled” : true
    },
    “relationships” : {
      “compatibilityVersions” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/relationships/compatibilityVersions”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/compatibilityVersions”
        }
      },
      “appStoreVersion” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/relationships/appStoreVersion”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421/appStoreVersion”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/7bb8ca27-b622-43e1-a838-15b18dc58421”
    }
  }, {
    “type” : “gameCenterAppVersions”,
    “id” : “97c63a59-3dee-a1b3-6bec-5f0a2245c445”,
    “attributes” : {
      “enabled” : true
    },
    “relationships” : {
      “compatibilityVersions” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/relationships/compatibilityVersions”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/compatibilityVersions”
        }
      },
      “appStoreVersion” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/relationships/appStoreVersion”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445/appStoreVersion”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/97c63a59-3dee-a1b3-6bec-5f0a2245c445”
    }
  }, {
    “type” : “gameCenterAppVersions”,
    “id” : “a3d76fe2-5baf-e9e7-198f-dcec974711eb”,
    “attributes” : {
      “enabled” : true
    },
    “relationships” : {
      “compatibilityVersions” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/relationships/compatibilityVersions”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/compatibilityVersions”
        }
      },
      “appStoreVersion” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/relationships/appStoreVersion”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb/appStoreVersion”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAppVersions/a3d76fe2-5baf-e9e7-198f-dcec974711eb”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/gameCenterAppVersions?limit=5”,
    “next” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/83b895ff-7bfe-5056-1208-ffd0d6a74e46/gameCenterAppVersions?cursor=ODExNDMwNzYw.Wc8eXw&limit=5”
  },
  “meta” : {
    “paging” : {
      “total” : 14,
      “limit” : 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)