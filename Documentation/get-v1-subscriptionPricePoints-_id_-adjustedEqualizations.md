<!--
{
  "availability" : [
    "App Store Connect API: 4.4.1 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-subscriptionPricePoints-_id_-adjustedEqualizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-subscriptionPricePoints-{}-adjustedEqualizations"
  },
  "title" : "List adjusted equalizations for a subscription price point"
}
-->

# List adjusted equalizations for a subscription price point

List the adjusted territory equalizations for a subscription price point.

## Overview

Use this endpoint with filters to identify a specific adjusted equalization. Provide the `filter[upfrontPricePointId]` and `filter[planType]` query parameters, for example:

```
GET /v1/subscriptionPricePoints/{pricePointId}/adjustedEqualizations?filter[upfrontPricePointId]=$id&filter[planType]=MONTHLY
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)