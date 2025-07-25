import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Download Finance Reports
     Download finance reports filtered by your specified criteria.

     For more information see [Download financial reports](https://developer.apple.comhttps://developer.apple.com/help/app-store-connect/getting-paid/download-financial-reports).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-financeReports>

     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getFinanceReportsV1(filters: [GetFinanceReportsV1.Filter]? = nil) -> Request<Gzip, ErrorResponse> {
        .init(
            path: "/v1/financeReports",
            method: .get,
            parameters: .init(filters: filters))
    }
}

public enum GetFinanceReportsV1 {
    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `vendorNumber`, `reportType`, `regionCode`, `reportDate`
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

        public enum ReportType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case financeDetail = "FINANCE_DETAIL"
            case financial = "FINANCIAL"
        }
    }
}
