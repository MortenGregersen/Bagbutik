<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-betaAppLocalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-betaAppLocalizations"
  },
  "title" : "List all beta app localizations of an app"
}
-->

# List all beta app localizations of an app

Get a list of localized beta test information for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppLocalizations
```

**Response:**

```json
{
    "data": [
        {
            "type": "betaAppLocalizations",
            "id": "318d7ad7-6d08-403d-84f4-1eb8d9ba9071",
            "attributes": {
                "feedbackEmail": "example@apple.com",
                "marketingUrl": null,
                "privacyPolicyUrl": null,
                "tvOsPrivacyPolicy": null,
                "description": null,
                "locale": "en-US"
            },
            "relationships": {
                "app": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/318d7ad7-6d08-403d-84f4-1eb8d9ba9071/relationships/app",
                        "related": "https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/318d7ad7-6d08-403d-84f4-1eb8d9ba9071/app"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/318d7ad7-6d08-403d-84f4-1eb8d9ba9071"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaAppLocalizations"
    },
    "meta": {
        "paging": {
            "total": 1,
            "limit": 50
        }
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)