<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciBuildActions-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciBuildActions-{}"
  },
  "title" : "Read build action information"
}
-->

# Read build action information

Get information about a specific action Xcode Cloud performed as part of a build.

## Discussion

The example request below retrieves detailed information about an action Xcode Cloud performed. It also requests detailed information about the action’s build by including the [Build Runs](/documentation/AppStoreConnectAPI/build-runs) resource in the query. Use the information provided in the response to display information on a dashboard or to access additional information; for example, information about other actions Xcode Cloud performed during the build.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d?include=buildRun
```

**Response:**

```json
{
    "data": {
        "type": "ciBuildActions",
        "id": "6034552c-6cc0-4ac3-ad18-c3d24970882d",
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
                "data": {
                    "type": "ciBuildRuns",
                    "id": "a2c112a3-1ed1-416d-baf8-a9f46909a16a"
                },
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/relationships/buildRun",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/buildRun"
                }
            },
            "artifacts": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/relationships/artifacts",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/artifacts"
                }
            },
            "issues": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/relationships/issues",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/issues"
                }
            },
            "testResults": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/relationships/testResults",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d/testResults"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d"
        }
    },
    "included": [
        {
            "type": "ciBuildRuns",
            "id": "a2c112a3-1ed1-416d-baf8-a9f46909a16a",
            "attributes": {
                "number": 1,
                "createdDate": "2021-08-17T17:33:22.59Z",
                "startedDate": null,
                "finishedDate": null,
                "sourceCommit": {
                    "commitSha": "SHA",
                    "message": "Summary Message\n\nSome more details about the commit message.",
                    "author": {
                        "displayName": "Source Author",
                        "avatarUrl": "https://example.com/user/avatar/author.png"
                    },
                    "committer": {
                        "displayName": "Source Committer",
                        "avatarUrl": "https://example.com/user/avatar/author.png"
                    },
                    "webUrl": "https://example.com/commit/abc123"
                },
                "destinationCommit": {
                    "commitSha": "PR_BASE_COMMIT_SHA",
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
                "buildRun": {},
                "builds": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/a2c112a3-1ed1-416d-baf8-a9f46909a16a/relationships/builds",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/a2c112a3-1ed1-416d-baf8-a9f46909a16a/builds"
                    }
                },
                "actions": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/a2c112a3-1ed1-416d-baf8-a9f46909a16a/relationships/actions",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/a2c112a3-1ed1-416d-baf8-a9f46909a16a/actions"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/a2c112a3-1ed1-416d-baf8-a9f46909a16a"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/6034552c-6cc0-4ac3-ad18-c3d24970882d?include=buildRun"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)