import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Download Sales and Trends Reports
     Download sales and trends reports filtered by your specified criteria.

     Each sales report type has specific valid values for `reportType`, `reportSubType`, `frequency`, and `version`. If you use other types, it results in an error. For more details on each report type, see [Download and view reports](https://developer.apple.comhttps://developer.apple.com/help/app-store-connect/view-sales-and-trends/download-and-view-reports).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-salesReports>

     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSalesReportsV1(filters: [GetSalesReportsV1.Filter]? = nil) -> Request<Gzip, ErrorResponse> {
        .init(
            path: "/v1/salesReports",
            method: .get,
            parameters: .init(filters: filters))
    }
}

public enum GetSalesReportsV1 {
    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `vendorNumber`, `reportType`, `reportSubType`, `frequency`
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

        public enum Frequency: String, Sendable, ParameterValue, Codable, CaseIterable {
            case daily = "DAILY"
            case monthly = "MONTHLY"
            case weekly = "WEEKLY"
            case yearly = "YEARLY"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Frequency(rawValue: string) {
                    self = value
                } else if let value = Frequency(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Frequency value: \(string)"
                    )
                }
            }
        }

        public enum ReportSubType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case detailed = "DETAILED"
            case summary = "SUMMARY"
            case summaryChannel = "SUMMARY_CHANNEL"
            case summaryInstallType = "SUMMARY_INSTALL_TYPE"
            case summaryTerritory = "SUMMARY_TERRITORY"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReportSubType(rawValue: string) {
                    self = value
                } else if let value = ReportSubType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReportSubType value: \(string)"
                    )
                }
            }
        }

        public enum ReportType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case firstAnnual = "FIRST_ANNUAL"
            case installs = "INSTALLS"
            case newsstand = "NEWSSTAND"
            case preOrder = "PRE_ORDER"
            case sales = "SALES"
            case subscriber = "SUBSCRIBER"
            case subscription = "SUBSCRIPTION"
            case subscriptionEvent = "SUBSCRIPTION_EVENT"
            case subscriptionOfferCodeRedemption = "SUBSCRIPTION_OFFER_CODE_REDEMPTION"
            case winBackEligibility = "WIN_BACK_ELIGIBILITY"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReportType(rawValue: string) {
                    self = value
                } else if let value = ReportType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReportType value: \(string)"
                    )
                }
            }
        }
    }
}
