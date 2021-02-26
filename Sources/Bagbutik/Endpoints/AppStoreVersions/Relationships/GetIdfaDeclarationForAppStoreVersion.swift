public extension Request {
    enum GetIdfaDeclarationForAppStoreVersion {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type idfaDeclarations
            case idfaDeclarations([IdfaDeclarations])

            public enum IdfaDeclarations: String, ParameterValue, CaseIterable {
                case appStoreVersion
                case attributesActionWithPreviousAd
                case attributesAppInstallationToPreviousAd
                case honorsLimitedAdTracking
                case servesAds
            }
        }
    }

    /**
      # Read the IDFA Declaration Information of an App Store Version
      Read your declared Advertising Identifier (IDFA) usage responses.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_idfa_declaration_information_of_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getIdfaDeclarationForAppStoreVersion(id: String,
                                                     fields: [GetIdfaDeclarationForAppStoreVersion.Field]? = nil) -> Request<IdfaDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/idfaDeclaration", method: .get, parameters: .init(fields: fields))
    }
}
