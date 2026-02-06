@testable import BagbutikCLI
import Foundation
import XCTest

final class ProcessUnzipTests: XCTestCase {
    func testUnzip_UsesArgumentBasedInvocation() throws {
        let fileURL = URL(fileURLWithPath: "/tmp/spec file.zip")
        let destinationURL = URL(fileURLWithPath: "/tmp/unzip destination")

        var capturedExecutableURL: URL?
        var capturedArguments: [String]?
        try Process.unzip(file: fileURL, destination: destinationURL) { executableURL, arguments in
            capturedExecutableURL = executableURL
            capturedArguments = arguments
            return .init(terminationReason: .exit, terminationStatus: 0, standardOutput: Data(), standardError: Data())
        }

        XCTAssertEqual(capturedExecutableURL, URL(fileURLWithPath: "/usr/bin/env"))
        XCTAssertEqual(capturedArguments, ["unzip", "-o", fileURL.path, "-d", destinationURL.path])
    }

    func testUnzip_DoesNotFailWhenStderrHasOutputAndExitCodeIsZero() {
        let fileURL = URL(fileURLWithPath: "/tmp/spec.zip")
        let destinationURL = URL(fileURLWithPath: "/tmp/unzip")

        XCTAssertNoThrow(try Process.unzip(file: fileURL, destination: destinationURL) { _, _ in
            .init(
                terminationReason: .exit,
                terminationStatus: 0,
                standardOutput: Data(),
                standardError: Data("warning".utf8)
            )
        })
    }

    func testUnzip_ThrowsErrorWhenExitCodeIsNonZero() {
        let fileURL = URL(fileURLWithPath: "/tmp/spec.zip")
        let destinationURL = URL(fileURLWithPath: "/tmp/unzip")

        XCTAssertThrowsError(try Process.unzip(file: fileURL, destination: destinationURL) { _, _ in
            .init(
                terminationReason: .exit,
                terminationStatus: 1,
                standardOutput: Data(),
                standardError: Data("cannot open".utf8)
            )
        }) { error in
            XCTAssertEqual(String(describing: error), "cannot open")
        }
    }
}
