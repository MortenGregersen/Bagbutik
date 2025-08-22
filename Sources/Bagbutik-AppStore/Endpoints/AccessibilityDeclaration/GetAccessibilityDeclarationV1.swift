import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read accessibility declaration information
     Get information about a specific accessibility declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-accessibilityDeclarations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAccessibilityDeclarationV1(id: String,
                                              fields: [GetAccessibilityDeclarationV1.Field]? = nil) -> Request<AccessibilityDeclarationResponse, ErrorResponse> {
        .init(
            path: "/v1/accessibilityDeclarations/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAccessibilityDeclarationV1 {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AccessibilityDeclarations(rawValue: string) {
                    self = value
                } else if let value = AccessibilityDeclarations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AccessibilityDeclarations value: \(string)"
                    )
                }
            }
        }
    }
}
