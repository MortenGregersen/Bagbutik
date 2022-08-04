import Foundation
import Bagbutik_Core

/**
 # PhasedReleaseState
 String that represents the progress of a phased release for an app version.

 For more information about phased releases including pausing an update, see [Release a version update in phases](https://help.apple.com/app-store-connect/#/dev3d65fcee1).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/phasedreleasestate>
 */
public enum PhasedReleaseState: String, Codable, CaseIterable {
    /// The phased release hasn’t started.
    case inactive = "INACTIVE"
    /// The app version is released. During a phased release, the App Store releases the update over a 7-day period to a percentage of your users, randomly selected. The phased release applies to macOS and iOS devices with automatic updates enabled. Users can also manually download the app version.
    case active = "ACTIVE"
    /// The App Store paused the phased release, at your request.
    case paused = "PAUSED"
    /// The process released the update to all devices that have automatic updates enabled. The phased-release process is complete.
    case complete = "COMPLETE"
}
