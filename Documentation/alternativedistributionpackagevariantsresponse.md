<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageVariantsResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageVariantsResponse"
  },
  "title" : "AlternativeDistributionPackageVariantsResponse"
}
-->

# AlternativeDistributionPackageVariantsResponse

A response containing a list of device-specific variants within an alternative distribution package.

```
object AlternativeDistributionPackageVariantsResponse
```

## Discussion

This object is the response that contains a list of alternative distribution package variants. For more information, see [`List Variants Information`](/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVersions-_id_-variants). The schema of the response body is below.

```javascript
{
  "data": [
    {
      "type": "alternativeDistributionPackageVariants",
      "id": "string",
      "attributes": {
        "url": "string",
        "urlExpirationDate": "2024-02-27T00:58:50.105Z",
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