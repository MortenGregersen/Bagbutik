public extension Device.Attributes.DeviceClass {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .appleWatch: return "Apple Watch"
        case .iPad: return "iPad"
        case .iPhone: return "iPhone"
        case .iPod: return "iPod"
        case .appleTV: return "Apple TV"
        case .mac: return "Mac"
        }
    }
}
