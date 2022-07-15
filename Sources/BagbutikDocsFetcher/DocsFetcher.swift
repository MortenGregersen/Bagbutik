import BagbutikSpecDecoder
import Foundation

/**
 A file manager which can perform the operations needed by the DocsFetcher

 This is just an interface already implemented by Foundation's FileManager, needed to enable unit testing.

 # Reference
 <https://developer.apple.com/documentation/foundation/filemanager>
 */
public protocol DocsFetcherFileManager {
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1415371-createdirectory>
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1410695-createfile>
    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1413590-removeitem>
    func removeItem(at URL: URL) throws
}

extension FileManager: DocsFetcherFileManager {}

/// Errors that can occur when generating
public enum DocsFetcherError: Error {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The schema has no documentation URL
    case noDocumentationUrl(String)
    /// The documentation file could not be created
    case couldNotCreateFile

    /// The type of the file URL
    public enum FileURLType {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
    }
}

extension DocsFetcherError: Equatable {}

/**
 An alias for a function loading a spec from a file URL

 - Parameter fileUrl: The file URL to load the spec from
 - Returns: A decoded Spec
 */
internal typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

public class DocsFetcher {
    private let loadSpec: LoadSpec
    private let fileManager: DocsFetcherFileManager
    private let print: (String) -> Void

    /// Initialize a new generator
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            try spec.applyAllFixups()
            return spec
        }
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, print: { Swift.print($0) })
    }

    internal init(loadSpec: @escaping LoadSpec, fileManager: DocsFetcherFileManager, print: @escaping (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.print = print
    }

    public func fetchAllDocs(specFileURL: URL, outputDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw DocsFetcherError.notFileUrl(.specFileURL) }
        print("🔍 Loading spec \(specFileURL)...")
        let spec = try loadSpec(specFileURL)

        var identifierBySchemaName = [String: String]()
        var documentationById = [String: Documentation]()
        for schema in spec.components.schemas.sorted(using: KeyPathComparator(\.key)).map(\.value) {
            print("Fetching documentation for \(schema.name)")
            let documentation = try await fetchDocumentation(for: schema)
            identifierBySchemaName[schema.name] = documentation.id
            documentationById[documentation.id] = documentation

            let documentationIdsToFetch = documentation.subDocumentationIds
                .filter { documentationId in !documentationById.keys.contains(where: { $0 == documentationId }) }
            let subDocumentations = try await fetchDocumentation(for: documentationIdsToFetch)
            for subDocumentation in subDocumentations {
                documentationById[subDocumentation.id] = subDocumentation
            }
        }
        print("Saving documentation to: \(outputDirURL.path)")
        try fileManager.createDirectory(at: outputDirURL, withIntermediateDirectories: true, attributes: nil)
        let documentationFileUrl = outputDirURL.appendingPathComponent("Documentation.json")
        let schemaIndexFileUrl = outputDirURL.appendingPathComponent("SchemaIndex.json")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard fileManager.createFile(atPath: documentationFileUrl.path, contents: try encoder.encode(documentationById), attributes: nil),
              fileManager.createFile(atPath: schemaIndexFileUrl.path, contents: try encoder.encode(identifierBySchemaName), attributes: nil)
        else {
            throw DocsFetcherError.couldNotCreateFile
        }
    }

    private func fetchDocumentation(for schema: Schema) async throws -> Documentation {
        guard let urlString = schema.url else {
            throw DocsFetcherError.noDocumentationUrl(schema.name)
        }
        let jsonUrl = createJsonDocumentationUrl(fromUrl: urlString)
        return try await fetchDocumentation(for: jsonUrl)
    }

    private func fetchDocumentation(for documentationIds: [String]) async throws -> [Documentation] {
        var documentations = [Documentation]()
        for documentationId in documentationIds {
            let jsonUrl = createJsonDocumentationUrl(fromId: documentationId)
            let documentation = try await fetchDocumentation(for: jsonUrl)
            documentations.append(documentation)
        }
        return documentations
    }

    private func fetchDocumentation(for url: URL) async throws -> Documentation {
        print("Fetching JSON documentation from: \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Documentation.self, from: data)
    }

    private func createJsonDocumentationUrl(fromUrl url: String) -> URL {
        URL(string: url
            .replacingOccurrences(
                of: "/documentation/",
                with: "/tutorials/data/documentation/")
            .appending(".json"))!
    }

    private func createJsonDocumentationUrl(fromId id: String) -> URL {
        URL(string: id
            .replacingOccurrences(
                of: "doc://com.apple.documentation/documentation",
                with: "https://developer.apple.com/tutorials/data/documentation")
            .appending(".json"))!
    }
}

enum Documentation: Codable {
    case `enum`(id: String, title: String, abstract: String?, values: [String: String])
    case object(id: String, title: String, abstract: String?, properties: [Property])

    var id: String {
        switch self {
        case .enum(let id, _, _, _):
            return id
        case .object(let id, _, _, _):
            return id
        }
    }

    var subDocumentationIds: [String] {
        switch self {
        case .enum:
            return []
        case .object(_, _, _, let properties):
            return properties
                .filter { $0.type.kind == "typeIdentifier" }
                .compactMap(\.type.identifier)
        }
    }

    private enum CodingKeys: CodingKey {
        case identifier
        case metadata
        case abstract
        case primaryContentSections
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Identifier.self, forKey: .identifier).url
        let metadata = try container.decode(Metadata.self, forKey: .metadata)
        let abstract = try container.decodeIfPresent([Abstract].self, forKey: .abstract)?.first?.text
        let contentSections = try container.decode([ContentSection].self, forKey: .primaryContentSections)
        if metadata.symbolKind == "tdef" /* Enum */,
           let values: [String: String] = contentSections.compactMap({ contentSection in
               guard case .possibleValues(let values) = contentSection else { return nil }
               return values
           }).first {
            self = .enum(id: id, title: metadata.title, abstract: abstract, values: values)
        } else if metadata.symbolKind == "dict" /* Object */,
                  let properties: [Property] = contentSections.compactMap({ contentSection in
                      guard case .properties(let properties) = contentSection else { return nil }
                      return properties
                  }).first {
            self = .object(id: id, title: metadata.title, abstract: abstract, properties: properties)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .metadata, in: container, debugDescription: "Unknown symbol kind: \(metadata.symbolKind)")
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .enum(let id, let title, let abstract, let values):
            try container.encode(Identifier(url: id), forKey: .identifier)
            try container.encode(Metadata(title: title, symbolKind: "tdef"), forKey: .metadata)
            if let abstract {
                try container.encode([Abstract(text: abstract)], forKey: .abstract)
            }
            try container.encode([ContentSection.possibleValues(values)], forKey: .primaryContentSections)
        case .object(let id, let title, let abstract, let properties):
            try container.encode(Identifier(url: id), forKey: .identifier)
            try container.encode(Metadata(title: title, symbolKind: "dict"), forKey: .metadata)
            if let abstract {
                try container.encode([Abstract(text: abstract)], forKey: .abstract)
            }
            try container.encode([ContentSection.properties(properties)], forKey: .primaryContentSections)
        }
    }

    private struct Identifier: Codable {
        let url: String
    }

    private struct Metadata: Codable {
        let title: String
        let symbolKind: String
    }

    private struct Abstract: Codable {
        let text: String
    }

    private enum ContentSection: Codable {
        case possibleValues([String: String])
        case properties([Property])
        case unused

        private enum CodingKeys: CodingKey {
            case kind
            case values
            case items
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let kind = try container.decode(String.self, forKey: .kind)
            if kind == "possibleValues" {
                let values = try container
                    .decode([Value].self, forKey: .values)
                    .reduce(into: [String: String]()) { partialResult, value in
                        partialResult[value.name] = value.content?.first?.text ?? ""
                    }
                self = .possibleValues(values)
            } else if kind == "properties" {
                let properties = try container.decode([Property].self, forKey: .items)
                self = .properties(properties)
            } else if kind == "content" || kind == "declarations" {
                self = .unused
            } else {
                throw DecodingError.dataCorruptedError(forKey: .kind, in: container, debugDescription: "Unkown kind '\(kind)'")
            }
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .possibleValues(let values):
                try container.encode("possibleValues", forKey: .kind)
                try container.encode(values.map { (key: String, value: String) in
                    Value(name: key, content: [.init(type: "text", inlineContent: [.init(text: value)])])
                }, forKey: .values)
            case .properties(let properties):
                try container.encode("properties", forKey: .kind)
                try container.encode(properties, forKey: .items)
            case .unused:
                try container.encode("content", forKey: .kind)
            }
        }

        private struct Value: Codable {
            let name: String
            let content: [Content]?
        }
    }

    struct Content: Codable {
        let type: String
        private let inlineContent: [InlineContent]
        var text: String? {
            if inlineContent.count > 1 {
                return inlineContent.compactMap { $0.text ?? $0.code }.joined(separator: " ")
            } else {
                return inlineContent.first?.text ?? inlineContent.first?.code
            }
        }

        init(type: String, inlineContent: [InlineContent]) {
            self.type = type
            self.inlineContent = inlineContent
        }

        struct InlineContent: Codable {
            let text: String?
            let code: String?

            init(text: String? = nil, code: String? = nil) {
                self.text = text
                self.code = code
            }
        }
    }

    struct Property: Codable {
        let name: String
        let type: PropertyType
        let required: Bool
        let content: Content?

        enum CodingKeys: CodingKey {
            case name
            case type
            case required
            case content
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: CodingKeys.name)
            let types = try container.decode([PropertyType].self, forKey: CodingKeys.type)
                .filter { $0.text != "[" && $0.text != "]" }
            guard types.count == 1 else { throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Multiple types for '\(name)'") }
            self.type = types.first!
            self.required = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.required) ?? false
            let contents = (try container.decodeIfPresent([Content].self, forKey: CodingKeys.content) ?? [])
                .filter { $0.text != nil }
            guard contents.count <= 1 else { throw DecodingError.dataCorruptedError(forKey: .content, in: container, debugDescription: "Multiple contents for '\(name)'") }
            self.content = contents.first
        }

        struct PropertyType: Codable {
            let kind: String
            let text: String
            let identifier: String?
        }
    }
}
