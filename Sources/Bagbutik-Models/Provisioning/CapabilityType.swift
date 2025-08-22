import Bagbutik_Core
import Foundation

public enum CapabilityType: String, Sendable, Codable, CaseIterable {
    case accessWifiInformation = "ACCESS_WIFI_INFORMATION"
    case appGroups = "APP_GROUPS"
    case appleIdAuth = "APPLE_ID_AUTH"
    case applePay = "APPLE_PAY"
    case associatedDomains = "ASSOCIATED_DOMAINS"
    case autofillCredentialProvider = "AUTOFILL_CREDENTIAL_PROVIDER"
    case classKit = "CLASSKIT"
    case coremediaHlsLowLatency = "COREMEDIA_HLS_LOW_LATENCY"
    case dataProtection = "DATA_PROTECTION"
    case gameCenter = "GAME_CENTER"
    case healthKit = "HEALTHKIT"
    case homeKit = "HOMEKIT"
    case hotSpot = "HOT_SPOT"
    case iCloud = "ICLOUD"
    case inAppPurchase = "IN_APP_PURCHASE"
    case interAppAudio = "INTER_APP_AUDIO"
    case maps = "MAPS"
    case multipath = "MULTIPATH"
    case networkCustomProtocol = "NETWORK_CUSTOM_PROTOCOL"
    case networkExtensions = "NETWORK_EXTENSIONS"
    case nfcTagReading = "NFC_TAG_READING"
    case personalVpn = "PERSONAL_VPN"
    case pushNotifications = "PUSH_NOTIFICATIONS"
    case siriKit = "SIRIKIT"
    case systemExtensionInstall = "SYSTEM_EXTENSION_INSTALL"
    case userManagement = "USER_MANAGEMENT"
    case wallet = "WALLET"
    case wirelessAccessoryConfiguration = "WIRELESS_ACCESSORY_CONFIGURATION"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CapabilityType(rawValue: string) {
            self = value
        } else if let value = CapabilityType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CapabilityType value: \(string)"
            )
        }
    }
}
