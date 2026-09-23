<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-scmProviders-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-scmProviders-{}"
  },
  "title" : "Get a source code management provider"
}
-->

# Get a source code management provider

Get information about a specific source code management provider you connected to Xcode Cloud.

## Discussion

The example request below retrieves information about a specific source code management provider you connected to Xcode Cloud. Use the data provided in the response to read additional information; for example, repository information.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4
```

**Response:**

```json
{
    "data": {
        "type": "scmProviders",
        "id": "d1b5479e-ce72-402c-8b9a-ea26ef6773f4",
        "attributes": {
            "scmProviderType": {
                "kind": "GITHUB_CLOUD",
                "displayName": "GitHub",
                "isOnPremise": false
            },
            "url": "github.com"
        },
        "relationships": {
            "repositories": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4/relationships/repositories",
                    "related": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4/repositories"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/scmProviders/d1b5479e-ce72-402c-8b9a-ea26ef6773f4"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)