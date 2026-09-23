import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Start a build

     Start a new Xcode Cloud build for a workflow.

     ## Discussion

     The example request below starts a new build for a specific workflow. Use the information provided in the response to display build information on a dashboard or to access additional information; for example, the actions Xcode Cloud performs during the build.

     ### Example Request and Response

     **Request:**

     ```
     {
         “data”: {
             “type”: “ciBuildRuns”,
             “attributes”: {},
             “relationships”: {
                 “workflow”: {
                     “data”: {
                         “type”: “ciWorkflows”,
                         “id”: “a3946af0-cc38-4e0b-acba-5575c8dad050”
                     }
                 }
             }
         }
     }
     ```

     **Response:**

     ```json
     {
         "data": {
             "type": "ciBuildRuns",
             "id": "574f26a1-193c-409e-98ab-33ed4105a2ff",
             "attributes": {
                 "number": 1,
                 "createdDate": "2021-08-17T19:04:31.876Z",
                 "startedDate": null,
                 "finishedDate": null,
                 "sourceCommit": {
                     "commitSha": "The commit hash of the source commit.",
                     "message": "A commit message.",
                     "author": {
                         "displayName": "An author",
                         "avatarUrl": "https://example.com/user/avatar/author.png"
                     },
                     "committer": {
                         "displayName": "A committer",
                         "avatarUrl": "https://example.com/user/avatar/author.png"
                     },
                     "webUrl": "https://example.cpm/commits/abc123"
                 },
                 "destinationCommit": null,
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
                         "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/574f26a1-193c-409e-98ab-33ed4105a2ff/relationships/builds",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/574f26a1-193c-409e-98ab-33ed4105a2ff/builds"
                     }
                 },
                 "actions": {
                     "links": {
                         "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/574f26a1-193c-409e-98ab-33ed4105a2ff/relationships/actions",
                         "related": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/574f26a1-193c-409e-98ab-33ed4105a2ff/actions"
                     }
                 }
             },
             "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns/574f26a1-193c-409e-98ab-33ed4105a2ff"
             }
         },
         "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/ciBuildRuns"
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-ciBuildRuns>

     - Parameter requestBody: CiBuildRun representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func startCiBuildRunV1(requestBody: CiBuildRunCreateRequest) -> Request<CiBuildRunResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildRuns",
            method: .post,
            requestBody: requestBody)
    }
}
