import Bagbutik_Core
import Foundation

public enum InAppPurchaseState: String, ParameterValue, Codable, CaseIterable {
    case approved = "APPROVED"
    case developerActionNeeded = "DEVELOPER_ACTION_NEEDED"
    case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
    case inReview = "IN_REVIEW"
    case missingMetadata = "MISSING_METADATA"
    case pendingBinaryApproval = "PENDING_BINARY_APPROVAL"
    case processingContent = "PROCESSING_CONTENT"
    case readyToSubmit = "READY_TO_SUBMIT"
    case rejected = "REJECTED"
    case removedFromSale = "REMOVED_FROM_SALE"
    case waitingForReview = "WAITING_FOR_REVIEW"
    case waitingForUpload = "WAITING_FOR_UPLOAD"
}
