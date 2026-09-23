<!--
{
  "availability" : [
    "App Store Connect API: 2.4.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v2-appStoreVersionExperiments-_id_-appStoreVersionExperimentTreatments",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v2-appStoreVersionExperiments-{}-appStoreVersionExperimentTreatments"
  },
  "title" : "List all treatments for an app store experiment"
}
-->

# List all treatments for an app store experiment

Get a list of all treatments for a specific App Store version experiment.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19/appStoreVersionExperimentTreatments
```

**Response:**

```json
{
  “data” : [ {
    “type” : “appStoreVersionExperimentTreatments”,
    “id” : “0af1be11-a7d9-4e94-aef5-f8ea12bc3be7”,
    “attributes” : {
      “name” : “Treatment Bravo”,
      “appIcon” : null,
      “appIconName” : null,
      “promotedDate” : null
    },
    “relationships” : {
      “appStoreVersionExperimentTreatmentLocalizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/appStoreVersionExperimentTreatments/0af1be11-a7d9-4e94-aef5-f8ea12bc3be7/relationships/appStoreVersionExperimentTreatmentLocalizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/appStoreVersionExperimentTreatments/0af1be11-a7d9-4e94-aef5-f8ea12bc3be7/appStoreVersionExperimentTreatmentLocalizations”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/appStoreVersionExperimentTreatments/0af1be11-a7d9-4e94-aef5-f8ea12bc3be7”
    }
  }, {
    “type” : “appStoreVersionExperimentTreatments”,
    “id” : “a84d0df3-4c16-4073-adbd-90b94c742c68”,
    “attributes” : {
      “name” : “Treatment Alpha”,
      “appIcon” : null,
      “appIconName” : null,
      “promotedDate” : null
    },
    “relationships” : {
      “appStoreVersionExperimentTreatmentLocalizations” : {
        “links” : {
          “self” : “https://api.appstoreconnect.apple.com/v1/appStoreVersionExperimentTreatments/a84d0df3-4c16-4073-adbd-90b94c742c68/relationships/appStoreVersionExperimentTreatmentLocalizations”,
          “related” : “https://api.appstoreconnect.apple.com/v1/appStoreVersionExperimentTreatments/a84d0df3-4c16-4073-adbd-90b94c742c68/appStoreVersionExperimentTreatmentLocalizations”
        }
      }
    },
    “links” : {
      “self” : “https://api.appstoreconnect.apple.com/v1/appStoreVersionExperimentTreatments/a84d0df3-4c16-4073-adbd-90b94c742c68”
    }
  } ],
  “links” : {
    “self” : “https://api.appstoreconnect.apple.com/v2/appStoreVersionExperiments/1a22d9a7-f574-4669-b1ca-1ba88f786c19/appStoreVersionExperimentTreatments”
  },
  “meta” : {
    “paging” : {
      “total” : 2,
      “limit” : 50
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)