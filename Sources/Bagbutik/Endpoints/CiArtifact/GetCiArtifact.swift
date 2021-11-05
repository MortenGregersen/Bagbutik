public extension Request {
    /**
      # Read Xcode Cloud Artifact Information
      Get information about the artifact Xcode Cloud created for a specific action when it performed a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_artifact_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiArtifact(id: String,
                              fields: [GetCiArtifact.Field]? = nil) -> Request<CiArtifactResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciArtifacts/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCiArtifact {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ciArtifacts
        case ciArtifacts([CiArtifacts])

        public enum CiArtifacts: String, ParameterValue, CaseIterable {
            case downloadUrl
            case fileName
            case fileSize
            case fileType
        }
    }
}
