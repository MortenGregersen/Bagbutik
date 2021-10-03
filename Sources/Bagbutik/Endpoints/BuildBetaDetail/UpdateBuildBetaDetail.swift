public extension Request {
    /**
      # Modify a Build Beta Detail
      Update beta test details for a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_build_beta_detail>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: BuildBetaDetail representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBuildBetaDetail(id: String,
                                      requestBody: BuildBetaDetailUpdateRequest) -> Request<BuildBetaDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/buildBetaDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}
