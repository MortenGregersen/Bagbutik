public extension Request {
    /**
      # Get a Source Code Management Provider
      Get information about a specific source code management provider you connected to Xcode Cloud.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_a_source_code_management_provider>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getScmProviderV1(id: String,
                                 fields: [GetScmProviderV1.Field]? = nil) -> Request<ScmProviderResponse, ErrorResponse>
    {
        return .init(path: "/v1/scmProviders/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetScmProviderV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmProviders
        case scmProviders([ScmProviders])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

        public enum ScmProviders: String, ParameterValue, CaseIterable {
            case repositories
            case scmProviderType
            case url
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
}
