import ArgumentParser
import BagbutikGenerator

struct Generate: ParsableCommand {
    @Option(name: .shortAndLong, help: "The output folder for the generated files.")
    var outputPath = "./Output"

    @Argument(help: "The path to the App Store Connect OpenAPI Specification")
    var specPath = "./app-store-connect-openapi-spec.json"

    func run() throws {
        try Generator.generateAll(specPath: specPath, outputPath: outputPath)
    }
}

Generate.main()
