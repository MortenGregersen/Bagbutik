public extension Request {
    enum ListTerritoriesForEndUserLicenseAgreement {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type territories
            case territories([Territories])

            public enum Territories: String, ParameterValue, CaseIterable {
                case currency
            }
        }
    }

    /**
      # List All Territories for an End User License Agreement
      List all the App Store territories to which a specific custom app license agreement applies.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_territories_for_an_end_user_license_agreement>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listTerritoriesForEndUserLicenseAgreement(id: String,
                                                          fields: [ListTerritoriesForEndUserLicenseAgreement.Field]? = nil,
                                                          limit: Int? = nil) -> Request<TerritoriesResponse, ErrorResponse>
    {
        return .init(path: "/v1/endUserLicenseAgreements/\(id)/territories", method: .get, parameters: .init(fields: fields,
                                                                                                             limit: limit))
    }
}
