import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read review submission information
     Read information about a specific review submisison.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-reviewSubmissions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related items returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getReviewSubmissionV1(id: String,
                                      fields: [GetReviewSubmissionV1.Field]? = nil,
                                      includes: [GetReviewSubmissionV1.Include]? = nil,
                                      limit: GetReviewSubmissionV1.Limit? = nil) -> Request<ReviewSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetReviewSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type reviewSubmissionItems
        case reviewSubmissionItems([ReviewSubmissionItems])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])

        public enum ReviewSubmissionItems: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appEvent
            case appStoreVersion
            case appStoreVersionExperiment
            case appStoreVersionExperimentV2
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReviewSubmissionItems(rawValue: string) {
                    self = value
                } else if let value = ReviewSubmissionItems(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReviewSubmissionItems value: \(string)"
                    )
                }
            }
        }

        public enum ReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submittedByActor
            case submittedDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReviewSubmissions(rawValue: string) {
                    self = value
                } else if let value = ReviewSubmissions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReviewSubmissions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appStoreVersionForReview
        case items
        case lastUpdatedByActor
        case submittedByActor
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related items returned (when they are included) - maximum 50
        case items(Int)
    }
}
