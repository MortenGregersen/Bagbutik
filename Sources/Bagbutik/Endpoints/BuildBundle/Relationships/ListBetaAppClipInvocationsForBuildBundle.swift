public extension Request {
    /**
      # List All Beta App Clip Invocations for a Build Bundle
      Get all App Clip invocations you configure for testing for a specific build bundle.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_beta_app_clip_invocations_for_a_build_bundle>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaAppClipInvocationsForBuildBundle(id: String,
                                                         fields: [ListBetaAppClipInvocationsForBuildBundle.Field]? = nil,
                                                         includes: [ListBetaAppClipInvocationsForBuildBundle.Include]? = nil,
                                                         limits: [ListBetaAppClipInvocationsForBuildBundle.Limit]? = nil) -> Request<BetaAppClipInvocationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBundles/\(id)/betaAppClipInvocations", method: .get, parameters: .init(fields: fields,
                                                                                                            includes: includes,
                                                                                                            limits: limits))
    }
}

public enum ListBetaAppClipInvocationsForBuildBundle {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppClipInvocationLocalizations
        case betaAppClipInvocationLocalizations([BetaAppClipInvocationLocalizations])
        /// The fields to include for returned resources of type betaAppClipInvocations
        case betaAppClipInvocations([BetaAppClipInvocations])

        public enum BetaAppClipInvocationLocalizations: String, ParameterValue, CaseIterable {
            case betaAppClipInvocation
            case locale
            case title
        }

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

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related betaAppClipInvocationLocalizations returned (when they are included) - maximum 50
        case betaAppClipInvocationLocalizations(Int)
    }
}
