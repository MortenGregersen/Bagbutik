import Bagbutik_Core
import Foundation

/**
 # MetricCategory
 Categories of metric reports for apps that you distribute through the App Store.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/metriccategory>
 */
public enum MetricCategory: String, Codable, CaseIterable {
    /// The number of seconds per hour that the main thread of the app is unresponsive for more than 250ms, which is the maximum amount of time an app can respond to a typical user event before the user perceives it as slow.
    case hang = "HANG"
    /// The average launch time, which is the time between the user tapping on your app icon and the time that the system draws a screen other than the launch screen. The launch time is measured in milliseconds.
    case launch = "LAUNCH"
    /// The amount of memory the app uses, in megabytes.
    case memory = "MEMORY"
    /// The amount of megabytes per day the app writes to long term storage.
    case disk = "DISK"
    /// The amount of battery power the app uses over a 24 hour period when the device is disconnected from power.
    case battery = "BATTERY"
    /// The average amount of non-user-initiated app terminations, including background terminations, per day.
    case termination = "TERMINATION"
    /// The duration of pauses that occur while scrolling an app.
    case animation = "ANIMATION"
}
