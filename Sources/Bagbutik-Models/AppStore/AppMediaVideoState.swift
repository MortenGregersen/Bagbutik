import Bagbutik_Core
import Foundation

/**
 # AppMediaVideoState
 The properties that describe the state of an app preview or app event video.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appmediavideostate>
 */
public struct AppMediaVideoState: Codable, Sendable {
    public var errors: [AppMediaStateError]?
    public var state: State?
    public var warnings: [AppMediaStateError]?

    public init(errors: [AppMediaStateError]? = nil,
                state: State? = nil,
                warnings: [AppMediaStateError]? = nil)
    {
        self.errors = errors
        self.state = state
        self.warnings = warnings
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        errors = try container.decodeIfPresent([AppMediaStateError].self, forKey: "errors")
        state = try container.decodeIfPresent(State.self, forKey: "state")
        warnings = try container.decodeIfPresent([AppMediaStateError].self, forKey: "warnings")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(errors, forKey: "errors")
        try container.encodeIfPresent(state, forKey: "state")
        try container.encodeIfPresent(warnings, forKey: "warnings")
    }

    public enum State: String, Sendable, Codable, CaseIterable {
        case awaitingUpload = "AWAITING_UPLOAD"
        case complete = "COMPLETE"
        case failed = "FAILED"
        case processing = "PROCESSING"
        case uploadComplete = "UPLOAD_COMPLETE"
    }
}
