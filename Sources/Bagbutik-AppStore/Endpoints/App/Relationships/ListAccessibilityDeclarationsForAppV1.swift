import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all accessibility declarations for an app
     Get a list of the accessibility declarations for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-accessibilityDeclarations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAccessibilityDeclarationsForAppV1(id: String,
                                                      fields: [ListAccessibilityDeclarationsForAppV1.Field]? = nil,
                                                      filters: [ListAccessibilityDeclarationsForAppV1.Filter]? = nil,
                                                      limit: Int? = nil) -> Request<AccessibilityDeclarationsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/accessibilityDeclarations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                limit: limit))
    }
}

public enum ListAccessibilityDeclarationsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type accessibilityDeclarations
        case accessibilityDeclarations([AccessibilityDeclarations])

        public enum AccessibilityDeclarations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case deviceFamily
            case state
            case supportsAudioDescriptions
            case supportsCaptions
            case supportsDarkInterface
            case supportsDifferentiateWithoutColorAlone
            case supportsLargerText
            case supportsReducedMotion
            case supportsSufficientContrast
            case supportsVoiceControl
            case supportsVoiceover
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'deviceFamily'
        case deviceFamily([DeviceFamily])
        /// Filter by attribute 'state'
        case state([State])

        public enum State: String, Sendable, ParameterValue, Codable, CaseIterable {
            case draft = "DRAFT"
            case published = "PUBLISHED"
            case replaced = "REPLACED"
        }
    }
}
