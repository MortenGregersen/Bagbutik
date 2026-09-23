<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-appPricePoints",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-apps-{}-appPricePoints"
  },
  "title" : "List All Price Points for an App"
}
-->

# List All Price Points for an App

Get all the available price points for a specific app.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPricePoints?filter%5Bterritory%5D=USA,CAN&include=territory&limit=5
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ",
    "attributes" : {
      "customerPrice" : "0.0",
      "proceeds" : "0.0"
    },
    "relationships" : {
      "equalizations" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ/relationships/equalizations",
          "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ/equalizations"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "CAN"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDAifQ"
    }
  }, {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ",
    "attributes" : {
      "customerPrice" : "1.39",
      "proceeds" : "0.97"
    },
    "relationships" : {
      "equalizations" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/relationships/equalizations",
          "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ/equalizations"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "CAN"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDEifQ"
    }
  }, {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ",
    "attributes" : {
      "customerPrice" : "2.79",
      "proceeds" : "1.95"
    },
    "relationships" : {
      "equalizations" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ/relationships/equalizations",
          "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ/equalizations"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "CAN"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDIifQ"
    }
  }, {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ",
    "attributes" : {
      "customerPrice" : "3.99",
      "proceeds" : "2.79"
    },
    "relationships" : {
      "equalizations" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ/relationships/equalizations",
          "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ/equalizations"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "CAN"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDMifQ"
    }
  }, {
    "type" : "appPricePoints",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ",
    "attributes" : {
      "customerPrice" : "5.49",
      "proceeds" : "3.84"
    },
    "relationships" : {
      "equalizations" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ/relationships/equalizations",
          "related" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ/equalizations"
        }
      },
      "territory" : {
        "data" : {
          "type" : "territories",
          "id" : "CAN"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v3/appPricePoints/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDQU4iLCJwIjoiMTAwMDQifQ"
    }
  } ],
  "included" : [ {
    "type" : "territories",
    "id" : "CAN",
    "attributes" : {
      "currency" : "CAD"
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/territories/CAN"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPricePoints?include=territory&filter%5Bterritory%5D=CAN%2CUSA&limit=5",
    "next" : "https://api.appstoreconnect.apple.com/v1/apps/6447402192/appPricePoints?cursor=BQ.AMN1C2M&include=territory&filter%5Bterritory%5D=CAN%2CUSA&limit=5"
  },
  "meta" : {
    "paging" : {
      "total" : 1602,
      "limit" : 5
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)