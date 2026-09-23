<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciTestResults-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciTestResults-{}"
  },
  "title" : "Read test result information"
}
-->

# Read test result information

Get a specific test result Xcode Cloud created when it performed a build with a test action.

## Discussion

The example request below retrieves result information for a test Xcode Cloud performed. Use the data provided in the response to display test result information on a dashboard, create reports, or create a new issue in your issue tracker for a failing test.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciTestResults/5ecb25ea-ce31-4b50-b88c-f1bf64c698ae
```

**Response:**

```json
{
    "data": {
        "type": "ciTestResults",
        "id": "5ecb25ea-ce31-4b50-b88c-f1bf64c698ae",
        "attributes": {
            "className": "TestClass",
            "name": "TestName",
            "status": "SUCCESS",
            "fileSource": null,
            "message": null,
            "destinationTestResults": [
                {
                    "uuid": "e456c6a3-37a3-42c7-8299-33dad720f6b7",
                    "deviceName": "iPhone X",
                    "osVersion": "11.4.1",
                    "status": "SUCCESS",
                    "duration": 6.600471973
                }
            ]
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciTestResults/5ecb25ea-ce31-4b50-b88c-f1bf64c698ae"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciTestResults/5ecb25ea-ce31-4b50-b88c-f1bf64c698ae"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)