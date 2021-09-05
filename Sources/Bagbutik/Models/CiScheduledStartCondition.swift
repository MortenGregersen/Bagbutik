import Foundation

/**
 Settings for a start condition that starts a build based on a schedule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cischeduledstartcondition>
 */
public struct CiScheduledStartCondition: Codable {
    /// The schedule information you configure for a workflow that starts a new build based on a schedule.
    public let schedule: Schedule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build on a schedule.
    public let source: CiBranchPatterns?

    public init(schedule: Schedule? = nil, source: CiBranchPatterns? = nil) {
        self.schedule = schedule
        self.source = source
    }

    public struct Schedule: Codable {
        public let days: Items?
        public let frequency: Frequency?
        public let hour: Int?
        public let minute: Int?
        public let timezone: String?

        public init(days: Items? = nil, frequency: Frequency? = nil, hour: Int? = nil, minute: Int? = nil, timezone: String? = nil) {
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
