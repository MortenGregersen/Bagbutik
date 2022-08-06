import Bagbutik_Models

public extension Request {
    /**
     # List All Workflows for an Xcode Cloud Product
     List all workflows for a specific Xcode Cloud product.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_workflows_for_an_xcode_cloud_product>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listWorkflowsForCiProductV1(id: String,
                                            fields: [ListWorkflowsForCiProductV1.Field]? = nil,
                                            includes: [ListWorkflowsForCiProductV1.Include]? = nil,
                                            limit: Int? = nil) -> Request<CiWorkflowsResponse, ErrorResponse>
    {
        .init(path: "/v1/ciProducts/\(id)/workflows", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes,
                                                                                      limit: limit))
    }
}

public enum ListWorkflowsForCiProductV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciMacOsVersions
        case ciMacOsVersions([CiMacOsVersions])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type ciWorkflows
        case ciWorkflows([CiWorkflows])
        /// The fields to include for returned resources of type ciXcodeVersions
        case ciXcodeVersions([CiXcodeVersions])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum CiMacOsVersions: String, ParameterValue, CaseIterable {
            case name
            case version
            case xcodeVersions
        }

        public enum CiProducts: String, ParameterValue, CaseIterable {
            case additionalRepositories
            case app
            case buildRuns
            case bundleId
            case createdDate
            case name
            case primaryRepositories
            case productType
            case workflows
        }

        public enum CiWorkflows: String, ParameterValue, CaseIterable {
            case actions
            case branchStartCondition
            case buildRuns
            case clean
            case containerFilePath
            case description
            case isEnabled
            case isLockedForEditing
            case lastModifiedDate
            case macOsVersion
            case name
            case product
            case pullRequestStartCondition
            case repository
            case scheduledStartCondition
            case tagStartCondition
            case xcodeVersion
        }

        public enum CiXcodeVersions: String, ParameterValue, CaseIterable {
            case macOsVersions
            case name
            case testDestinations
            case version
        }

        public enum ScmRepositories: String, ParameterValue, CaseIterable {
            case defaultBranch
            case gitReferences
            case httpCloneUrl
            case lastAccessedDate
            case ownerName
            case pullRequests
            case repositoryName
            case scmProvider
            case sshCloneUrl
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case macOsVersion
        case product
        case repository
        case xcodeVersion
    }
}
