<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageDeltasResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageDeltasResponse"
  },
  "title" : "AlternativeDistributionPackageDeltasResponse"
}
-->

# AlternativeDistributionPackageDeltasResponse

A response containing a list of delta updates available for an alternative distribution package.

```
object AlternativeDistributionPackageDeltasResponse
```

## Discussion

This object is the response that contains a list of alternative distribution package deltas. For more information about alternative distribution package deltas, see [`List Deltas Information`](/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVersions-_id_-deltas). The schema of the response body is below.

```javascript
{
  "data": [
    {
      "type": "alternativeDistributionPackageDeltas",
      "id": "string",
      "attributes": {
        "url": "string",
        "urlExpirationDate": "2024-02-27T00:38:37.222Z",
        "alternativeDistributionKeyBlob": "string"
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
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)