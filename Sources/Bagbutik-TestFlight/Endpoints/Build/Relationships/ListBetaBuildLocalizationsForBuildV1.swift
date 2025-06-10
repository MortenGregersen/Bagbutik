import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Beta Build Localizations of a Build
     Get a list of localized beta test information for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-betaBuildLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaBuildLocalizationsForBuildV1(id: String,
                                                     fields: [ListBetaBuildLocalizationsForBuildV1.Field]? = nil,
                                                     limit: Int? = nil) -> Request<BetaBuildLocalizationsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/betaBuildLocalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBetaBuildLocalizationsForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaBuildLocalizations
        case betaBuildLocalizations([BetaBuildLocalizations])

        public enum BetaBuildLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case build
            case locale
            case whatsNew
        }
    }
}
