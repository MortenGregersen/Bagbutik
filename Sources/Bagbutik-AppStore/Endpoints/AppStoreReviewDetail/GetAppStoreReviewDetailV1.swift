import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Store Review Detail Information
     Get App Review details you provided, including contact information, demo account, and notes.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreReviewDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appStoreReviewAttachments returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewDetailV1(id: String,
                                          fields: [GetAppStoreReviewDetailV1.Field]? = nil,
                                          includes: [GetAppStoreReviewDetailV1.Include]? = nil,
                                          limit: GetAppStoreReviewDetailV1.Limit? = nil) -> Request<AppStoreReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreReviewDetails/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetAppStoreReviewDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreReviewAttachments
        case appStoreReviewAttachments([AppStoreReviewAttachments])
        /// The fields to include for returned resources of type appStoreReviewDetails
        case appStoreReviewDetails([AppStoreReviewDetails])

        public enum AppStoreReviewAttachments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewDetail
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreReviewAttachments(rawValue: string) {
                    self = value
                } else if let value = AppStoreReviewAttachments(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreReviewAttachments value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreReviewDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewAttachments
            case appStoreVersion
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreReviewDetails(rawValue: string) {
                    self = value
                } else if let value = AppStoreReviewDetails(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreReviewDetails value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreReviewAttachments
        case appStoreVersion
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appStoreReviewAttachments returned (when they are included) - maximum 50
        case appStoreReviewAttachments(Int)
    }
}
