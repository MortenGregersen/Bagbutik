import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read recruitment criteria options
     Get a list of the possible beta recruitment criteria options.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaRecruitmentCriterionOptions>

     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaRecruitmentCriterionOptionsV1(fields: [ListBetaRecruitmentCriterionOptionsV1.Field]? = nil,
                                                      limit: Int? = nil) -> Request<BetaRecruitmentCriterionOptionsResponse, ErrorResponse>
    {
        .init(path: "/v1/betaRecruitmentCriterionOptions", method: .get, parameters: .init(fields: fields,
                                                                                           limit: limit))
    }
}

public enum ListBetaRecruitmentCriterionOptionsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaRecruitmentCriterionOptions
        case betaRecruitmentCriterionOptions([BetaRecruitmentCriterionOptions])

        public enum BetaRecruitmentCriterionOptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case deviceFamilyOsVersions
        }
    }
}
