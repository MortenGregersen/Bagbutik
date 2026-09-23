<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v1-appInfos-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v1-appInfos-{}"
  },
  "title" : "Modify an app info"
}
-->

# Modify an app info

Update the App Store categories and sub-categories for your app.

## Discussion

Use this endpoint to modify the primary and secondary categories and subcategories for an app.

### Add an App to the Games Category and the Sports and Role Playing Subcategories

**Request:**

```
PATCH https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4

{
  "data": {
    "type": "appInfos",
    "id": "61d77dc2-9313-4330-b169-d179277ccfc4",
    "relationships": {
      "primaryCategory": {
        "data": {
          "type": "appCategories",
          "id": "GAMES"
        }
      },
      "primarySubcategoryOne": {
        "data": {
          "type": "appCategories",
          "id": "GAMES_SPORTS"
        }
      },
      "primarySubcategoryTwo": {
        "data": {
          "type": "appCategories",
          "id": "GAMES_ROLE_PLAYING"
        }
      }
    }
  }
}
```

**Response:**

```json
{
  "data": {
    "type": "appInfos",
    "id": "61d77dc2-9313-4330-b169-d179277ccfc4",
    "attributes": {
      "appStoreState": "READY_FOR_SALE",
      "appStoreAgeRating": "TWELVE_PLUS",
      "brazilAgeRating": "FOURTEEN",
      "kidsAgeBand": null
    },
    "relationships": {
      "app": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/app",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/app"
        }
      },
      "appInfoLocalizations": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/appInfoLocalizations",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/appInfoLocalizations"
        }
      },
      "primaryCategory": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/primaryCategory",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/primaryCategory"
        }
      },
      "primarySubcategoryOne": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/primarySubcategoryOne",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/primarySubcategoryOne"
        }
      },
      "primarySubcategoryTwo": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/primarySubcategoryTwo",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/primarySubcategoryTwo"
        }
      },
      "secondaryCategory": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/secondaryCategory",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/secondaryCategory"
        }
      },
      "secondarySubcategoryOne": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/secondarySubcategoryOne",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/secondarySubcategoryOne"
        }
      },
      "secondarySubcategoryTwo": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/relationships/secondarySubcategoryTwo",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4/secondarySubcategoryTwo"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appInfos/61d77dc2-9313-4330-b169-d179277ccfc4"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)