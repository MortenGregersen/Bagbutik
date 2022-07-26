public extension Request {
    /**
     # List All Diagnostic Signatures for a Build
     List the aggregate backtrace signatures captured for a specific build.

     The example below requests the top two weighted disk write diagnostic signatures. The example response returns two signatures that are responsible for 85% and 7% of disk writes.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_diagnostic_signatures_for_a_build>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDiagnosticSignaturesForBuildV1(id: String,
                                                   fields: [ListDiagnosticSignaturesForBuildV1.Field]? = nil,
                                                   filters: [ListDiagnosticSignaturesForBuildV1.Filter]? = nil,
                                                   limit: Int? = nil) -> Request<DiagnosticSignaturesResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/diagnosticSignatures", method: .get, parameters: .init(fields: fields,
                                                                                             filters: filters,
                                                                                             limit: limit))
    }
}

public enum ListDiagnosticSignaturesForBuildV1 {
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
