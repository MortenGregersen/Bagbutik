<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageVersionResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageVersionResponse"
  },
  "title" : "AlternativeDistributionPackageVersionResponse"
}
-->

# AlternativeDistributionPackageVersionResponse

The response body for endpoints that read a single alternative distribution package version.

```
object AlternativeDistributionPackageVersionResponse
```

## Discussion

This object is the response that contains a single alternative distribution package version. For more information, see [`Read Information for an Alternative Distribution Package Version`](/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVersions-_id_). The schema of the response body is below.

```javascript
{
  "data": {
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
    "self": "string"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)