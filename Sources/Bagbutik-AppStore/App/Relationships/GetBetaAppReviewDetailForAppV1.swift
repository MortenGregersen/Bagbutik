import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Beta App Review Details Resource of an App
     Get the beta app review details for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-betaAppReviewDetail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewDetailForAppV1(id: String,
                                               fields: [GetBetaAppReviewDetailForAppV1.Field]? = nil) -> Request<BetaAppReviewDetailWithoutIncludesResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/betaAppReviewDetail", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBetaAppReviewDetailForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaAppReviewDetails
        case betaAppReviewDetails([BetaAppReviewDetails])

        public enum BetaAppReviewDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
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
