import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read build compatibilty for a beta group
     Get the build compatibilty information for a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-betaRecruitmentCriterionCompatibleBuildCheck>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaRecruitmentCriterionCompatibleBuildCheckForBetaGroupV1(id: String,
                                                                              fields: [GetBetaRecruitmentCriterionCompatibleBuildCheckForBetaGroupV1.Field]? = nil) -> Request<BetaRecruitmentCriterionCompatibleBuildCheckResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/betaRecruitmentCriterionCompatibleBuildCheck",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBetaRecruitmentCriterionCompatibleBuildCheckForBetaGroupV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaRecruitmentCriterionCompatibleBuildChecks
        case betaRecruitmentCriterionCompatibleBuildChecks([BetaRecruitmentCriterionCompatibleBuildChecks])

        public enum BetaRecruitmentCriterionCompatibleBuildChecks: String, Sendable, ParameterValue, Codable, CaseIterable {
            case hasCompatibleBuild

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaRecruitmentCriterionCompatibleBuildChecks(rawValue: string) {
                    self = value
                } else if let value = BetaRecruitmentCriterionCompatibleBuildChecks(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaRecruitmentCriterionCompatibleBuildChecks value: \(string)"
                    )
                }
            }
        }
    }
}
