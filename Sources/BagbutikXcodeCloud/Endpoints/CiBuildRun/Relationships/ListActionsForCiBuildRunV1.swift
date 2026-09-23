import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
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

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildRuns-_id_-actions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listActionsForCiBuildRunV1(id: String,
                                           fields: [ListActionsForCiBuildRunV1.Field]? = nil,
                                           includes: [ListActionsForCiBuildRunV1.Include]? = nil,
                                           limit: Int? = nil) -> Request<CiBuildActionsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildRuns/\(id)/actions",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListActionsForCiBuildRunV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciBuildActions
        case ciBuildActions([CiBuildActions])
        /// The fields to include for returned resources of type ciBuildRuns
        case ciBuildRuns([CiBuildRuns])

        public enum CiBuildActions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case actionType
            case artifacts
            case buildRun
            case completionStatus
            case executionProgress
            case finishedDate
            case isRequiredToPass
            case issueCounts
            case issues
            case name
            case startedDate
            case testResults

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiBuildActions(rawValue: string) {
                    self = value
                } else if let value = CiBuildActions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiBuildActions value: \(string)"
                    )
                }
            }
        }

        public enum CiBuildRuns: String, Sendable, ParameterValue, Codable, CaseIterable {
            case actions
            case builds
            case cancelReason
            case completionStatus
            case createdDate
            case destinationBranch
            case destinationCommit
            case executionProgress
            case finishedDate
            case isPullRequestBuild
            case issueCounts
            case number
            case product
            case pullRequest
            case sourceBranchOrTag
            case sourceCommit
            case startReason
            case startedDate
            case workflow

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = CiBuildRuns(rawValue: string) {
                    self = value
                } else if let value = CiBuildRuns(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid CiBuildRuns value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case buildRun
    }
}
