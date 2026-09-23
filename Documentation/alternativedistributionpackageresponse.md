<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageResponse"
  },
  "title" : "AlternativeDistributionPackageResponse"
}
-->

# AlternativeDistributionPackageResponse

The response body for endpoints that read a single alternative distribution package.

```
object AlternativeDistributionPackageResponse
```

## Discussion

This object is the response that contains a single the alternative distribution package. For more information, see Creating and reading distribution packages. The schema of the response body is below.

```javascript
{
  "data": {
    "type": "alternativeDistributionPackages",
    "id": "string",
    "relationships": {
      "versions": {
        "links": {
          "self": "string",
          "related": "string"
        },
        "meta": {
          "paging": {
            "total": 0,
            "limit": 0
          }
        },
        "data": [
          {
            "type": "alternativeDistributionPackageVersions",
            "id": "string"
          }
        ]
      }
    },
    "links": {
      "self": "string"
    }
  },
  "included": [
    {
      "type": "alternativeDistributionPackageVersions",
      "id": "string",
      "attributes": {
        "url": "string",
        "urlExpirationDate": "2024-02-23T15:32:57.654Z",
        "version": "string",
        "state": "COMPLETED"
      },
      "relationships": {
        "variants": {
          "links": {
            "self": "string",
            "related": "string"
          },
          "meta": {
            "paging": {
              "total": 0,
              "limit": 0
            }
          },
          "data": [
            {
              "type": "alternativeDistributionPackageVariants",
              "id": "string"
            }
          ]
        },
        "deltas": {
          "links": {
            "self": "string",
            "related": "string"
          },
          "meta": {
            "paging": {
              "total": 0,
              "limit": 0
            }
          },
          "data": [
            {
              "type": "alternativeDistributionPackageDeltas",
              "id": "string"
            }
          ]
        },
        "alternativeDistributionPackage": {
          "links": {
            "self": "string",
            "related": "string"
          },
          "data": {
            "type": "alternativeDistributionPackages",
            "id": "string"
          }
        }
      },
      "links": {
        "self": "string"
      }
    }
  ],
  "links": {
    "self": "string"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)