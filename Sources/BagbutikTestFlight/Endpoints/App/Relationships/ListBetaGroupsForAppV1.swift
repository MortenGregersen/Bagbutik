import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # List all beta groups for an app

     Get a list of beta groups associated with a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6446998023/betaGroups
     ```

     **Response:**

     ```json
     {
         “data”: [
             {
                 “type”: “betaGroups”,
                 “id”: “26b3c3c4-aeb1-4d24-be6a-80c554f671a2”,
                 “attributes”: {
                     “name”: “Internal Test Group”,
                     “createdDate”: “2022-09-07T18:25:13.582Z”,
                     “isInternalGroup”: true,
                     “hasAccessToAllBuilds”: true,
                     “publicLinkEnabled”: null,
                     “publicLinkId”: null,
                     “publicLinkLimitEnabled”: null,
                     “publicLinkLimit”: null,
                     “publicLink”: null,
                     “feedbackEnabled”: true,
                     “iosBuildsAvailableForAppleSiliconMac”: true
                 },
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-betaGroups>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaGroupsForAppV1(id: String,
                                       fields: [ListBetaGroupsForAppV1.Field]? = nil,
                                       limit: Int? = nil) -> Request<BetaGroupsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/betaGroups",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBetaGroupsForAppV1 {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaGroups(rawValue: string) {
                    self = value
                } else if let value = BetaGroups(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaGroups value: \(string)"
                    )
                }
            }
        }
    }
}
