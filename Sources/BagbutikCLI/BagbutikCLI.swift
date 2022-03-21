import ArgumentParser
import BagbutikGenerator
import Foundation
import Zip
#if canImport(FoundationNetworking)
// Linux support
import FoundationNetworking
#endif

@main
struct BagbutikCLI: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A utility for downloading spec and generating models and endpoints.",
        subcommands: [Generate.self, DownloadNewestSpec.self],
        defaultSubcommand: Generate.self)

    struct Generate: AsyncParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Generate models and endpoints from spec. If the path to a spec is omitted, the newest version is downloaded from Apple.")

        @Option(name: .shortAndLong, help: "Path to the App Store Connect OpenAPI Spec")
        var specPath: String?

        @Option(name: .shortAndLong, help: "The output folder for the generated files. Should contain the current Endpoints and Models.")
        var outputPath = "./Sources/Bagbutik"

        mutating func run() async throws {
            let specFileURL: URL
            if let specPath = specPath {
                specFileURL = URL(fileURLWithPath: specPath)
            } else {
                print("No path to a spec is supplied. Will download the newest version from Apple.")
                specFileURL = try await downloadNewestSpec()
            }
            let outputDirURL = URL(fileURLWithPath: outputPath)
            try await Generator().generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)
        }
    }

    struct DownloadNewestSpec: AsyncParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Download the newest spec.")

        mutating func run() async throws {
            try await downloadNewestSpec()
        }
    }

    @discardableResult
    static func downloadNewestSpec() async throws -> URL {
        let url = URL(string: "https://developer.apple.com/sample-code/app-store-connect/app-store-connect-openapi-specification.zip")!
        var result: Result<URL, Error>!
        print("Downloading spec file from Apple...")
        let (locationURL, response) = try await URLSession.shared.download(from: url)
        do {
            guard let response = response as? HTTPURLResponse, (200 ... 399).contains(response.statusCode) else {
                throw CLIError.httpError(response as? HTTPURLResponse)
            }
            let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            let unzippedLocationURL = cachesDirectory.appendingPathComponent("bagbutik-spec-unzip")
            try FileManager.default.createDirectory(at: unzippedLocationURL, withIntermediateDirectories: true)
            let zipFileURL = cachesDirectory.appendingPathComponent("spec.zip")
            if FileManager.default.fileExists(atPath: zipFileURL.path) {
                try FileManager.default.removeItem(at: zipFileURL)
            }
            try FileManager.default.moveItem(at: locationURL, to: zipFileURL)
            try Zip.unzipFile(zipFileURL, destination: unzippedLocationURL, overwrite: true, password: nil)
            let files = try FileManager.default.contentsOfDirectory(atPath: unzippedLocationURL.path)
            guard let specFileName = files.first(where: { $0.hasSuffix(".json") }) else { throw CLIError.malformedSpecZip }
            let unzippedSpecFileURL = unzippedLocationURL.appendingPathComponent(specFileName)
            let destinationSpecFileURL = URL(fileURLWithPath: "./").appendingPathComponent(specFileName)
            if FileManager.default.fileExists(atPath: destinationSpecFileURL.path) {
                try FileManager.default.removeItem(at: destinationSpecFileURL)
            }
            try FileManager.default.moveItem(at: unzippedSpecFileURL, to: destinationSpecFileURL)
            result = .success(destinationSpecFileURL)
            print("Spec file downloaded to \(destinationSpecFileURL.path)")
        } catch let innerError {
            result = .failure(innerError)
        }
        return try result.get()
    }

    enum CLIError: Error, CustomStringConvertible {
        case httpError(HTTPURLResponse?)
        case malformedSpecZip

        var description: String {
            switch self {
            case .httpError(let response):
                if let response = response {
                    return "HTTP request failed. Status code \(response.statusCode)."
                } else {
                    return "Unknown error while performing HTTP request."
                }
            case .malformedSpecZip:
                return "The downloaded zip file didn't contain a json file."
            }
        }
    }
}
