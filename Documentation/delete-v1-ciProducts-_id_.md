<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/DELETE-v1-ciProducts-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:delete:v1-ciProducts-{}"
  },
  "title" : "Delete a product"
}
-->

# Delete a product

Delete an Xcode Cloud product and all of its associated workflows, builds, and artifacts.

## Discussion

To delete an Xcode Cloud product, call this endpoint using the HTTP `DELETE` method like this:

```swift
https://api.appstoreconnect.apple.com/v1/ciProducts/9ad354b0-f380-40d3-b94f-dd5225b8b3d5
```

App Store Connect confirms the deletion by responding with the `HTTP/1.1 204 No Content` HTTP status code.

> Important:
> Deleting an Xcode Cloud product permanently deletes all workflows, including their build history and artifacts. Only delete an Xcode Cloud product when you’re confident that you don’t need its workflows, build history, or artifacts anymore. Instead of deleting a product, deactivate its workflows to preserve the product and its build history and artifacts. For more information about deactivating a workflow, see <doc://com.apple.documentation/documentation/Xcode/Developing-a-Workflow-Strategy-for-Xcode-Cloud>.

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)