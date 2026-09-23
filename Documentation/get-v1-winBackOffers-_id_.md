<!--
{
  "availability" : [

  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-winBackOffers-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-winBackOffers-{}"
  },
  "title" : "Read Win-Back Offer Information"
}
-->

# Read Win-Back Offer Information

The data structure that represents a get-v1-win back offers-{id} resource.

## Overview

Read details about a specific win-back offer.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500       
```

**Response:**

```json
{
  "data": {
    "type": "winBackOffers",
    "id": "10778326500",
    "attributes": {
      "referenceName": "6 Months for 3 A",
      "offerId": "6Monthfor3_a",
      "duration": "SIX_MONTHS",
      "offerMode": "PAY_UP_FRONT",
      "periodCount": 1,
      "customerEligibilityPaidSubscriptionDurationInMonths": 6,
      "customerEligibilityTimeSinceLastSubscribedInMonths": {
        "minimum": 2,
        "maximum": 24
      },
      "customerEligibilityWaitBetweenOffersInMonths": 2,
      "startDate": "2024-07-01",
      "endDate": "2024-07-31",
      "priority": "HIGH",
      "promotionIntent": "NOT_PROMOTED"
    },
    "relationships": {
      "promotion": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/relationships/promotion",
          "related": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/promotion"
        }
      },
      "prices": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/relationships/prices",
          "related": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/prices"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)