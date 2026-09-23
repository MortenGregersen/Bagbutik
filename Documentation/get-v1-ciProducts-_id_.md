<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciProducts-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciProducts-{}"
  },
  "title" : "Read xcode cloud product information"
}
-->

# Read xcode cloud product information

Get information about a specific Xcode Cloud product.

## Discussion

The example request below retrieves information about a specific Xcode Cloud product. Use the data provided in the response to read additional information; for example, workflow information.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.comv1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469
```

**Response:**

```json
{
    "data": {
        "type": "ciProducts",
        "id": "1987a0d5-a64d-4799-b7d2-a9135ffca469",
        "attributes": {
            "name": "test-ac822ba6-97a1-4a4f-84f3-4b80a71150fc",
            "createdDate": "2021-08-17T18:02:43.097Z",
            "productType": "APP"
        },
        "relationships": {
            "app": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/app",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/app"
                }
            },
            "workflows": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/workflows",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/workflows"
                }
            },
            "primaryRepositories": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/primaryRepositories",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/primaryRepositories"
                }
            },
            "additionalRepositories": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/additionalRepositories",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/additionalRepositories"
                }
            },
            "buildRuns": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/relationships/buildRuns",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469/buildRuns"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/1987a0d5-a64d-4799-b7d2-a9135ffca469"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)