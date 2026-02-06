@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
import XCTest

final class FeedbackCheckerTests: XCTestCase {
    let validSpecFileURL = URL(fileURLWithPath: "/Users/steve/spec.json")

    func testInvalidSpecFileURL() async {
        let checker = makeChecker()
        let invalidSpecFileURL = URL(string: "https://developer.apple.com")!
        let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")

        await XCTAssertAsyncThrowsError(try await checker.checkFeedback(specFileURL: invalidSpecFileURL, documentationDirURL: validDocumentationDirURL)) {
            XCTAssertEqual($0 as? FeedbackCheckerError, .notFileUrl(.specFileURL))
        }
    }

    func testInvalidDocumentationDirURL() async {
        let checker = makeChecker()
        let invalidDocumentationDirURL = URL(string: "https://developer.apple.com")!

        await XCTAssertAsyncThrowsError(try await checker.checkFeedback(specFileURL: validSpecFileURL, documentationDirURL: invalidDocumentationDirURL)) {
            XCTAssertEqual($0 as? FeedbackCheckerError, .notFileUrl(.documentationDirUrl))
        }
    }

    private func makeChecker() -> FeedbackChecker {
        FeedbackChecker(
            loadOriginalSpec: { _ in fatalError("Spec loading should not be reached in URL validation tests") },
            loadPatchedSpec: { _ in fatalError("Spec loading should not be reached in URL validation tests") },
            docsLoader: DocsLoader(),
            print: { _ in }
        )
    }
}
