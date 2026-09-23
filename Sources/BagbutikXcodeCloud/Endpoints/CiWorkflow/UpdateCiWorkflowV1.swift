import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Update an xcode cloud workflow

     Make changes to an Xcode Cloud workflow.

     ## Discussion

     The example request below updates the name of an existing Xcode Cloud workflow. For a successful update, the response includes detailed information about the workflow. Use it to access additional information, start a new build, and so on.

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f

     {
         "data": {
             "type": "ciWorkflows",
             "id": "3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f",
             "attributes": {
                 "name": "A new name for an existing workflow."
             }
         }
     }
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "ciWorkflows",
             "id": "3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f",
             "attributes": {
                 "name": "A new name for an existing workflow.",
                 "description": "",
                 "branchStartCondition": {
                     "source": {
                         "isAllMatch": false,
                         "patterns": [
                             {
                                 "pattern": "main",
                                 "isPrefix": false
                             }
                         ]
                     },
                     "filesAndFoldersRule": {
                         "mode": "START_IF_ANY_FILE_MATCHES",
                         "matchers": []
                     },
                     "autoCancel": true
                 },
                 "tagStartCondition": null,
                 "pullRequestStartCondition": null,
                 "scheduledStartCondition": null,
                 "actions": [
                     {
                         "name": "Archive iOS",
                         "actionType": "ARCHIVE",
                         "destination": null,
                         "buildDistributionAudience": null,
                         "testConfiguration": null,
                         "scheme": "MyApp",
                         "platform": "IOS",
                         "isRequiredToPass": true
                     }
                 ],
                 "isEnabled": true,
                 "isLockedForEditing": false,
                 "clean": false,
                 "containerFilePath": "MyXcodeProject.xcodeproj",
                 "lastModifiedDate": null
             },
             "relationships": {
                 "repository": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f/relationships/repository",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f/repository"
                     }
                 },
                 "buildRuns": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f/relationships/buildRuns",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f/buildRuns"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/3fa0575f-4de0-44cb-bf0f-9aa2651c2f1f"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-ciWorkflows-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: CiWorkflow representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateCiWorkflowV1(id: String,
                                   requestBody: CiWorkflowUpdateRequest) -> Request<CiWorkflowResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
