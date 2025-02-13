import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read recruitment criteria for a beta group
     Get the recruitment criteria information for a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-betaRecruitmentCriteria>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaRecruitmentCriteriaForBetaGroupV1(id: String,
                                                         fields: [GetBetaRecruitmentCriteriaForBetaGroupV1.Field]? = nil) -> Request<BetaRecruitmentCriterionResponse, ErrorResponse>
    {
        .init(path: "/v1/betaGroups/\(id)/betaRecruitmentCriteria", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetBetaRecruitmentCriteriaForBetaGroupV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaRecruitmentCriteria
        case betaRecruitmentCriteria([BetaRecruitmentCriteria])

        public enum BetaRecruitmentCriteria: String, Sendable, ParameterValue, Codable, CaseIterable {
            case deviceFamilyOsVersionFilters
            case lastModifiedDate
        }
    }
}
