public extension Request {
    enum GetAppStoreReviewDetailForAppStoreVersion {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appStoreReviewAttachments
            case appStoreReviewAttachments([AppStoreReviewAttachments])
            /// The fields to include for returned resources of type appStoreReviewDetails
            case appStoreReviewDetails([AppStoreReviewDetails])
            /// The fields to include for returned resources of type appStoreVersions
            case appStoreVersions([AppStoreVersions])

            public enum AppStoreReviewAttachments: String, ParameterValue, CaseIterable {
                case appStoreReviewDetail
                case assetDeliveryState
                case fileName
                case fileSize
                case sourceFileChecksum
                case uploadOperations
                case uploaded
            }

            public enum AppStoreReviewDetails: String, ParameterValue, CaseIterable {
                case appStoreReviewAttachments
                case appStoreVersion
                case contactEmail
                case contactFirstName
                case contactLastName
                case contactPhone
                case demoAccountName
                case demoAccountPassword
                case demoAccountRequired
                case notes
            }

            public enum AppStoreVersions: String, ParameterValue, CaseIterable {
                case ageRatingDeclaration
                case app
                case appStoreReviewDetail
                case appStoreState
                case appStoreVersionLocalizations
                case appStoreVersionPhasedRelease
                case appStoreVersionSubmission
                case build
                case copyright
                case createdDate
                case downloadable
                case earliestReleaseDate
                case idfaDeclaration
                case platform
                case releaseType
                case routingAppCoverage
                case usesIdfa
                case versionString
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case appStoreReviewAttachments, appStoreVersion
        }
    }

    /**
      # Read the App Store Review Details Resource Information of an App Store Version
      Get the details you provide to App Review so they can test your app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_review_details_resource_information_of_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreReviewDetailForAppStoreVersion(id: String,
                                                          fields: [GetAppStoreReviewDetailForAppStoreVersion.Field]? = nil,
                                                          includes: [GetAppStoreReviewDetailForAppStoreVersion.Include]? = nil) -> Request<AppStoreReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/appStoreReviewDetail", method: .get, parameters: .init(fields: fields,
                                                                                                              includes: includes))
    }
}
