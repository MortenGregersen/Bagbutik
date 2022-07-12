public extension Request {
    /**
      # Download Finance Reports
      Download finance reports filtered by your specified criteria.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/download_finance_reports>

      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getFinanceReportsV1(filters: [GetFinanceReportsV1.Filter]? = nil) -> Request<Gzip, ErrorResponse> {
        return .init(path: "/v1/financeReports", method: .get, parameters: .init(filters: filters))
    }
}

public enum V1GetFinanceReports {
    /**
     Attributes, relationships, and IDs by which to filter.

     Required: regionCode, reportDate, reportType, vendorNumber
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'regionCode'
        case regionCode([String])
        /// Filter by attribute 'reportDate'
        case reportDate([String])
        /// Filter by attribute 'reportType'
        case reportType([ReportType])
        /// Filter by attribute 'vendorNumber'
        case vendorNumber([String])

        public enum ReportType: String, ParameterValue, CaseIterable {
            case financial = "FINANCIAL"
            case financeDetail = "FINANCE_DETAIL"
        }
    }
}
