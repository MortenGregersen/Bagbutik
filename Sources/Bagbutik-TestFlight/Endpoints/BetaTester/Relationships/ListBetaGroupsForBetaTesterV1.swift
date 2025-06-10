import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Beta Groups to Which a Beta Tester Belongs
     Get a list of beta groups that contain a specific beta tester.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaTesters-_id_-betaGroups>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaGroupsForBetaTesterV1(id: String,
                                              fields: [ListBetaGroupsForBetaTesterV1.Field]? = nil,
                                              limit: Int? = nil) -> Request<BetaGroupsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesters/\(id)/betaGroups",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBetaGroupsForBetaTesterV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaGroups
        case betaGroups([BetaGroups])

        public enum BetaGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case betaRecruitmentCriteria
            case betaRecruitmentCriterionCompatibleBuildCheck
            case betaTesters
            case builds
            case createdDate
            case feedbackEnabled
            case hasAccessToAllBuilds
            case iosBuildsAvailableForAppleSiliconMac
            case iosBuildsAvailableForAppleVision
            case isInternalGroup
            case name
            case publicLink
            case publicLinkEnabled
            case publicLinkId
            case publicLinkLimit
            case publicLinkLimitEnabled
        }
    }
}
