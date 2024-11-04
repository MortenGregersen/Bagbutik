public extension Device.Attributes.DeviceClass {
    /// A pretty name for the case.
    var prettyName: String {
        switch self {
        case .appleWatch: "Apple Watch"
        case .appleVisionPro: "Apple Vision Pro"
        case .iPad: "iPad"
        case .iPhone: "iPhone"
        case .iPod: "iPod"
        case .appleTV: "Apple TV"
        case .mac: "Mac"
        }
    }
}
