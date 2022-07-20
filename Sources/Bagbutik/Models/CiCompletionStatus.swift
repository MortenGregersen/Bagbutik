import Foundation

/**
   A string that represents the completion status of an Xcode Cloud build.

   Full documentation:
   <https://developer.apple.com/documentation/appstoreconnectapi/cicompletionstatus>
 */
public enum CiCompletionStatus: String, Codable, CaseIterable {
    /// Xcode Cloud successfully completed a build.
    case succeeded = "SUCCEEDED"
    /// The Xcode Cloud build failed; for example, if you configure the Required to Pass setting for a test action and a unit test fails. For more information, see Add a Test Action in [Configuring your Xcode Cloud workflow’s actions](https://developer.apple.com/documentation/xcode/configuring-your-xcode-cloud-workflow-s-actions).
    case failed = "FAILED"
    /// Xcode Cloud encountered an internal error when it performed the build.
    case errored = "ERRORED"
    /// Xcode Cloud canceled the build because you manually canceled an ongoing build or because you enabled the Auto-cancel Builds setting for a workflow. For more information about the Auto-cancel Builds setting, see [Xcode Cloud workflow reference](https://developer.apple.com/documentation/xcode/xcode-cloud-workflow-reference).
    case canceled = "CANCELED"
    /// Xcode Cloud skipped the build; for example, if you configure the Auto-cancel Builds setting for a workflow and push many changes in quick succession.
    case skipped = "SKIPPED"
}
