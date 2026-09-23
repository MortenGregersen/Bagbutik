<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciBuildActions-_id_-testResults",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciBuildActions-{}-testResults"
  },
  "title" : "List all test results for an xcode cloud test action"
}
-->

# List all test results for an xcode cloud test action

List all test results for a specific test action Xcode Cloud performed as part of a build.

## Discussion

The example request below lists the test results for an Xcode Cloud build that performed a test action. Use the information provided in the response to display test results on a dashboard, create a new task for a failing test in your issue tracker, and so on.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciBuildActions/d871dabb-2c2c-4012-aff5-abb427bcb3a3/testResults
```

**Response:**

```json
{
"data": [
        {
            "type": "ciTestResults",
            "id": "87f8a597-bea9-49d8-ba8b-6a643de66903",
            "attributes": {
                "className": "TestClass",
                "name": "TestName",
                "status": "SUCCESS",
                "fileSource": {
                    "path": "path",
                    "lineNumber": 100
                },
                "message": null,
                "destinationTestResults": [
                    {
                        "uuid": "8d1bff05-2b9c-4cc4-9225-e2cd41dee260",
                        "deviceName": "iPhone X",
                        "osVersion": "11.4.1",
                        "status": "SUCCESS",
                        "duration": 6.600471973
                    }
                ]
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciTestResults/87f8a597-bea9-49d8-ba8b-6a643de66903"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/d871dabb-2c2c-4012-aff5-abb427bcb3a3/testResults"
    },
    "meta": {
        "paging": {
            "limit": 50
        }
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)