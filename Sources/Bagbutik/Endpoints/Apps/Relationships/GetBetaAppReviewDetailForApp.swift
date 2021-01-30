public extension Request {
    enum GetBetaAppReviewDetailForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type betaAppReviewDetails
            case betaAppReviewDetails([BetaAppReviewDetails])

            public enum BetaAppReviewDetails: String, ParameterValue, CaseIterable {
                case app
                case contactEmail
                case contactFirstName
                case contactLastName
                case contactPhone
                case demoAccountName
                case demoAccountPassword
                case demoAccountRequired
                case notes
            }
        }
    }

    /**
      # Read the Beta App Review Details Resource of an App
      Get the beta app review details for a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_beta_app_review_details_resource_of_an_app>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaAppReviewDetailForApp(id: String,
                                             fields: [GetBetaAppReviewDetailForApp.Field]? = nil) -> Request<BetaAppReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/betaAppReviewDetail", method: .get, parameters: .init(fields: fields))
    }
}
