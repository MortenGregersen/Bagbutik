public extension Request {
    /**
      # Read Beta App Clip Invocation Information
      Get a specific App Clip invocation you configure for testing.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_app_clip_invocation_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related betaAppClipInvocationLocalizations returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaAppClipInvocationV1(id: String,
                                           fields: [GetBetaAppClipInvocationV1.Field]? = nil,
                                           includes: [GetBetaAppClipInvocationV1.Include]? = nil,
                                           limit: Int? = nil) -> Request<BetaAppClipInvocationResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppClipInvocations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                               includes: includes,
                                                                                               limit: limit))
    }
}

public enum GetBetaAppClipInvocationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppClipInvocations
        case betaAppClipInvocations([BetaAppClipInvocations])

        public enum BetaAppClipInvocations: String, ParameterValue, CaseIterable {
            case betaAppClipInvocationLocalizations
            case buildBundle
            case url
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case betaAppClipInvocationLocalizations
    }
}
