public extension Request {
    /**
     # Start a Build
     Start a new Xcode Cloud build for a workflow.

     The example request below starts a new build for a specific workflow. Use the information provided in the response to display build information on a dashboard or to access additional information; for example, the actions Xcode Cloud performs during the build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/start_a_build>

     - Parameter requestBody: CiBuildRun representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func startCiBuildRunV1(requestBody: CiBuildRunCreateRequest) -> Request<CiBuildRunResponse, ErrorResponse> {
        .init(path: "/v1/ciBuildRuns", method: .post, requestBody: requestBody)
    }
}
