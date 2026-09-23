<!--
{
  "availability" : [
    "App Store Connect API: 2.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/PATCH-v2-appStoreVersionExperiments-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:patch:v2-appStoreVersionExperiments-{}"
  },
  "title" : "Modify an app store experiment"
}
-->

# Modify an app store experiment

Update the name, the started state, and the proportion of traffic to send to an App Store experiment.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19 -d
'{
  "data": {
    "id": "1a22d9a7-f574-4669-b1ca-1ba88f786c19",
    "type": "appStoreVersionExperiments",
    "attributes": {
      "name": "PPO Test 1",
      "trafficProportion": 50
    }
  }
}'
```

**Response:**

```json
{
  "data" : {
    "type" : "appStoreVersionExperiments",
    "id" : "1a22d9a7-f574-4669-b1ca-1ba88f786c19",
    "attributes" : {
      "name" : "PPO Test 1",
      "platform" : "IOS",
      "trafficProportion" : 50,
      "state" : "PREPARE_FOR_SUBMISSION",
      "reviewRequired" : true,
      "startDate" : null,
      "endDate" : null
    },
    "relationships" : {
      "appStoreVersionExperimentTreatments" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19/relationships/appStoreVersionExperimentTreatments",
          "related" : "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19/appStoreVersionExperimentTreatments"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19"
    }
  },
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)