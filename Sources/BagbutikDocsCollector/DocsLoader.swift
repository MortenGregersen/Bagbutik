import Foundation

/// Errors that can occur when loading docs
public enum DocsLoaderError: Error {
    /// The documentation hasn't been loaded yet
    case documentationNotLoaded
}

public class DocsLoader {
    private let fileManager: TestableFileManager
    private var identifierBySchemaName: [String: String]?
    private var documentationById: [String: Documentation]?

    public convenience init() {
        self.init(fileManager: FileManager.default)
    }

    internal init(fileManager: TestableFileManager) {
        self.fileManager = fileManager
    }

    public func loadDocs(documentationDirURL: URL) throws {
        let identifierBySchemaNameData = try Data(contentsOf: documentationDirURL.appendingPathComponent(DocsFilename.mapping.filename))
        let documentationByIdData = try Data(contentsOf: documentationDirURL.appendingPathComponent(DocsFilename.documentation.filename))
        let jsonDecoder = JSONDecoder()
        self.identifierBySchemaName = try jsonDecoder.decode([String: String].self, from: identifierBySchemaNameData)
        self.documentationById = try jsonDecoder.decode([String: Documentation].self, from: documentationByIdData)
    }

    public func resolveDocumentationForSchema(named schemaName: String) throws -> Documentation? {
        guard let identifierBySchemaName, let documentationById else {
            throw DocsLoaderError.documentationNotLoaded
        }
        guard let identifier = identifierBySchemaName[schemaName],
              let documentation = documentationById[identifier] else {
            return nil
        }
        return documentation
    }
}
