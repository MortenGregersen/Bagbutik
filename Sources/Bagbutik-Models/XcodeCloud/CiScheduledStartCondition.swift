import Bagbutik_Core
import Foundation

/**
 # CiScheduledStartCondition
 Settings for a start condition that starts a build based on a schedule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cischeduledstartcondition>
 */
public struct CiScheduledStartCondition: Codable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        schedule = try container.decodeIfPresent(Schedule.self, forKey: "schedule")
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(schedule, forKey: "schedule")
        try container.encodeIfPresent(source, forKey: "source")
    }

    public struct Schedule: Codable, Sendable {
        public var days: [Days]?
        public var frequency: Frequency?
        public var hour: Int?
        public var minute: Int?
        public var timezone: String?

        public init(days: [Days]? = nil,
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            days = try container.decodeIfPresent([Days].self, forKey: "days")
            frequency = try container.decodeIfPresent(Frequency.self, forKey: "frequency")
            hour = try container.decodeIfPresent(Int.self, forKey: "hour")
            minute = try container.decodeIfPresent(Int.self, forKey: "minute")
            timezone = try container.decodeIfPresent(String.self, forKey: "timezone")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(days, forKey: "days")
            try container.encodeIfPresent(frequency, forKey: "frequency")
            try container.encodeIfPresent(hour, forKey: "hour")
            try container.encodeIfPresent(minute, forKey: "minute")
            try container.encodeIfPresent(timezone, forKey: "timezone")
        }

        public enum Days: String, Sendable, Codable, CaseIterable {
            case friday = "FRIDAY"
            case monday = "MONDAY"
            case saturday = "SATURDAY"
            case sunday = "SUNDAY"
            case thursday = "THURSDAY"
            case tuesday = "TUESDAY"
            case wednesday = "WEDNESDAY"
        }

        public enum Frequency: String, Sendable, Codable, CaseIterable {
            case daily = "DAILY"
            case hourly = "HOURLY"
            case weekly = "WEEKLY"
        }
    }
}
