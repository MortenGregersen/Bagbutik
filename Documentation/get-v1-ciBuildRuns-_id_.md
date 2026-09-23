<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciBuildRuns-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciBuildRuns-{}"
  },
  "title" : "Read xcode cloud build information"
}
-->

# Read xcode cloud build information

Get information about a specific Xcode Cloud build.

## Discussion

The example request below retrieves detailed information for a specific build. Use the data provided in the response to display detailed build information on a dashboard or to access related information for each action Xcode Cloud performed.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7
```

**Response:**

```json
{
    "data": {
        "type": "ciBuildRuns",
        "id": "56c512e6-111e-4067-8e88-640c28ce91a7",
        "attributes": {
            "number": 1,
            "createdDate": "2021-08-17T17:48:11.806Z",
            "startedDate": null,
            "finishedDate": null,
            "sourceCommit": {
                "commitSha": "SHA",
                "message": "Summary Message.\n\nSome more details about the commit.",
                "author": {
                    "displayName": "Source Author",
                    "avatarUrl": ""
                },
                "committer": {
                    "displayName": "Source Committer",
                    "avatarUrl": ""
                },
                "webUrl": "https://example.com/commit/abc123"
            },
            "destinationCommit": {
                "commitSha": "A commit hash.",
                "message": "BASE MESSAGE",
                "author": {
                    "displayName": "Base Author",
                    "avatarUrl": "https://example.com/user/avatar/author.png"
                },
                "committer": {
                    "displayName": "Base Committer",
                    "avatarUrl": "https://example.com/user/avatar/author.png"
                },
                "webUrl": "https://example.com/commit/xyz987"
            },
            "isPullRequestBuild": false,
            "issueCounts": null,
            "executionProgress": "PENDING",
            "completionStatus": null,
            "startReason": "MANUAL",
            "cancelReason": null
        },
        "relationships": {
            "builds": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7/relationships/builds",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7/builds"
                }
            },
            "actions": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7/relationships/actions",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7/actions"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/56c512e6-111e-4067-8e88-640c28ce91a7"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)