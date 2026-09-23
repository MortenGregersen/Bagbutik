<!--
{
  "availability" : [
    "App Store Connect API: 3.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-gameCenterDetails-_id_-gameCenterAchievements",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-gameCenterDetails-{}-gameCenterAchievements"
  },
  "title" : "List All Achievements"
}
-->

# List All Achievements

List all achievement information for a Game Center detail.

## Discussion

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements
```

**Response:**

```json
{
  “data” : [ {
    “type” : “gameCenterAchievements”,
    “id” : “304e0f56-63b2-492f-980e-bce6fafb8502”,
    “attributes” : {
      “referenceName” : “Perfectly Steamed Milk Texture”,
      “vendorIdentifier” : “PSMT_ACH”,
      “points” : 0,
      “showBeforeEarned” : false,
      “repeatable” : true,
      “archived” : false
    },
    “relationships” : {
      “groupAchievement” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/groupAchievement”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/groupAchievement”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/releases”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502”
    }
  }, {
    “type” : “gameCenterAchievements”,
    “id” : “b5c383e5-c451-4cfe-9b31-9519c4106843”,
    “attributes” : {
      “referenceName” : “Fastest Service”,
      “vendorIdentifier” : “FS_ACH”,
      “points” : 0,
      “showBeforeEarned” : false,
      “repeatable” : false,
      “archived” : false
    },
    “relationships” : {
      “groupAchievement” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/relationships/groupAchievement”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/groupAchievement”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843/releases”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b5c383e5-c451-4cfe-9b31-9519c4106843”
    }
  }, {
    “type” : “gameCenterAchievements”,
    “id” : “b1392192-da63-4156-a39c-82f1278d465e”,
    “attributes” : {
      “referenceName” : “Cold Brew Timing”,
      “vendorIdentifier” : “CBT_ACH”,
      “points” : 0,
      “showBeforeEarned” : false,
      “repeatable” : false,
      “archived” : false
    },
    “relationships” : {
      “groupAchievement” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/relationships/groupAchievement”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/groupAchievement”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e/releases”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/b1392192-da63-4156-a39c-82f1278d465e”
    }
  }, {
    “type” : “gameCenterAchievements”,
    “id” : “ced67adc-b153-46f0-9d4c-3ee649a35267”,
    “attributes” : {
      “referenceName” : “Just Sweet Enough”,
      “vendorIdentifier” : “JSE_ACH”,
      “points” : 0,
      “showBeforeEarned” : false,
      “repeatable” : false,
      “archived” : false
    },
    “relationships” : {
      “groupAchievement” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/relationships/groupAchievement”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/groupAchievement”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267/releases”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/ced67adc-b153-46f0-9d4c-3ee649a35267”
    }
  }, {
    “type” : “gameCenterAchievements”,
    “id” : “10735ae0-55a7-4c3f-88f8-737a93fe0a36”,
    “attributes” : {
      “referenceName” : “Bean Blend”,
      “vendorIdentifier” : “BB_ACH”,
      “points” : 0,
      “showBeforeEarned” : false,
      “repeatable” : false,
      “archived” : false
    },
    “relationships” : {
      “groupAchievement” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/relationships/groupAchievement”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/groupAchievement”
        }
      },
      “localizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/relationships/localizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/localizations”
        }
      },
      “releases” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/relationships/releases”,
          “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36/releases”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/10735ae0-55a7-4c3f-88f8-737a93fe0a36”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements?limit=5”
  },
  “meta” : {
    “paging” : {
      “total” : 5,
      “limit” : 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)