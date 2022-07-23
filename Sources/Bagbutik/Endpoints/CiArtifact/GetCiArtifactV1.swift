public extension Request {
    /**
      # Read Xcode Cloud Artifact Information
      Get information about the artifact Xcode Cloud created for a specific action when it performed a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_xcode_cloud_artifact_information>

      The example request below retrieves detailed information about a specific artifact Xcode Cloud created when it performed a build. Use the information provided to download the artifact and store it on your own servers. Note that the returned download URL is only valid for a limited amount of time.

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getCiArtifactV1(id: String,
                                fields: [GetCiArtifactV1.Field]? = nil) -> Request<CiArtifactResponse, ErrorResponse>
    {
        return .init(path: "/v1/ciArtifacts/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetCiArtifactV1 {
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
