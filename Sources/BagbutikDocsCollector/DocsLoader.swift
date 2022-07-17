import Foundation

/// Errors that can occur when loading docs
public enum DocsLoaderError: Error {
    /// The documentation hasn't been loaded yet
    case documentationNotLoaded
}

public class DocsLoader {
    private let loadFile: (URL) throws -> Data
    internal var identifierBySchemaName: [String: String]?
    internal var documentationById: [String: Documentation]?

    public convenience init() {
        self.init(loadFile: { url in try Data(contentsOf: url) })
    }

    internal init(loadFile: @escaping (URL) throws -> Data) {
        self.loadFile = loadFile
    }

    internal convenience init(identifierBySchemaName: [String: String]? = nil, documentationById: [String: Documentation]? = nil) {
        self.init()
        self.identifierBySchemaName = identifierBySchemaName
        self.documentationById = documentationById
    }

    public func loadDocs(documentationDirURL: URL) throws {
        let identifierBySchemaNameData = try loadFile(documentationDirURL.appendingPathComponent(DocsFilename.mapping.filename))
        let documentationByIdData = try loadFile(documentationDirURL.appendingPathComponent(DocsFilename.documentation.filename))
        let jsonDecoder = JSONDecoder()
        self.identifierBySchemaName = try jsonDecoder.decode([String: String].self, from: identifierBySchemaNameData)
        self.documentationById = try jsonDecoder.decode([String: Documentation].self, from: documentationByIdData)
    }

    public func resolveDocumentationForSchema(named schemaName: String) throws -> Documentation? {
        guard let identifierBySchemaName, let documentationById else { throw DocsLoaderError.documentationNotLoaded }
        guard let identifier = identifierBySchemaName[schemaName],
              let documentation = documentationById[identifier] else {
            return nil
        }
        return documentation
    }

    public func resolveDocumentationForSchema(withDocsUrl docsUrl: String) throws -> Documentation? {
        guard let documentationById else { throw DocsLoaderError.documentationNotLoaded }
        let identifier = self.createDocumentationId(fromUrl: docsUrl)
        guard let documentation = documentationById[identifier] else { return nil }
        return documentation
    }

    public func resolveDocumentationForSchema(withId identifier: String) throws -> Documentation? {
        guard let documentationById else { throw DocsLoaderError.documentationNotLoaded }
        guard let documentation = documentationById[identifier] else { return nil }
        return documentation
    }

    private func createDocumentationId(fromUrl url: String) -> String {
        url.replacingOccurrences(of: "https://developer.apple.com", with: "doc://com.apple.documentation")
    }
}
