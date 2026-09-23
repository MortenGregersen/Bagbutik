<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionPackageVariantResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionPackageVariantResponse"
  },
  "title" : "AlternativeDistributionPackageVariantResponse"
}
-->

# AlternativeDistributionPackageVariantResponse

A response containing a single variant of an alternative distribution package.

```
object AlternativeDistributionPackageVariantResponse
```

## Discussion

This object is the response that contains a single alternative distribution package variant. For more information, see [`Read variant information for an alternative distribution package`](/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVariants-_id_). The schema of the response body is below.

```javascript
{
  "data": {
    "type": "alternativeDistributionPackageVariants",
    "id": "string",
    "attributes": {
      "url": "string",
      "urlExpirationDate": "2025-02-23T06:53:07.520Z",
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