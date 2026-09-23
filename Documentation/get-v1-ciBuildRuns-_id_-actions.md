<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciBuildRuns-_id_-actions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciBuildRuns-{}-actions"
  },
  "title" : "List all actions for an xcode cloud build"
}
-->

# List all actions for an xcode cloud build

List all actions Xcode Cloud performed during a specific build.

## Discussion

The example request below lists actions Xcode Cloud performed during a specific build. Use the information provided in the response to display detailed action information on a dashboard or to read additional data; for example, test results.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciBuildRuns/074e6e3e-8343-49dd-87a3-c4274ba0faab/actions
```

**Response:**

```json
{
    "data": [
        {
            "type": "ciBuildActions",
            "id": "457284a8-7168-4c41-982a-75d764dea585",
            "attributes": {
                "name": "archive",
                "actionType": "ARCHIVE",
                "startedDate": null,
                "finishedDate": null,
                "issueCounts": null,
                "executionProgress": "PENDING",
                "completionStatus": null,
                "isRequiredToPass": true
            },
            "relationships": {
                "buildRun": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/relationships/buildRun",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/buildRun"
                    }
                },
                "artifacts": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/relationships/artifacts",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/artifacts"
                    }
                },
                "issues": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/relationships/issues",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/issues"
                    }
                },
                "testResults": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/relationships/testResults",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585/testResults"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/457284a8-7168-4c41-982a-75d764dea585"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/074e6e3e-8343-49dd-87a3-c4274ba0faab/actions"
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