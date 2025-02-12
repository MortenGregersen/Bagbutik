import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Download Logs for a Diagnostic Signature
     Get the anonymized backtrace logs associated with a specific diagnostic signature.

     The example below requests a single disk write diagnostic log for a specific signature.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-diagnosticSignatures-_id_-logs>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLogsForDiagnosticSignatureV1(id: String,
                                                 limit: Int? = nil) -> Request<DiagnosticLogs, ErrorResponse>
    {
        .init(path: "/v1/diagnosticSignatures/\(id)/logs", method: .get, parameters: .init(limit: limit))
    }
}
