public extension Request {
    /**
      # List All Diagnostic Signatures for a Build
      List the aggregate backtrace signatures captured for a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_diagnostic_signatures_for_a_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listDiagnosticSignaturesForBuild(id: String,
                                                 fields: [ListDiagnosticSignaturesForBuild.Field]? = nil,
                                                 filters: [ListDiagnosticSignaturesForBuild.Filter]? = nil,
                                                 limit: Int? = nil) -> Request<DiagnosticSignaturesResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/diagnosticSignatures", method: .get, parameters: .init(fields: fields,
                                                                                                    filters: filters,
                                                                                                    limit: limit))
    }
}

public enum ListDiagnosticSignaturesForBuild {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type diagnosticSignatures
        case diagnosticSignatures([DiagnosticSignatures])

        public enum DiagnosticSignatures: String, ParameterValue, CaseIterable {
            case diagnosticType
            case logs
            case signature
            case weight
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'diagnosticType'
        case diagnosticType([DiagnosticType])

        public enum DiagnosticType: String, ParameterValue, CaseIterable {
            case diskWrites = "DISK_WRITES"
            case hangs = "HANGS"
        }
    }
}
