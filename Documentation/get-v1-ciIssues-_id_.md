<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciIssues-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciIssues-{}"
  },
  "title" : "Read xcode cloud issue information"
}
-->

# Read xcode cloud issue information

Get information about a specific issue that occurred when Xcode Cloud performed a build.

## Discussion

The example request below retrieves information about a specific issue Xcode Cloud encountered when it performed a build. Use the information provided to display issues on a dashboard, create reports, and so on.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciIssues/61473b34-2ecd-498d-9e2b-94216b7e8fb4
```

**Response:**

```json
{
    "data": {
        "type": "ciIssues",
        "id": "61473b34-2ecd-498d-9e2b-94216b7e8fb4",
        "attributes": {
            "issueType": "ERROR",
            "message": "A message describing the issue.",
            "fileSource": {
                "path": "/the/path/to/the/file/with/the/issue",
                "lineNumber": 42
            },
            "category": null
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciIssues/61473b34-2ecd-498d-9e2b-94216b7e8fb4"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciIssues/61473b34-2ecd-498d-9e2b-94216b7e8fb4"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)