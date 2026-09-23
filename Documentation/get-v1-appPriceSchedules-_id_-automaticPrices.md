<!--
{
  "availability" : [
    "App Store Connect API: 2.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-appPriceSchedules-_id_-automaticPrices",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-appPriceSchedules-{}-automaticPrices"
  },
  "title" : "List Automatically Generated Prices for an App"
}
-->

# List Automatically Generated Prices for an App

List the automatically calculated prices for an app generated from a base territory.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices
```

**Response:**

```json
{
  "data" : [ {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBRkciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBRkciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBR08iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBR08iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBSUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBSUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUk0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUk0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVEciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVEciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVQiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVQiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRUwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRUwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCR1IiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCR1IiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSUgiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSUgiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFoiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFoiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUk4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUk4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCVE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCVE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCV0EiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCV0EiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSVYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSVYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDTVIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDTVIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0ciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0ciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUFYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUFYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWU0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWU0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWVAiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWVAiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJERVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJERVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETksiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETksiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJET00iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJET00iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJEWkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJEWkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFQ1UiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFQ1UiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFR1kiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFR1kiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1AiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1AiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  }, {
    "type" : "appPrices",
    "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
    "attributes" : {
      "manual" : false,
      "startDate" : "2023-02-28",
      "endDate" : null
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices",
    "next" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices?cursor=Mg.AKwzESA"
  },
  "meta" : {
    "paging" : {
      "total" : 172,
      "limit" : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)