<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/AlternativeDistributionKeyResponse",
  "metadataVersion" : "0.1.0",
  "role" : "Object",
  "symbol" : {
    "kind" : "Object",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "data:app_store_connect_api:AlternativeDistributionKeyResponse"
  },
  "title" : "AlternativeDistributionKeyResponse"
}
-->

# AlternativeDistributionKeyResponse

The response body for endpoints that create or read a single alternative distribution key.

```
object AlternativeDistributionKeyResponse
```

## Discussion

This object is the response from the alternative distribution key endpoints. For more information about alternative distribution keys, see Creating and reading keys.

```javascript
{
  "data": {
     "type": "alternativeDistributionKeys",
     "id": "string",
     "attributes": {
       "publicKey": "string"
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