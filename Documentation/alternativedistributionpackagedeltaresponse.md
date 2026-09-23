<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageDeltaResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageDeltaResponse"
  },
  "title" : "AlternativeDistributionPackageDeltaResponse"
}
-->

# AlternativeDistributionPackageDeltaResponse

A response containing a single delta update for an alternative distribution package.

```
object AlternativeDistributionPackageDeltaResponse
```

## Discussion

This object is the response that contains a single alternative distribution package delta. For more information about alternative distribution package deltas see [`Read Information for Alternative Distribution Package Deltas`](/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageDeltas-_id_). The schema of the response body is below.

```javascript
{
  "data": {
    "type": "alternativeDistributionPackageDeltas",
    "id": "string",
    "attributes": {
      "url": "string",
      "urlExpirationDate": "2024-02-23T06:50:07.723Z",
      "alternativeDistributionKeyBlob": "string"
    },
    "links": {
      "self": "string"
    }
  },
  "links": {
    "self": "string"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)