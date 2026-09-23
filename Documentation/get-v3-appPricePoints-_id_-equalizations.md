<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v3-appPricePoints-_id_-equalizations",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v3-appPricePoints-{}-equalizations"
  },
  "title" : "List App Price Point Equalizations"
}
-->

# List App Price Point Equalizations

List all equivalent app prices points to a base price point.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/equalizations?filter%5Bterritory%5D=USA,MEX&include=territory&fields%5BappPricePoints%5D=customerPrice,proceeds,territory&limit=5
```

**Response:**

```json
{
  “data” : [ {
    “type” : “appPricePoints”,
    “id” : “eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJNRVgiLCJwIjoiMTAwMDEifQ”,
    “attributes” : {
      “customerPrice” : “19.0”,
      “proceeds” : “13.3”
    },
    “relationships” : {
      “territory” : {
        “data” : {
          “type” : “territories”,
          “id” : “MEX”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJNRVgiLCJwIjoiMTAwMDEifQ”
    }
  }, {
    “type” : “appPricePoints”,
    “id” : “eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ”,
    “attributes” : {
      “customerPrice” : “0.29”,
      “proceeds” : “0.2”
    },
    “relationships” : {
      “territory” : {
        “data” : {
          “type” : “territories”,
          “id” : “USA”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJVU0EiLCJwIjoiMTAwMDEifQ”
    }
  } ],
  “included” : [ {
    “type” : “territories”,
    “id” : “MEX”,
    “attributes” : {
      “currency” : “MXN”
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/territories/MEX”
    }
  }, {
    “type” : “territories”,
    “id” : “USA”,
    “attributes” : {
      “currency” : “USD”
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/territories/USA”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/equalizations?include=territory&fields%5BappPricePoints%5D=proceeds%2CcustomerPrice%2Cterritory&filter%5Bterritory%5D=MEX%2CUSA&limit=5”
  },
  “meta” : {
    “paging” : {
      “total” : 2,
      “limit” : 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)