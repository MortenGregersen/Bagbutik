<!--
{
  "availability" : [
    "App Store Connect API: 2.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v2-appStoreVersionExperiments",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v2-appStoreVersionExperiments"
  },
  "title" : "Create an app store experiment"
}
-->

# Create an app store experiment

Add a new experiment to an App Store version.

## Discussion

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments -d
‘{
  “data”: {
    “type”: “appStoreVersionExperiments”,
    “attributes”: {
      “platform”: “IOS”,
      “name”: “PPO Test 1”,
      “trafficProportion”: 66
    },
    “relationships”: {
      “app”: {
        “data”: {
          “type”: “apps”,
          “id”: “1452013590”
        }
      }
    }
  }
}’
```

**Response:**

```json
{
  "data": {
    "type": "appStoreVersionExperiments",
    "id": "1a22d9a7-f574-4669-b1ca-1ba88f786c19",
    "attributes": {
      "name": "PPO Test 1",
      "platform": "IOS",
      "trafficProportion": 66,
      "state": "PREPARE_FOR_SUBMISSION",
      "reviewRequired": false,
      "startDate": null,
      "endDate": null
    },
    "relationships": {
      "appStoreVersionExperimentTreatments": {
        "links": {
          "self": "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19/relationships/appStoreVersionExperimentTreatments",
          "related": "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19/appStoreVersionExperimentTreatments"
        }
      }
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments"
  }
}
```

### Example Request and Response

**Request:**

```
POST https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments -d
'{
  "data": {
    "type": "appStoreVersionExperiments",
    "attributes": {
      "platform": "IOS",
      "name": "PPO Test 1",
      "trafficProportion": 66
    },
    "relationships": {
      "app": {
        "data": {
          "type": "apps",
          "id": "1452013590"
        }
      }
    }
  }
}'
```

**Response:**

```json
{
  "errors" : [ {
    "id" : "b47f2d6f-681f-479c-b2ff-42fd020cc9ad",
    "status" : "409",
    "code" : "STATE_ERROR",
    "title" : "The request cannot be fulfilled because of the state of another resource.",
    "detail" : "Cannot create new experiment because another experiment is in draft state"
  } ]
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)