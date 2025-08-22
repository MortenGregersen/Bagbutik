import Bagbutik_Core
import Foundation

public enum WebhookEventType: String, Sendable, Codable, CaseIterable {
    case appStoreVersionAppVersionStateUpdated = "APP_STORE_VERSION_APP_VERSION_STATE_UPDATED"
    case betaFeedbackCrashSubmissionCreated = "BETA_FEEDBACK_CRASH_SUBMISSION_CREATED"
    case betaFeedbackScreenshotSubmissionCreated = "BETA_FEEDBACK_SCREENSHOT_SUBMISSION_CREATED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = WebhookEventType(rawValue: string) {
            self = value
        } else if let value = WebhookEventType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid WebhookEventType value: \(string)"
            )
        }
    }
}
