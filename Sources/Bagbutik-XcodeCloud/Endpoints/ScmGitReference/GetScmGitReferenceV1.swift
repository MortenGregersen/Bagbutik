import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Git Reference Information
     Get information about a specific Git reference.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmGitReferences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getScmGitReferenceV1(id: String,
                                     fields: [GetScmGitReferenceV1.Field]? = nil,
                                     includes: [GetScmGitReferenceV1.Include]? = nil) -> Request<ScmGitReferenceResponse, ErrorResponse> {
        .init(
            path: "/v1/scmGitReferences/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetScmGitReferenceV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type scmGitReferences
        case scmGitReferences([ScmGitReferences])

        public enum ScmGitReferences: String, Sendable, ParameterValue, Codable, CaseIterable {
            case canonicalName
            case isDeleted
            case kind
            case name
            case repository

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ScmGitReferences(rawValue: string) {
                    self = value
                } else if let value = ScmGitReferences(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ScmGitReferences value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case repository
    }
}
