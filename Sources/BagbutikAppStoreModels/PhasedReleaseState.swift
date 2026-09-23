import BagbutikCore
import Foundation

/**
 # PhasedReleaseState

 String that represents the progress of a phased release for an app version.

 ```
 string PhasedReleaseState
 ```

 ## Discussion

 For more information about phased releases including pausing an update, see [Release a version update in phases](https://developer.apple.com/help/app-store-connect/update-your-app/release-a-version-update-in-phases/).

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/phasedreleasestate>
 */
public enum PhasedReleaseState: String, Sendable, Codable, CaseIterable {
    case active = "ACTIVE"
    case complete = "COMPLETE"
    case inactive = "INACTIVE"
    case paused = "PAUSED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = PhasedReleaseState(rawValue: string) {
            self = value
        } else if let value = PhasedReleaseState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid PhasedReleaseState value: \(string)"
            )
        }
    }
}
