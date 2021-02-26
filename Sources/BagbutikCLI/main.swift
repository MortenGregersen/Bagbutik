import ArgumentParser
import BagbutikGenerator
import Foundation

struct Generate: ParsableCommand {
    @Option(name: .shortAndLong, help: "The output folder for the generated files.")
    var outputPath = "./Output"

    @Argument(help: "The path to the App Store Connect OpenAPI Specification")
    var specPath = "./app-store-connect-openapi-spec.json"

    func run() throws {
        let specFileURL = URL(fileURLWithPath: specPath)
        let outputDirURL = URL(fileURLWithPath: outputPath)
        try Generator().generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)
    }
}

Generate.main()
