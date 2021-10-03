public extension Request {
    /**
      # List All Workflows for an Xcode Cloud Product
      List all workflows for a specific Xcode Cloud product.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_workflows_for_an_xcode_cloud_product>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listWorkflowsForCiProduct(id: String,
                                          fields: [ListWorkflowsForCiProduct.Field]? = nil,
                                          limit: Int? = nil) -> Request<CiWorkflowsResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciProducts/\(id)/workflows", method: .get, parameters: .init(fields: fields,
                                                                                             limit: limit))
    }
}

public enum ListWorkflowsForCiProduct {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciWorkflows
        case ciWorkflows([CiWorkflows])

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
    }
}
