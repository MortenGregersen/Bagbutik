<!--
{
  "availability" : [
    "App Store Connect API: 1.0.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-salesReports",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-salesReports"
  },
  "title" : "Download sales and trends reports"
}
-->

# Download sales and trends reports

Download sales and trends reports filtered by your specified criteria.

## Discussion

### Allowed values based on sales report type

Each sales report type has specific valid values for `reportType`, `reportSubType`, `frequency`, and `version`. If you use other types, it results in an error. For more details on each report type, see [Download and view reports](https://developer.apple.com/help/app-store-connect/view-sales-and-trends/download-and-view-reports).

> Note:
> Version 1_2 of the Subscription, Subscription Event, and Subscriber reports in Sales and Trends is no longer available for download.

|`reportType`                      |`reportSubType`     |`frequency`                   |`version`|
|----------------------------------|--------------------|------------------------------|---------|
|FIRST_ANNUAL                      |DETAILED            |DAILY                         |1_0      |
|FIRST_ANNUAL                      |SUMMARY             |YEARLY                        |1_0      |
|INSTALLS                          |SUMMARY_CHANNEL     |YEARLY                        |1_0, 1_1 |
|INSTALLS                          |SUMMARY_INSTALL_TYPE|YEARLY                        |1_0, 1_1 |
|INSTALLS                          |SUMMARY             |MONTHLY                       |1_2      |
|INSTALLS                          |SUMMARY_TERRITORY   |YEARLY                        |1_0, 1_1 |
|INSTALLS                          |DETAILED            |MONTHLY                       |1_2      |
|INSTALLS                          |DETAILED            |YEARLY                        |1_0, 1_1 |
|NEWSSTAND                         |DETAILED            |DAILY, WEEKLY                 |1_0      |
|PRE_ORDER                         |SUMMARY             |DAILY, WEEKLY, MONTHLY, YEARLY|1_0      |
|SALES                             |SUMMARY             |DAILY, WEEKLY, MONTHLY, YEARLY|1_0      |
|SUBSCRIBER                        |DETAILED            |DAILY                         |1_3      |
|SUBSCRIPTION                      |SUMMARY             |DAILY                         |1_3      |
|SUBSCRIPTION_EVENT                |SUMMARY             |DAILY                         |1_3      |
|SUBSCRIPTION_OFFER_CODE_REDEMPTION|SUMMARY             |DAILY                         |1_0      |
|WIN_BACK_ELIGIBILITY              |SUMMARY             |DAILY                         |1_0      |

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)