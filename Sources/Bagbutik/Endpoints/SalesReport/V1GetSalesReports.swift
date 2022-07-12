public extension Request {
    /**
      # Download Sales and Trends Reports
      Download sales and trends reports filtered by your specified criteria.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/download_sales_and_trends_reports>

      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSalesReportsV1(filters: [GetSalesReportsV1.Filter]? = nil) -> Request<Gzip, ErrorResponse> {
        return .init(path: "/v1/salesReports", method: .get, parameters: .init(filters: filters))
    }
}

public enum V1GetSalesReports {
    /**
     Attributes, relationships, and IDs by which to filter.

     Required: frequency, reportSubType, reportType, vendorNumber
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'frequency'
        case frequency([Frequency])
        /// Filter by attribute 'reportDate'
        case reportDate([String])
        /// Filter by attribute 'reportSubType'
        case reportSubType([ReportSubType])
        /// Filter by attribute 'reportType'
        case reportType([ReportType])
        /// Filter by attribute 'vendorNumber'
        case vendorNumber([String])
        /// Filter by attribute 'version'
        case version([String])

        public enum Frequency: String, ParameterValue, CaseIterable {
            case daily = "DAILY"
            case weekly = "WEEKLY"
            case monthly = "MONTHLY"
            case yearly = "YEARLY"
        }

        public enum ReportSubType: String, ParameterValue, CaseIterable {
            case summary = "SUMMARY"
            case detailed = "DETAILED"
        }

        public enum ReportType: String, ParameterValue, CaseIterable {
            case sales = "SALES"
            case preOrder = "PRE_ORDER"
            case newsstand = "NEWSSTAND"
            case subscription = "SUBSCRIPTION"
            case subscriptionEvent = "SUBSCRIPTION_EVENT"
            case subscriber = "SUBSCRIBER"
            case subscriptionOfferCodeRedemption = "SUBSCRIPTION_OFFER_CODE_REDEMPTION"
        }
    }
}
