public extension Request {
    /**
      # Read Git Reference Information
      Get information about a specific Git reference.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_git_reference_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getScmGitReference(id: String,
                                   fields: [GetScmGitReference.Field]? = nil,
                                   includes: [GetScmGitReference.Include]? = nil) -> Request<ScmGitReferenceResponse, ErrorResponse>
    {
        return .init(path: "/v1/scmGitReferences/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes))
    }
}

public enum GetScmGitReference {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmGitReferences
        case scmGitReferences([ScmGitReferences])

        public enum ScmGitReferences: String, ParameterValue, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case repository
    }
}
