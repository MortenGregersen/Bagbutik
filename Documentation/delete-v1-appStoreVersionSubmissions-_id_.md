<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 - 1.7.0"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/DELETE-v1-appStoreVersionSubmissions-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:delete:v1-appStoreVersionSubmissions-{}"
  },
  "title" : "Delete an app store version submission"
}
-->

# Delete an app store version submission

Remove a version from App Store review.

## Discussion

Use this endpoint to remove a version from App Review. This request fails with an appropriate error if the app can’t be removed from review. For more information, see [Remove a submission from review](https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/remove-a-submission-from-review).

### Remove a Version from App Review

**Request:**

```
DELETE https://api.appstoreconnect.apple.com/v1/appStoreVersionSubmissions/942c7a69-b184-478a-898f-a51b8be1044d
```

**Response:**

```json
HTTP/1.1 204 NO CONTENT
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)