import Bagbutik_Core
import Foundation

public enum AppStoreVersionState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case developerRejected = "DEVELOPER_REJECTED"
    case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
    case inReview = "IN_REVIEW"
    case invalidBinary = "INVALID_BINARY"
    case metadataRejected = "METADATA_REJECTED"
    case notApplicable = "NOT_APPLICABLE"
    case pendingAppleRelease = "PENDING_APPLE_RELEASE"
    case pendingContract = "PENDING_CONTRACT"
    case pendingDeveloperRelease = "PENDING_DEVELOPER_RELEASE"
    case preorderReadyForSale = "PREORDER_READY_FOR_SALE"
    case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
    case processingForAppStore = "PROCESSING_FOR_APP_STORE"
    case readyForReview = "READY_FOR_REVIEW"
    case readyForSale = "READY_FOR_SALE"
    case rejected = "REJECTED"
    case removedFromSale = "REMOVED_FROM_SALE"
    case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
    case waitingForExportCompliance = "WAITING_FOR_EXPORT_COMPLIANCE"
    case waitingForReview = "WAITING_FOR_REVIEW"
}
