import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when checking feedback
public enum FeedbackCheckerError: Error, Equatable {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The schema has no documentation
    case noDocumentationForSchema(String)

    /// The type of the file URL
    public enum FileURLType: Sendable {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the documentation directory
        case documentationDirUrl
    }
}

/// A type which checks if the manual patches for the spec is still needed
public class FeedbackChecker {
    private let loadOriginalSpec: LoadSpec
    private let loadPatchedSpec: LoadSpec
    private let docsLoader: DocsLoader
    private let print: (String) -> Void

    /// Initialize a new feedback checker
    public convenience init() {
        let loadOriginalSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            spec.flattenIdenticalSchemas()
            return spec
        }
        let loadPatchedSpec: LoadSpec = { fileUrl in
            var spec = try loadOriginalSpec(fileUrl)
            try spec.applyManualPatches()
            return spec
        }
        self.init(loadOriginalSpec: loadOriginalSpec, loadPatchedSpec: loadPatchedSpec, docsLoader: DocsLoader(), print: { Swift.print($0) })
    }

    init(loadOriginalSpec: @escaping LoadSpec, loadPatchedSpec: @escaping LoadSpec, docsLoader: DocsLoader, print: @escaping (String) -> Void) {
        self.loadOriginalSpec = loadOriginalSpec
        self.loadPatchedSpec = loadPatchedSpec
        self.docsLoader = docsLoader
        self.print = print
    }

    /**
     Load a spec file and check if the applied patches are still needed

     - Parameters:
        - specFileURL: The file URL to load the spec from
        - documentationDirURL: The file URL for the directory containing the fetched documentation
     */
    public func checkFeedback(specFileURL: URL, documentationDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw FeedbackCheckerError.notFileUrl(.specFileURL) }
        guard documentationDirURL.isFileURL else { throw FeedbackCheckerError.notFileUrl(.documentationDirUrl) }
        print("🔍 Loading spec \(specFileURL.path)...")
        let originalSpec = try loadOriginalSpec(specFileURL)
        let patchedSpec = try loadPatchedSpec(specFileURL)

        print("🔍 Loading docs \(documentationDirURL.path)...")
        try await docsLoader.loadDocs(documentationDirURL: documentationDirURL)
        try await docsLoader.applyManualDocumentation()

        var schemasNeedingPatching = [String]()
        var schemasNotNeedingPatching = [String]()
        for schema in patchedSpec.patchedSchemas {
            guard let documentation = try await self.docsLoader.resolveDocumentationForSchema(named: schema.name) else {
                throw FeedbackCheckerError.noDocumentationForSchema(schema.name)
            }
            let packageName = try DocsLoader.resolvePackageName(for: documentation)
            let unpatchedSchema = originalSpec.components.schemas[schema.name]!
            let unpatchedModel = try await Generator.generateModel(for: unpatchedSchema, packageName: packageName, otherSchemas: originalSpec.components.schemas, docsLoader: self.docsLoader)
            let patchedModel = try await Generator.generateModel(for: schema, packageName: packageName, otherSchemas: patchedSpec.components.schemas, docsLoader: self.docsLoader)
            if unpatchedModel == patchedModel {
                schemasNotNeedingPatching.append(schema.name)
            } else {
                schemasNeedingPatching.append(schema.name)
            }
        }

        if !schemasNotNeedingPatching.isEmpty {
            print("🎉 Patching is no longer needed for:")
            schemasNotNeedingPatching.forEach {
                print("- \($0)")
            }
            if !schemasNeedingPatching.isEmpty {
                print("")
            }
        }
        if !schemasNeedingPatching.isEmpty {
            print("😢 Patching is still needed for:")
            schemasNeedingPatching.forEach {
                print("- \($0)")
            }
        }
    }
}
