public extension Request {
    /**
      # Read the Xcode Cloud Product for an App
      Get the Xcode Cloud product information for an app you build with Xcode Cloud.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_xcode_cloud_product_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related primaryRepositories returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiProductForApp(id: String,
                                   fields: [GetCiProductForApp.Field]? = nil,
                                   includes: [GetCiProductForApp.Include]? = nil,
                                   limit: Int? = nil) -> Request<CiProductResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/ciProduct", method: .get, parameters: .init(fields: fields,
                                                                                       includes: includes,
                                                                                       limit: limit))
    }
}

public enum GetCiProductForApp {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

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
        case app, bundleId, primaryRepositories
    }
}
