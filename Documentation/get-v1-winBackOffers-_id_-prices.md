<!--
{
  "availability" : [

  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-winBackOffers-_id_-prices",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-winBackOffers-{}-prices"
  },
  "title" : "List Win-Back Offer Prices"
}
-->

# List Win-Back Offer Prices

The data structure that represents a get-v1-win back offers-{id}-prices resource.

## Overview

List all prices for specific win-back offers.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/prices
```

**Response:**

```json
{
  "data": [
    {
      "type": "winBackOfferPrices",
      "id": "eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiQ0FOIiwicCI6IjEwMTQyIn0",
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/winBackOfferPrices/eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiQ0FOIiwicCI6IjEwMTQyIn0"
      }
    },
    {
      "type": "winBackOfferPrices",
      "id": "eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiVVNBIiwicCI6IjEwMTI3In0",
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/winBackOfferPrices/eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiVVNBIiwicCI6IjEwMTI3In0"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/prices"
  },
  "meta": {
    "paging": {
      "total": 2,
      "limit": 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)