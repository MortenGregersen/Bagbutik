public extension Request {
    /**
      # Download Logs for a Diagnostic Signature
      Get the anonymized backtrace logs associated with a specific diagnostic signature.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/download_logs_for_a_diagnostic_signature>

      - Parameter id: The id of the requested resource
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listLogsForDiagnosticSignature(id: String,
                                               limit: Int? = nil) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/diagnosticSignatures/\(id)/logs", method: .get, parameters: .init(limit: limit))
    }
}
