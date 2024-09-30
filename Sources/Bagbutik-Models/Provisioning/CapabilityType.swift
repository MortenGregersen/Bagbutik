import Bagbutik_Core
import Foundation

/**
 # CapabilityType
 String that represents an app's capability type.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/capabilitytype>
 */
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
}
