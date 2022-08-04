import Foundation
import Bagbutik_Core

/**
 # CiScheduledStartCondition
 Settings for a start condition that starts a build based on a schedule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cischeduledstartcondition>
 */
public struct CiScheduledStartCondition: Codable {
    /// The schedule information you configure for a workflow that starts a new build based on a schedule.
    public var schedule: Schedule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build on a schedule.
    public var source: CiBranchPatterns?

    public init(schedule: Schedule? = nil,
                source: CiBranchPatterns? = nil)
    {
        self.schedule = schedule
        self.source = source
    }

    /**
     # CiScheduledStartCondition.Schedule
     The schedule of an Xcode Cloud workflow that starts a new build based on a schedule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cischeduledstartcondition/schedule>
     */
    public struct Schedule: Codable {
        /// A list of days you configure for the start condition that starts a new build on a schedule.
        public var days: Items?
        /// A string indicating the frequency of the start condition that starts a new build on a schedule.
        public var frequency: Frequency?
        /// An integer that represents the hour you configure for the start condition that starts a new build on a schedule.
        public var hour: Int?
        /// An integer that represents the minute you configure for the start condition that starts a new build on a schedule.
        public var minute: Int?
        /// A string that represents the time zone you configure for the start condition that starts a new build on a schedule.
        public var timezone: String?

        public init(days: Items? = nil,
                    frequency: Frequency? = nil,
                    hour: Int? = nil,
                    minute: Int? = nil,
                    timezone: String? = nil)
        {
            self.days = days
            self.frequency = frequency
            self.hour = hour
            self.minute = minute
            self.timezone = timezone
        }

        public enum Frequency: String, Codable, CaseIterable {
            case weekly = "WEEKLY"
            case daily = "DAILY"
            case hourly = "HOURLY"
        }

        public enum Items: String, Codable, CaseIterable {
            case sunday = "SUNDAY"
            case monday = "MONDAY"
            case tuesday = "TUESDAY"
            case wednesday = "WEDNESDAY"
            case thursday = "THURSDAY"
            case friday = "FRIDAY"
            case saturday = "SATURDAY"
        }
    }
}
