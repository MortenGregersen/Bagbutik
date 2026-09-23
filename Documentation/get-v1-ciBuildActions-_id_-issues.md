<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciBuildActions-_id_-issues",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciBuildActions-{}-issues"
  },
  "title" : "List all issues for a build action"
}
-->

# List all issues for a build action

List all issues that occurred for a specific action that Xcode Cloud performed as part of a build.

## Discussion

The example request below lists all issues Xcode Cloud encountered when it performed a build. Use the information provided in the response to display issue information on a dashboard, generate reports, automatically create tasks in your issue tracker, and so on.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciBuildActions/2488c5ec-ee0c-425e-902b-41c1e88208ca/issues
```

**Response:**

```json
{
"data": [
        {
            "type": "ciIssues",
            "id": "b5ed3706-96e4-4111-be17-049fb365b72e",
            "attributes": {
                "issueType": "ERROR",
                "message": "An example message.",
                "fileSource": {
                    "path": "/path/to/the/file/that/contains/the/issue",
                    "lineNumber": 42
                },
                "category": null
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciIssues/b5ed3706-96e4-4111-be17-049fb365b72e"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciBuildActions/2488c5ec-ee0c-425e-902b-41c1e88208ca/issues"
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