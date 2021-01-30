public extension Request {
    enum GetAppEncryptionDeclaration {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appEncryptionDeclarations
            case appEncryptionDeclarations([AppEncryptionDeclarations])
            /// The fields to include for returned resources of type apps
            case apps([Apps])

            public enum AppEncryptionDeclarations: String, ParameterValue, CaseIterable {
                case app
                case appEncryptionDeclarationState
                case availableOnFrenchStore
                case builds
                case codeValue
                case containsProprietaryCryptography
                case containsThirdPartyCryptography
                case documentName
                case documentType
                case documentUrl
                case exempt
                case platform
                case uploadedDate
                case usesEncryption
            }

            public enum Apps: String, ParameterValue, CaseIterable {
                case appInfos
                case appStoreVersions
                case availableInNewTerritories
                case availableTerritories
                case betaAppLocalizations
                case betaAppReviewDetail
                case betaGroups
                case betaLicenseAgreement
                case betaTesters
                case builds
                case bundleId
                case contentRightsDeclaration
                case endUserLicenseAgreement
                case gameCenterEnabledVersions
                case inAppPurchases
                case isOrEverWasMadeForKids
                case name
                case perfPowerMetrics
                case preOrder
                case preReleaseVersions
                case prices
                case primaryLocale
                case sku
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app
        }
    }

    /**
      # Read App Encryption Declaration Information
      Get information about a specific app encryption declaration.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_encryption_declaration_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppEncryptionDeclaration(id: String,
                                            fields: [GetAppEncryptionDeclaration.Field]? = nil,
                                            includes: [GetAppEncryptionDeclaration.Include]? = nil) -> Request<AppEncryptionDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEncryptionDeclarations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                  includes: includes))
    }
}
