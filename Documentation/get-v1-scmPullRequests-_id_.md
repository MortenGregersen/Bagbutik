<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-scmPullRequests-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-scmPullRequests-{}"
  },
  "title" : "Read pull request information"
}
-->

# Read pull request information

Get information about a specific pull request.

## Discussion

The example request below retrieves information about a specific pull request. For example, use the data provided in the response to display pull request information on a custom dashboard.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/scmPullRequests/3372ba3b-013d-4328-9b48-0ef8ec54f48d
```

**Response:**

```json
{
    "data": {
        "type": "scmPullRequests",
        "id": "3372ba3b-013d-4328-9b48-0ef8ec54f48d",
        "attributes": {
            "title": "A sample pull request",
            "number": 123,
            "webUrl": "https://github.com/example-user/example-app/pull/123",
            "sourceRepositoryOwner": "example-user",
            "sourceRepositoryName": "example-app",
            "sourceBranchName": "BRANCH",
            "destinationRepositoryOwner": "example-user",
            "destinationRepositoryName": "example-app",
            "destinationBranchName": "main",
            "isClosed": false,
            "isCrossRepository": false
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/scmPullRequests/3372ba3b-013d-4328-9b48-0ef8ec54f48d"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/scmPullRequests/3372ba3b-013d-4328-9b48-0ef8ec54f48d"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)