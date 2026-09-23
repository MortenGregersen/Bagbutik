<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageVersionsResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageVersionsResponse"
  },
  "title" : "AlternativeDistributionPackageVersionsResponse"
}
-->

# AlternativeDistributionPackageVersionsResponse

The response body for endpoints that list versions of an alternative distribution package.

```
object AlternativeDistributionPackageVersionsResponse
```

## Discussion

This object is the response that contains a list of alternative distribution package versions. For more information, see [`Read Version Information for an Alternative Distribution Package`](/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackages-_id_-versions). The schema of the response body is below.

```javascript
{
  "data": [
    {
      "type": "alternativeDistributionPackageVersions",
      "id": "string",
      "attributes": {
        "url": "string",
        "urlExpirationDate": "2025-02-23T06:55:44.288Z",
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
    },
    "included": [
      {
        "type": "alternativeDistributionPackageVariants",
        "id": "string",
        "attributes": {
          "url": "string",
          "urlExpirationDate": "2025-02-23T06:55:44.288Z",
          "alternativeDistributionKeyBlob": "string"
        },
        "links": {
          "self": "string"
        }
      },
      {
        "type": "alternativeDistributionPackageDeltas",
        "id": "string",
        "attributes": {
          "url": "string",
          "urlExpirationDate": "2025-02-23T06:55:44.288Z",
          "alternativeDistributionKeyBlob": "string"
        },
        "links": {
          "self": "string"
        }
      },
      {
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
      }
    ],
    "links": {
      "self": "string",
      "first": "string",
      "next": "string"
    },
    "meta": {
      "paging": {
        "total": 0,
        "limit": 0
      }
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)