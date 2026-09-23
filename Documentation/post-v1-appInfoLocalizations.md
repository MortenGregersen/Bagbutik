<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-appInfoLocalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-appInfoLocalizations"
  },
  "title" : "Create an app info localization"
}
-->

# Create an app info localization

Add app-level localized information for a new locale.

## Discussion

Use this endpoint to add localized app information for a new locale. Be sure to use [`Create an app store version localization`](/documentation/AppStoreConnectAPI/POST-v1-appStoreVersionLocalizations) to add the same locale to the version as well.

> Important:
> If the App Store version and the app info don’t have the same set of localizations, you will receive an erorr when you submit the version to the App Store.

### Add Localized App Information in US English

**Request:**

```
POST https://api.appstoreconnect.apple.com/v1/appInfoLocalizations

{
  "data": {
    "type": "appInfoLocalizations",
    "attributes": {
      "locale": "en-US",
      "name": "Forest Explorer",
      "subtitle": "Hikes, trails, and maps",
      "privacyPolicyUrl": "https://forestexplorer.apple.com/privacy-simple"
    },
    "relationships": {
      "appInfo": {
        "data": {
          "type": "appInfos",
          "id": "9c8e7e2b-07a8-45d9-8951-948507275bc6"
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
    "type": "appInfoLocalizations",
    "id": "9c8e7e2b-07a8-45d9-8951-948507275bc6",
    "attributes": {
      "locale": "en-GB",
      "name": "Forest Explorer",
      "subtitle": "Hikes, trails, and maps",
      "privacyPolicyUrl": "https://forestexplorer.apple.com/privacy-simple",
      "privacyPolicyText": null
    },
    "relationships": {
      "appInfo": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/appInfoLocalizations/74ae3739-d321-4f83-afc3-3b66043ff163/relationships/appInfo",
          "related": "https://api.appstoreconnect.apple.com/v1/appInfoLocalizations/74ae3739-d321-4f83-afc3-3b66043ff163/appInfo"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/appInfoLocalizations/74ae3739-d321-4f83-afc3-3b66043ff163"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/appInfoLocalizations/74ae3739-d321-4f83-afc3-3b66043ff163"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)