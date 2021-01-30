public extension CapabilityType {
    var prettyName: String {
        switch self {
        case .iCloud: return "iCloud"
        case .inAppPurchase: return "In-App Purchase"
        case .gameCenter: return "Game Center"
        case .pushNotifications: return "Push Notifications"
        case .wallet: return "Wallet"
        case .interAppAudio: return "Inter-App Audio"
        case .maps: return "Maps"
        case .associatedDomains: return "Associated Domains"
        case .personalVpn: return "Personal VPN"
        case .appGroups: return "App Groups"
        case .healthKit: return "HealthKit"
        case .homeKit: return "HomeKit"
        case .wirelessAccessoryConfiguration: return "Wireless Accessory Configuration"
        case .applePay: return "Apple Pay Payment Processing"
        case .dataProtection: return "Data Protection"
        case .siriKit: return "SiriKit"
        case .networkExtensions: return "Network Extensions"
        case .multipath: return "Multipath"
        case .hotSpot: return "Hotspot"
        case .nfcTagReading: return "NFC Tag Reading"
        case .classKit: return "ClassKit"
        case .autofillCredentialProvider: return "AutoFill Credential Provider"
        case .accessWifiInformation: return "Access WiFi Information"
        case .networkCustomProtocol: return "Custom Network Protocol"
        case .coremediaHlsLowLatency: return "Low Latency HLS"
        case .systemExtensionInstall: return "System Extension"
        case .userManagement: return "User Management"
        case .appleIdAuth: return "Sign In with Apple"
        }
    }
}
